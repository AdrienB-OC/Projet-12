from django.contrib import admin
from .models import Client, Contract, ContractStatus, Event


class ClientAdmin(admin.ModelAdmin):
    list_display = ('email', 'first_name', 'last_name', 'company_name',
                    'phone', 'mobile')
    readonly_fields = ('date_created', 'date_updated')
    search_fields = ('first_name', 'last_name', 'company_name')

    fieldsets = (
        ('Client Information', {
            'fields': (
                'first_name',
                'last_name',
                'company_name',
            ),
        }),
        ('Contact', {
            'fields': (
                'email',
                'phone',
                'mobile',
            )
        }),
        ('Sales Manager', {
            'fields': (
                'sales_contact',
            )
        }),
        ('Added/Updated', {
            'fields': (
                'date_created',
                'date_updated'
            )
        }),
    )

    def has_view_permission(self, request, obj=None):
        return True

    def has_add_permission(self, request):
        if request.user.is_superuser:
            return True
        return request.user.role == ('Admin' or 'Vente')

    def has_delete_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        return request.user.role == 'Admin'

    def has_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if obj is None:
            return False
        if request.user.role == 'Vente':
            return obj.sales_contact == request.user
        if request.user.role == 'Admin':
            return True
        return False


class ContractAdmin(admin.ModelAdmin):
    list_display = ('client', 'sales_contact', 'amount', 'payment_due')
    search_fields = ('client__first_name', 'client__last_name',
                     'sales_contact__email', 'payment_due')
    fieldsets = (
        ('Contract Information', {
            'fields': (
                'client',
                'sales_contact',
            ),
        }),
        ('Contract Details', {
            'fields': (
                'amount',
                'payment_due',
            )
        }),
        ('Added/Updated', {
            'fields': (
                'date_created',
                'date_updated'
            )
        }),
    )

    def get_readonly_fields(self, request, obj=None):
        if obj is None:
            return []
        else:
            return ['client', 'date_created', 'date_updated']

    def has_view_permission(self, request, obj=None):
        return True

    def has_add_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if request.user.role == 'Admin' or request.user.role == 'Vente':
            return True
        return False

    def has_delete_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        return False

    def has_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if obj is None:
            return False
        if request.user.role == 'Vente':
            return obj.sales_contact == request.user
        if request.user.role == 'Admin':
            return True
        return False


class ContractStatusAdmin(admin.ModelAdmin):
    list_display = ('contract', 'status')
    search_fields = ('status', 'contract__client__first_name',
                     'contract__client__last_name')
    fieldsets = (
        ('Contract', {
            'fields': (
                'contract',
            )}),
        ('Status', {
            'fields': (
                'status',
            )}),
    )

    def get_readonly_fields(self, request, obj=None):
        if obj is None:
            return []
        else:
            return ['contract']

    def has_view_permission(self, request, obj=None):
        return True

    def has_add_permission(self, request):
        if request.user.is_superuser:
            return True
        if request.user.role == 'Admin' or request.user.role == 'Vente':
            return True
        return False

    def has_delete_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        return False

    def has_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if obj is None:
            return False
        if request.user.role == 'Vente':
            return obj.contract.sales_contact == request.user
        if request.user.role == 'Admin':
            return True
        return False


class EventAdmin(admin.ModelAdmin):
    list_display = ('event_status', 'event_date', 'client', 'support_contact')
    search_fields = ('event_status', 'client__first_name',
                     'client__last_name', 'support_contact__email')

    fieldsets = (
        ('Event Information', {
            'fields': (
                'client',
                'support_contact',
                'contract',
            ),
        }),
        ('Event Details', {
            'fields': (
                'event_status',
                'event_date',
                'notes',
            )
        }),
    )

    def get_readonly_fields(self, request, obj=None):
        if obj is None:
            return []
        else:
            return ['client']

    def has_view_permission(self, request, obj=None):
        return True

    def has_add_permission(self, request):
        if request.user.is_superuser:
            return True
        if request.user.role == 'Admin' or request.user.role == 'Vente':
            return True
        return False

    def has_delete_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        return False

    def has_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if obj is None:
            return False
        if request.user.role == 'Support':
            return obj.support_contact == request.user
        if request.user.role == 'Admin':

            return True
        return False


admin.site.register(Client, ClientAdmin)
admin.site.register(Contract, ContractAdmin)
admin.site.register(ContractStatus, ContractStatusAdmin)
admin.site.register(Event, EventAdmin)
