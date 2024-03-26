from django.db import models

class Client(models.Model):
    """
    Represents a client with personal information and contact details.
    """
    name = models.CharField(max_length=100, verbose_name='Full Name', unique=True)
    email = models.EmailField(verbose_name='Email Address')
    password = models.CharField(max_length=500, verbose_name='Password', default='123456')
    phone = models.CharField(max_length=15, verbose_name='Phone Number')
    address = models.CharField(max_length=100, verbose_name='Street Address')
    city = models.CharField(max_length=50, verbose_name='City')
    state = models.CharField(max_length=10, verbose_name='State')
    zip_code = models.CharField(max_length=10, verbose_name='Zip Code')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Created At')
    updated_at = models.DateTimeField(auto_now=True, verbose_name='Updated At')

    def __str__(self):
        return f"{self.name} <{self.email}> <{self.phone}> <{self.address}>"

    def get_id(self) -> int:
        """
        Returns the ID of the client.
        """
        return self.id

    def get_client_details(self) -> list:
        """
        Returns a list of client details.
        """
        return [self.id, self.name, self.email, self.phone, self.address, self.city, self.state, self.zip_code]


class Account(models.Model):
    """
    Abstract base model for different types of accounts.
    """
    number_account = models.CharField(max_length=10, verbose_name='Account Number', unique=True)
    client = models.ForeignKey(Client, on_delete=models.CASCADE, verbose_name='Client')
    balance = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Balance', null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Created At')
    updated_at = models.DateTimeField(auto_now=True, verbose_name='Updated At')

    class Meta:
        abstract = False

    def deposit(self, value: float) -> None:
        """
        Deposits a value into the account balance.
        """
        self.balance += value
        self.save()

    def withdraw(self, value: float) -> None:
        """
        Withdraws a value from the account balance.
        """
        self.balance -= value
        self.save()


class AccountSaving(Account):
    """
    Represents a saving account with an interest rate.
    """
    interest_rate = models.DecimalField(max_digits=5, decimal_places=2, default="0.5", verbose_name='Interest Rate')

    def __str__(self):
        return self.number_account


class AccountCurrent(Account):
    """
    Represents a current account with a limit.
    """
    limit = models.DecimalField(max_digits=10, decimal_places=2, default="0.5", verbose_name='Limit')

    def __str__(self):
        return self.number_account


class Transaction(models.Model):
    """
    Represents a transaction related to an account.
    """
    account = models.ForeignKey(Account, on_delete=models.CASCADE, verbose_name='Account')
    value = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Value')
    type = models.CharField(max_length=1, verbose_name='Type')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Created At')

    def __str__(self):
        return f'{self.account} - {self.value}'

    def save(self, *args, **kwargs):
        """
        Overridden save method to apply transaction value to account balance
        based on transaction type before saving.
        """
        if self.type.upper() == 'D':
            self.account.deposit(self.value)
        elif self.type.upper() == 'W':
            self.account.withdraw(self.value)
        super().save(*args, **kwargs)


class Report(models.Model):
    """
    Represents a report related to an account for a specific month and year.
    """
    account = models.ForeignKey(Account, on_delete=models.CASCADE, verbose_name='Account')
    month = models.IntegerField(verbose_name='Month')
    year = models.IntegerField(verbose_name='Year')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Created At')

    @staticmethod
    def generate_report_month(account, month, year):
        """
        Placeholder method to generate a monthly report.
        """
        pass

    @staticmethod
    def generate_report_year(account, year):
        """
        Placeholder method to generate an annual report.
        """
        pass
