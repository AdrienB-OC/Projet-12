# Generated by Django 4.0.4 on 2022-05-22 22:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='contract',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.contract'),
        ),
    ]
