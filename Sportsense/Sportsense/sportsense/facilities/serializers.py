from rest_framework import serializers
from facilities.models import Facilities

class android_serialiser(serializers.ModelSerializer):
    class Meta:
        model=Facilities
        fields='__all__'



