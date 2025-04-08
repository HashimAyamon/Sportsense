from django.shortcuts import render
from sports_news.models import SportsNews
import datetime
# Create your views here.

def manage_sportsnews(request):
    obj = SportsNews.objects.all()
    context = {
        'v': obj
    }
    return render(request,'sports_news/manage sports news.html',context)

def update_news(request,idd):
    obj = SportsNews.objects.get(news_id=idd)
    context = {
        'v': obj
    }
    if request.method=="POST":
        obj=SportsNews.objects.get(news_id=idd)
        obj.heading=request.POST.get('hdg')
        obj.content= request.POST.get('ctnt')
        obj.save()
        return manage_sportsnews(request)
    return render(request,'sports_news/update.html',context)

def delete_news(request,idd):
    obj=SportsNews.objects.get(news_id=idd)
    obj.delete()
    return manage_sportsnews(request)

def post_sportsnews(request):
    obk = ""
    if request.method=="POST":
        obj=SportsNews()
        obj.date = datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.heading=request.POST.get('hdg')
        obj.content= request.POST.get('ctnt')
        obj.save()
        obk = 'kk'
    context = {
        'x': obk
    }
    return render(request,'sports_news/post sports news.html',context)

def view_sportsnews(request):
    obj = SportsNews.objects.all()
    context = {
        'w': obj
    }
    return render(request,'sports_news/view sports news.html',context)


from pygooglenews import GoogleNews
import json
import time
from newsfetch.news import newspaper


# pip install news-fetch
# pip install pygooglenews
def index(request):
    nw = []
    if request.method=='POST':
        gn = GoogleNews()
        # top=gn.search()
        top=gn.search(request.POST.get('ne'))
        entries = top["entries"]
        count = 0
        poscnt=0
        negcnt=0
        # nw=[]
        for entry in entries:
            news = newspaper(entry["link"])
            if str(news.date_publish) != 'None':
                count = count + 1
                # print(news.date_publish,': hello',news.summary)
                # print(news.description)
                nw.append(str(news.date_publish)+ " : Sportsense, "+news.description)
            # else:
            #     count = count + 1
            #     print(news.date_publish, ':', news.summary)
            if count==5:
                break
    context={
             'n' : nw,
        }
    return render(request,'sports_news/view.html',context)

from rest_framework.views import APIView,Response
from sports_news.serializers import android_serialiser

class view_sprtnews(APIView):
    def get(self,request):
        obj=SportsNews.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)

