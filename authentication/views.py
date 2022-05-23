from rest_framework import generics
from rest_framework.permissions import DjangoModelPermissions
from .serializers import RegisterSerializer
from .models import User


class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = [DjangoModelPermissions]
    serializer_class = RegisterSerializer
