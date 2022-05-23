from django.contrib import admin
from .models import User
from django.contrib.auth.admin import UserAdmin


class UserModelAdmin(UserAdmin):
    fieldsets = UserAdmin.fieldsets + (
        (
            'Role',  # you can also use None
            {
                'fields': (
                    'role',
                ),
            },
        ),
    )
    list_display = ('username', 'first_name', 'last_name', 'role')
    readonly_fields = ('last_login', 'is_superuser', 'date_joined')
    search_fields = ('email', 'role')

    def has_add_permission(self, request):
        if request.user.is_superuser:
            return True
        return request.user.role == 'Admin'

    def has_change_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if obj is None:
            return False
        if request.user.role == 'Admin':
            user = User.objects.get(email=obj)
            return not user.is_superuser

        return False

    def has_delete_permission(self, request, obj=None):
        if request.user.is_superuser:
            return True
        if obj is None:
            return False
        if request.user.role == 'Admin':
            user = User.objects.get(email=obj)
            return user.role != 'Admin'


admin.site.register(User, UserModelAdmin)
