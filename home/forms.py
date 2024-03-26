from typing import Any, Optional
from django import forms
from django.db import transaction as db_transaction
from django.contrib.auth.hashers import make_password
from .models import Client, Account, AccountCurrent, AccountSaving, Transaction
import uuid

class ClientForm(forms.ModelForm):
    """
    Form for creating and updating Client instances. Includes logic for hashing passwords.
    """
    class Meta:
        model = Client
        fields = ['name', 'email', 'phone', 'address', 'city', 'state', 'zip_code', 'password']

    def save(self, commit: bool = True) -> Client:
        """Hashes the password before saving the Client instance."""
        user = super().save(commit=False)
        user.password = make_password(self.cleaned_data["password"])
        if commit:
            user.save()
        return user

class LoginForm(forms.Form):
    """Form for user login."""
    email = forms.EmailField()
    password = forms.CharField(widget=forms.PasswordInput)

class AccountForm(forms.ModelForm):
    """
    Form for creating Account instances, supports both saving and current account types
    with an atomic save operation.
    """
    class Meta:
        model = Account
        fields = ['balance', 'client']

    def generate_account_number(self) -> str:
        """Generates a 10-digit account number using UUID."""
        return str(uuid.uuid4().int)[:10]

    @db_transaction.atomic
    def save(self, commit: bool = True, account_type: Optional[str] = None, **kwargs) -> Any:
        account = super().save(commit=False)
        account.number_account = self.generate_account_number()

        client_id = kwargs.get('client_id')
        if client_id is None:
            raise ValueError("client_id is required")
        try:
            client = Client.objects.get(id=client_id)
        except Client.DoesNotExist:
            raise ValueError(f"Client with id {client_id} does not exist")

        account.client = client

        if commit:
            account.save()

        if account_type == 'saving':
            interest_rate = kwargs.get('interest_rate', 0)
            return AccountSaving.objects.create(account=account, interest_rate=interest_rate)
        elif account_type == 'current':
            limit = kwargs.get('limit', 0)
            return AccountCurrent.objects.create(account=account, limit=limit)
        return account

class AccountSavingForm(forms.ModelForm):
    """
    Form for creating and updating AccountSaving instances.
    """
    class Meta:
        model = AccountSaving
        fields = ['interest_rate']

class AccountCurrentForm(forms.ModelForm):
    """
    Form for creating and updating AccountCurrent instances.
    """
    class Meta:
        model = AccountCurrent
        fields = ['limit']

class TransactionForm(forms.ModelForm):
    """
    Form for creating and updating Transaction instances.
    """
    class Meta:
        model = Transaction
        fields = ['account', 'value', 'type']
