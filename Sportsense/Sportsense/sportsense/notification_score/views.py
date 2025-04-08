from django.shortcuts import render
from notification_score.models import NotificationScore
import datetime
import requests
from user.models import User
# Create your views here.

def noti_score(request):
    obj = NotificationScore.objects.all()
    context = {
        'u': obj
    }
    return render(request,'notification_score/notification score.html', context)

def post_noti_score(request):
    if request.method=="POST":
        obj=NotificationScore()
        obj.date = datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.team_name=request.POST.get('tmnm')
        obj.score = request.POST.get('scr')
        obj.save()

        url = "https://www.fast2sms.com/dev/bulkV2"

        payload = "message=" +str(obj.team_name)+ "  |  "  +str(obj.score)+ "&language=english&route=q&numbers=6235294723"
        headers = {
            'authorization': "vg7pXoOAu86L9fmljsQR1MnyUPIbcwdYiBqErJG45CFNZ3Sa2tKnWGXaJk4gY0csA7vZjP5OyM6CDblh",
            'Content-Type': "application/x-www-form-urlencoded",
            'Cache-Control': "no-cache",
        }

        response = requests.request("POST", url, data=payload, headers=headers)

        print(response.text)
    return render(request,'notification_score/post notification score.html')

from rest_framework.views import APIView,Response
from notification_score.serializers import android_serialiser

class view_notiscore(APIView):
    def get(self,request):
        obj=NotificationScore.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)