from rest_framework import permissions
from .models import Event, Client, Contract, ContractStatus


class IsSupport(permissions.BasePermission):
    def has_permission(self, request, view):
        return True

    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        if isinstance(obj, Event):
            return obj.support_contact == request.user

        return False


class IsSale(permissions.BasePermission):
    def has_permission(self, request, view):
        return True

    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        if isinstance(obj, Client) or isinstance(obj, Contract):
            return obj.sales_contact == request.user

        if isinstance(obj, ContractStatus):
            return obj.contract.sales_contact == request.user

        if isinstance(obj, Event):
            return obj.client.sales_contact == request.user

        return False
