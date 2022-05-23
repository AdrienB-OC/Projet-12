from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import DjangoModelPermissions
from rest_framework.exceptions import MethodNotAllowed
from django.core.exceptions import ObjectDoesNotExist

import datetime


from .models import Client, Contract, ContractStatus, Event
from .serializers import ClientSerializer, ContractSerializer, \
    ContractStatusSerializer, EventSerializer, EventSerializerGet, \
    ClientSerializerGet, ContractStatusSerializerGet, ContractSerializerGet
from authentication.models import User
from .permissions import IsSale, IsSupport


class ClientViewset(ModelViewSet):
    def get_permissions(self):
        if self.request.user.role == 'Vente':
            return [DjangoModelPermissions(), IsSale()]
        if self.request.user.role == 'Support':
            return [DjangoModelPermissions(), IsSupport()]
        return [DjangoModelPermissions(), ]

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return ClientSerializerGet
        return ClientSerializer

    def get_queryset(self):
        queryset = Client.objects.all()

        if 'name' in self.request.GET:
            try:
                queryset = queryset.filter(
                    last_name=self.request.GET['name'].title())
            except ObjectDoesNotExist:
                queryset = Client.objects.none()
                return queryset

        if 'email' in self.request.GET:
            try:
                queryset = queryset.filter(
                    email=self.request.GET['email'].lower())
            except ObjectDoesNotExist:
                queryset = Client.objects.none()
                return queryset

        return queryset

    def get(self, **kwargs):
        context = {}
        obj = Client.objects.all().filter(pk=kwargs['pk'])
        obj = obj[0]
        context['email'] = obj.email
        context['first_name'] = obj.first_name
        context['last_name'] = obj.last_name
        context['phone'] = obj.phone
        context['mobile'] = obj.mobile
        context['company_name'] = obj.company_name
        context['sales_contact'] = obj.sales_contact.pk

        return Response(context, status=200)

    def perform_create(self, serializer):
        data = self.request.data
        user = User.objects.get(email=data['sales_contact'])
        if serializer.is_valid():
            serializer.save(sales_contact=user)

    def put(self, request, **kwargs):
        try:
            pk = kwargs['pk']
        except KeyError:
            return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

        client = self.get_object(pk)
        serializer = ClientSerializer(client, data=request.data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request, **kwargs):
        try:
            pk = kwargs['pk']
        except KeyError:
            return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

        client = self.get_object(pk)
        serializer = ClientSerializer(client, data=request.data,
                                      partial=True)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=201)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def perform_destroy(self, instance):
        raise MethodNotAllowed("DELETE")


class ContractViewSet(ModelViewSet):
    def get_permissions(self):
        if self.request.user.role == 'Vente':
            return [DjangoModelPermissions(), IsSale()]
        if self.request.user.role == 'Support':
            return [DjangoModelPermissions(), IsSupport()]
        return [DjangoModelPermissions(), ]

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return ContractSerializerGet

        return ContractSerializer

    def get_queryset(self):
        queryset = Contract.objects.all()

        if 'email' in self.request.GET:
            try:
                client = Client.objects.get(
                    email=self.request.GET['email'].lower())
                queryset = queryset.filter(
                    client=client)
            except ObjectDoesNotExist:
                queryset = Contract.objects.none()
                return queryset

        if 'name' in self.request.GET:
            try:
                client = Client.objects.get(
                    last_name=self.request.GET['name'].title())
                queryset = queryset.filter(
                    client=client)
            except ObjectDoesNotExist:
                queryset = Contract.objects.none()
                return queryset

        if 'date' in self.request.GET:
            try:
                date = self.request.GET['date']
                datetime.datetime.strptime(date, '%Y-%m-%d %H:%M:%S')
            except ValueError:
                queryset = Contract.objects.none()
                return queryset
            try:
                queryset = queryset.filter(
                    date_created=self.request.GET['date'])
            except ObjectDoesNotExist:
                queryset = Contract.objects.none()
                return queryset

        if 'amount' in self.request.GET:
            try:
                queryset = queryset.filter(
                    amount=self.request.GET['amount'])
            except ObjectDoesNotExist:
                queryset = Contract.objects.none()
                return queryset

        return queryset

    def get(self, **kwargs):
        context = {}
        obj = Contract.objects.all().filter(pk=kwargs['pk'])
        obj = obj[0]
        context['sales_contact'] = obj.sales_contact.pk
        context['client'] = obj.client.pk
        context['date_created'] = obj.date_created
        context['date_updated'] = obj.date_updated
        context['amount'] = obj.amount
        context['payment_due'] = obj.payment_due

        return Response(context, status=200)

    def perform_create(self, serializer):
        data = self.request.data
        client = Client.objects.get(email=data['client'])
        contact = User.objects.get(email=data['sales_contact'])

        if serializer.is_valid():
            serializer.save(sales_contact=contact, client=client)

        last = Contract.objects.last()
        ContractStatus.objects.create(contract=last, status="Not Signed")

    def put(self, request, **kwargs):
        try:
            pk = kwargs['pk']
        except KeyError:
            return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

        contract = self.get_object(pk)
        serializer = ContractSerializer(contract, data=request.data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request, **kwargs):
        try:
            pk = kwargs['pk']
        except KeyError:
            return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

        contract = self.get_object(pk)
        serializer = ContractSerializer(contract, data=request.data,
                                        partial=True)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=201)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def perform_destroy(self, instance):
        raise MethodNotAllowed("DELETE")


class ContractStatusViewSet(ModelViewSet):
    def get_permissions(self):
        if self.request.user.role == 'Vente':
            return [DjangoModelPermissions(), IsSale()]
        if self.request.user.role == 'Support':
            return [DjangoModelPermissions(), IsSupport()]
        return [DjangoModelPermissions(), ]

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return ContractStatusSerializerGet
        return ContractStatusSerializer

    def get_queryset(self):
        queryset = ContractStatus.objects.all()

        if 'status' in self.request.GET:
            try:
                queryset = queryset.filter(
                    status=self.request.GET['status'].title())
            except ObjectDoesNotExist:
                queryset = ContractStatus.objects.none()
                return queryset

        return queryset

    def get(self, **kwargs):
        context = {}
        obj = ContractStatus.objects.all().filter(pk=kwargs['pk'])
        obj = obj[0]
        context['contract'] = obj.contract
        context['status'] = obj.status

        return Response(context, status=200)

    def put(self, request, **kwargs):
        try:
            pk = kwargs['pk']
        except KeyError:
            return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

        contract_status = self.get_object(pk)
        serializer = ContractStatusSerializer(contract_status,
                                              data=request.data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request, **kwargs):
        try:
            pk = kwargs['pk']
        except KeyError:
            return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

        contract_status = self.get_object(pk)
        serializer = ContractStatusSerializer(contract_status,
                                              data=request.data, partial=True)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=201)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def perform_destroy(self, instance):
        raise MethodNotAllowed("DELETE")


class EventViewSet(ModelViewSet):
    def get_permissions(self):
        if self.request.user.role == 'Vente':
            return [DjangoModelPermissions(), IsSale()]
        if self.request.user.role == 'Support':
            return [DjangoModelPermissions(), IsSupport()]
        return [DjangoModelPermissions(), ]

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return EventSerializerGet
        return EventSerializer

    def get_queryset(self):
        queryset = Event.objects.all()

        if 'date' in self.request.GET:
            try:
                date = self.request.GET['date']
                datetime.datetime.strptime(date, '%Y-%m-%d %H:%M:%S')
            except ValueError:
                queryset = Event.objects.none()
                return queryset
            try:
                queryset = queryset.filter(
                    event_date=self.request.GET['date'])
            except ObjectDoesNotExist:
                queryset = Event.objects.none()
                return queryset

        if 'email' in self.request.GET:
            try:
                client = Client.objects.get(
                    email=self.request.GET['email'].lower())
                queryset = queryset.filter(
                    client=client)
            except ObjectDoesNotExist:
                queryset = Event.objects.none()
                return queryset

        if 'name' in self.request.GET:
            try:
                client = Client.objects.get(
                    last_name=self.request.GET['name'].title())
                queryset = queryset.filter(
                    client=client)
            except ObjectDoesNotExist:
                queryset = Event.objects.none()
                return queryset

        return queryset

    def get(self, **kwargs):
        context = {}
        obj = Event.objects.all().filter(pk=kwargs['pk'])
        obj = obj[0]
        context['client'] = obj.client.pk
        context['date_created'] = obj.date_created
        context['date_updated'] = obj.date_updated
        context['support_contact'] = obj.support_contact
        context['event_status'] = obj.event_status
        context['event_status'] = obj.event_status
        context['event_date'] = obj.event_date
        context['notes'] = obj.notes

        return Response(context, status=200)

    def perform_create(self, serializer, **kwargs):
        data = self.request.data
        client = Client.objects.get(email=data['client'])
        contact = User.objects.get(email=data['support_contact'])

        if serializer.is_valid():
            serializer.save(event_status="Upcoming", support_contact=contact,
                            client=client)

    def put(self, request, **kwargs):
        try:
            pk = kwargs['pk']
        except KeyError:
            return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

        contract = self.get_object(pk)
        serializer = ContractSerializer(contract, data=request.data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request, **kwargs):
        try:
            pk = kwargs['pk']
        except KeyError:
            return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

        event = self.get_object(pk)
        serializer = EventSerializer(event, data=request.data,
                                     partial=True)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=201)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def perform_destroy(self, instance):
        raise MethodNotAllowed("DELETE")
