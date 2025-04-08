from django.db import models

# Create your models here.

class NotificationScore(models.Model):
    score_id = models.AutoField(primary_key=True)
    date = models.DateField()
    time = models.TimeField()
    team_name = models.CharField(max_length=45)
    score = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'notification_score'
