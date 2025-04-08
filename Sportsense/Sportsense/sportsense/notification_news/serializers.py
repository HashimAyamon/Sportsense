from rest_framework import serializers
from notification_news.models import NotificationNews

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=NotificationNews
        fields='__all__'
