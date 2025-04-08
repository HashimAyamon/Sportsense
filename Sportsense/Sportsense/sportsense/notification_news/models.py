from django.db import models

# Create your models here.

class NotificationNews(models.Model):
    news_id = models.AutoField(primary_key=True)
    date = models.DateField()
    time = models.DateTimeField()
    heading = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'notification_news'
