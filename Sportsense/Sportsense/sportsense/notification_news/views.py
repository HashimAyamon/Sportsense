from django.shortcuts import render
from notification_news.models import NotificationNews
import datetime
import requests

# Create your views here.

def noti_news(request):
    obj = NotificationNews.objects.all()
    context = {
        'v': obj
    }
    return render(request,'notification_news/notification news.html', context)

def post_noti_news(request):
    if request.method=="POST":
        obj=NotificationNews()
        obj.date = datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.heading=request.POST.get('hdg')
        obj.save()


        url = "https://www.fast2sms.com/dev/bulkV2"

        payload = "message=hello world &language=english&route=q&numbers=8075298302"
        headers = {
            'authorization': "key here",
            'Content-Type': "application/x-www-form-urlencoded",
            'Cache-Control': "no-cache",
        }

        response = requests.request("POST", url, data=payload, headers=headers)

        print(response.text)

    return render(request,'notification_news/post notification news.html')


from rest_framework.views import APIView,Response
from notification_news.serializers import android_serialiser

class view_notinews(APIView):
    def get(self,request):
        obj=NotificationNews.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)