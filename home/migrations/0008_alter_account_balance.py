# Generated by Django 5.0.3 on 2024-03-25 15:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0007_alter_account_client'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='balance',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True, verbose_name='Balance'),
        ),
    ]
