from django.shortcuts import render
from sports_details.models import SportsDetails
import datetime
# Create your views here.

def manage_sportsdet(request):
    obj = SportsDetails.objects.all()
    context = {
        'z': obj
    }
    return render(request,'sports_details/manage sports details.html',context)

def update_details(request,idd):
    obj = SportsDetails.objects.get(sports_id=idd)
    context = {
        'z': obj
    }
    if request.method=="POST":
        obj=SportsDetails.objects.get(sports_id=idd)
        obj.sports_item=request.POST.get('spitem')
        obj.team_name= request.POST.get('tmnm')
        obj.score = request.POST.get('scr')
        obj.status = request.POST.get('sts')
        # obj.link = request.POST.get('lnk')
        obj.save()
        return manage_sportsdet(request)
    return render(request,'sports_details/update.html',context)

def delete_det(request,idd):
    obj=SportsDetails.objects.get(sports_id=idd)
    obj.delete()
    return manage_sportsdet(request)

def post_sportsdet(request):
    obk = ""
    if request.method=="POST":
        obj=SportsDetails()
        obj.date = datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.sports_item=request.POST.get('spitem')
        obj.team_name= request.POST.get('tmnm')
        obj.score = request.POST.get('scr')
        obj.status = request.POST.get('sts')
        # obj.link = request.POST.get('lnk')
        obj.save()
        obk = 'kk'
    context = {
        'x': obk
    }
    return render(request,'sports_details/post sports details.html',context)

def view_sportsdet(request):
    obj = SportsDetails.objects.all()
    context = {
        'z': obj
    }
    return render(request,'sports_details/view sports details.html',context)

from rest_framework.views import APIView,Response
from sports_details.serializers import android_serialiser

class view_sprtdet(APIView):
    def get(self,request):
        obj=SportsDetails.objects.all()
        ser=android_serialiser(obj,many=True)
        return Response(ser.data)

