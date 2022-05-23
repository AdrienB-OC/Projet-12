from rest_framework.serializers import ModelSerializer
from .models import Client, Contract, ContractStatus, Event
from authentication.serializers import UserSerializer


class ClientSerializer(ModelSerializer):
    class Meta:
        model = Client
        fields = ['email', 'first_name', 'last_name', 'phone', 'mobile',
                  'company_name']


class ClientSerializerGet(ModelSerializer):
    sales_contact = UserSerializer()

    class Meta:
        model = Client
        fields = ['email', 'first_name', 'last_name', 'phone', 'mobile',
                  'company_name', 'sales_contact']


class ContractSerializer(ModelSerializer):
    class Meta:
        model = Contract
        fields = ['date_created', 'date_updated', 'amount', 'payment_due']


class ContractSerializerGet(ModelSerializer):
    sales_contact = UserSerializer()
    client = ClientSerializer()

    class Meta:
        model = Contract
        fields = '__all__'


class ContractStatusSerializer(ModelSerializer):
    class Meta:
        model = ContractStatus
        fields = '__all__'


class ContractStatusSerializerGet(ModelSerializer):
    contract = ContractSerializerGet()

    class Meta:
        model = ContractStatus
        fields = '__all__'


class EventSerializer(ModelSerializer):
    class Meta:
        model = Event
        fields = ['event_date', 'notes']


class EventSerializerGet(ModelSerializer):
    client = ClientSerializer()
    support_contact = UserSerializer()
    contract = ContractSerializer

    class Meta:
        model = Event
        fields = '__all__'
