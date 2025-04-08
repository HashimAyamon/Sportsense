from django.db import models

# Create your models here.

class Management(models.Model):
    management_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    phone_no = models.CharField(max_length=10)
    email = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    address = models.CharField(max_length=45)
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'management'
