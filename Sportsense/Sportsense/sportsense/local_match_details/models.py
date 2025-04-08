from django.db import models

# Create your models here.

class LocalMatchDetails(models.Model):
    match_id = models.AutoField(primary_key=True)
    date = models.DateField()
    time = models.TimeField()
    sports_item = models.CharField(max_length=45)
    team_name = models.CharField(max_length=45)
    score = models.CharField(max_length=45)
    status = models.CharField(max_length=45)
    statuss = models.CharField(max_length=45)
    location = models.CharField(max_length=45)
    seat_no = models.CharField(max_length=20)
    parking = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'local_match_details'

