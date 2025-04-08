from rest_framework import serializers
from local_match_details.models import LocalMatchDetails

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=LocalMatchDetails
        fields='__all__'
