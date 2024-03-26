from typing import Any, Dict, List

from django.contrib import admin
from django.db.models import Count, Q, QuerySet
from django.http import HttpRequest
from django.utils.translation import gettext_lazy as _

from .models import Client, Transaction

# Setting admin site headers
admin.site.site_header = "Administración de Mi Sitio"
admin.site.site_title = "Sitio de Admin"
admin.site.index_title = "Bienvenido al Portal de Administración"


class TransactionInline(admin.TabularInline):
    """
    Defines the inline admin settings for Transactions.
    """
    model = Transaction
    extra = 0


@admin.register(Client)
class ClientAdmin(admin.ModelAdmin):
    """
    Admin interface for managing clients. It includes inline transactions,
    a custom action to count transactions for a specific month, and filters.
    """
    list_display = ('name', 'email', 'phone', 'address', 'num_transactions_for_month')
    inlines = [TransactionInline, ]
    actions = ['custom_action']
    list_filter = (
        ('transaction__created_at', admin.DateFieldListFilter),
    )

    def get_queryset(self, request: HttpRequest) -> QuerySet:
        """
        Enhances the base queryset to annotate clients with the number of transactions
        for a specific month and year.
        """
        qs = super().get_queryset(request)
        year = request.GET.get('transaction__created_at__year', "2024")
        month = request.GET.get('transaction__created_at__month', "3")
        if year and month:
            qs = qs.annotate(
                num_transactions_for_month=Count(
                    'transaction',
                    filter=Q(transaction__created_at__year=year, transaction__created_at__month=month)
                )
            ).order_by('-num_transactions_for_month')
        return qs

    def num_transactions_for_month(self, obj: Client) -> int:
        """
        Returns the number of transactions for a client in a specific month.
        """
        return obj.num_transactions_for_month
    num_transactions_for_month.admin_order_field = 'num_transactions_for_month'
    num_transactions_for_month.short_description = _('Transacciones (Mes Específico)')

    def custom_action(self, request: HttpRequest, queryset: QuerySet) -> None:
        """
        A custom admin action to annotate and display the number of transactions per client
        for a specific month and year, based on admin filters.
        """
        queryset = queryset.annotate(
            num_transactions_for_month=Count(
                'transaction',
                filter=Q(transaction__created_at__year=request.GET.get('transaction__created_at__year', "2024"),
                         transaction__created_at__month=request.GET.get('transaction__created_at__month', "3"))
            )
        ).order_by('-num_transactions_for_month')

        response = ''
        for client in queryset:
            response += f'{client.name} - Transacciones: {client.num_transactions_for_month}\n'

        self.message_user(request, response)
    custom_action.short_description = _('Ordenar clientes por número de transacciones')
