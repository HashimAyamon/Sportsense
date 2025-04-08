from django.shortcuts import render
from local_match_details.models import LocalMatchDetails
import datetime

# Create your views here.

def manage_locmatch(request):
    obj = LocalMatchDetails.objects.all()
    context = {
        'y': obj
    }
    return render(request,'local_match_details/manage local match details.html',context)

def dellll(request,idd):
    obj=LocalMatchDetails.objects.get(match_id=idd)
    obj.delete()
    return manage_locmatch(request)



def post_locmatch(request):
    obk=""
    if request.method=="POST":
        obj=LocalMatchDetails()
        obj.date=datetime.datetime.today()
        obj.time= datetime.datetime.now()
        obj.sports_item=request.POST.get('spitem')
        obj.team_name= request.POST.get('tmnm')
        obj.score = request.POST.get('scr')
        obj.status = request.POST.get('sts')
        obj.location=request.POST.get('loc')
        obj.parking=request.POST.get('parking')
        obj.seat_no=request.POST.get('seatno')
        obj.statuss='pending'
        obj.save()
        obk = 'kk'
    context={
        'x':obk
    }
    return render(request,'local_match_details/post local match details.html',context)

def view_locmatch(request):
    obj = LocalMatchDetails.objects.all()
    context = {
        'y': obj
    }
    return render(request,'local_match_details/view local match details.html',context)

def management_manage(request):
    obj = LocalMatchDetails.objects.all()
    context = {
        'y': obj
    }
    return render(request,'local_match_details/manage local match managment.html',context)


def update(request,idd):
    obj = LocalMatchDetails.objects.get(match_id=idd)
    context = {
        'y': obj
    }
    if request.method=="POST":
        obj=LocalMatchDetails.objects.get(match_id=idd)
        obj.date=datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.sports_item=request.POST.get('spitem')
        obj.team_name= request.POST.get('tmnm')
        obj.score = request.POST.get('scr')
        obj.status = request.POST.get('sts')
        obj.location = request.POST.get('loc')
        obj.parking = request.POST.get('parking')
        obj.seat_no = request.POST.get('seatno')
        obj.save()
        return management_manage(request)
    return render(request,'local_match_details/update.html',context)

def delete(request,idd):
    obj=LocalMatchDetails.objects.get(match_id=idd)
    obj.delete()
    return management_manage(request)

from rest_framework.views import APIView,Response
from local_match_details.serializers import android_serialiser

class view_localmatch(APIView):
    def get(self,request):
        obj = LocalMatchDetails.objects.all()
        ser = android_serialiser(obj, many=True)
        return Response(ser.data)

class match(APIView):
    def get(self,request):
        obj = LocalMatchDetails.objects.all()
        ser = android_serialiser(obj, many=True)
        return Response(ser.data)

class mat(APIView):
    def post(self, request):
        obj = LocalMatchDetails.objects.filter(match_id=request.data['did'])
        ser = android_serialiser(obj, many=True)
        return Response(ser.data)

class fac(APIView):
    def get(self,request):
        obj = LocalMatchDetails.objects.all()
        ser = android_serialiser(obj, many=True)
        return Response(ser.data)