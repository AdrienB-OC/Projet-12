from django.db import models
from authentication.models import User


class Client(models.Model):

    email = models.EmailField(max_length=100, unique=True)
    first_name = models.CharField(max_length=25)
    last_name = models.CharField(max_length=25)
    phone = models.CharField(max_length=20)
    mobile = models.CharField(max_length=20)
    company_name = models.CharField(max_length=250)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)
    sales_contact = models.ForeignKey(User, on_delete=models.CASCADE,
                                      related_name="client_support")

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Contract(models.Model):

    sales_contact = models.ForeignKey(User, on_delete=models.CASCADE,
                                      related_name="contract_support")
    client = models.ForeignKey(Client, on_delete=models.CASCADE,
                               related_name="contract_client")
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)
    amount = models.FloatField()
    payment_due = models.DateTimeField()

    def has_object_permission(self, request):
        return False

    def __str__(self):
        return f"{self.client} | Due : " \
               f"{self.payment_due}"


class ContractStatus(models.Model):
    NOTSIGNED = 'Not Signed'
    SIGNED = 'Signed'
    PAID = 'Paid'
    ABORTED = 'Aborted'
    CHOICES = (
        (NOTSIGNED, 'Not Signed'),
        (SIGNED, 'Signed'),
        (PAID, 'Paid'),
        (ABORTED, 'Aborted')
    )

    contract = models.OneToOneField(Contract, on_delete=models.CASCADE,
                                    primary_key=True)
    status = models.CharField(max_length=20, choices=CHOICES,
                              default=NOTSIGNED)


class Event(models.Model):
    UPCOMING = 'Upcoming'
    ONGOING = 'Ongoing'
    FINISHED = 'Finished'

    CHOICES = ((UPCOMING, 'Upcoming'),
               (ONGOING, 'Ongoing'),
               (FINISHED, 'Finished'))

    contract = models.OneToOneField(Contract, on_delete=models.CASCADE,
                                    null=True, related_name="event_contract")
    client = models.ForeignKey(Client, on_delete=models.CASCADE,
                               related_name="event_client")
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)
    support_contact = models.ForeignKey(User, on_delete=models.CASCADE,
                                        related_name="contact")
    event_status = models.CharField(max_length=32, choices=CHOICES,
                                    default=UPCOMING)
    event_date = models.DateTimeField()
    notes = models.CharField(max_length=250, blank=True)
