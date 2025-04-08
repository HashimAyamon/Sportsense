from django.db import models

# Create your models here.

class SportsNews(models.Model):
    news_id = models.AutoField(primary_key=True)
    date = models.DateField()
    time = models.TimeField()
    heading = models.CharField(max_length=45)
    content = models.CharField(max_length=100)
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'sports_news'
