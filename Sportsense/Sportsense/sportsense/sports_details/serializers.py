from rest_framework import serializers
from sports_details.models import SportsDetails

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=SportsDetails
        fields='__all__'