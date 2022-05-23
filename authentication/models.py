from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    ADMIN = 'Admin'
    VENTE = 'Vente'
    SUPPORT = 'Support'
    CHOICES = ((ADMIN, 'Admin'),
               (VENTE, 'Vente'),
               (SUPPORT, 'Support'))

    email = models.EmailField(max_length=100, unique=True)
    username = models.CharField(max_length=100, default=email)
    first_name = models.CharField(max_length=25)
    last_name = models.CharField(max_length=25)
    role = models.CharField(max_length=32, choices=CHOICES)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name', 'role']
