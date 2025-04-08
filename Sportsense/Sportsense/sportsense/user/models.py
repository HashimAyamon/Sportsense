from django.db import models

# Create your models here.

class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    phone = models.CharField(max_length=45)
    status = models.CharField(max_length=45)
    image = models.CharField(max_length=400)

    class Meta:
        managed = False
        db_table = 'user'

