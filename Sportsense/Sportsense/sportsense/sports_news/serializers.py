from rest_framework import serializers
from sports_news.models import SportsNews

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=SportsNews
        fields='__all__'