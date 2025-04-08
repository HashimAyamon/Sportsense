from django.db import models


# Create your models here.

class Facilities(models.Model):
    facilities_id = models.AutoField(primary_key=True)
    seat = models.CharField(max_length=45)
    parking = models.CharField(max_length=45)
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'facilities'

