from django.urls import path, include
from .views import ContractViewSet, ContractStatusViewSet, ClientViewset, \
    EventViewSet
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'contract', ContractViewSet, basename='contract')
router.register(r'contract_status', ContractStatusViewSet,
                basename='contract_status')
router.register(r'client', ClientViewset, basename='client')
router.register(r'event', EventViewSet, basename='event')


urlpatterns = [
    path('', include(router.urls)),
]
