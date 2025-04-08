from rest_framework import serializers
from notification_score.models import NotificationScore

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=NotificationScore
        fields='__all__'