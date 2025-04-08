from django.http import HttpResponseRedirect
from django.shortcuts import render
from login.models import Login

# Create your views here.

def login(request):
    if request.method=="POST":
        name=request.POST.get('unm')
        pasw=request.POST.get('psw')
        obj=Login.objects.filter(username=name,password=pasw)
        tp=""
        for ob in obj:
            tp=ob.type
            uid=ob.u_id
            if tp=="admin":
                request.session['u_id']=uid
                return HttpResponseRedirect('/temp/admin/')
            elif tp=="local_match_managment":
                request.session['u_id'] = uid
                return HttpResponseRedirect('/temp/manager/')

            else:
                objlist="incorected username or password... please try again..."
                context = {
                    'msg' : objlist,
                }
                return render(request,'login/login.html', context)
    return render(request,'login/login.html')


from django.http import JsonResponse

def check(requst):
    un=requst.GET.get('un')
    objs=Login.objects.filter(username=un)
    res='not'
    # print('hello')
    if len(objs)>0:
        res='exist'
    msg = {

        'msg': res
    }
    return JsonResponse(msg)

from rest_framework.views import APIView,Response
from login.serializers import android_serialiser

class login_flutter(APIView):
    def get(self,request):
        ob = Login.objects.all()
        ser = android_serialiser(ob,many=True)
        return Response(ser.data)

    def post(self,request):
        username = request.data['username']
        password = request.data['password']
        ob = Login.objects.filter(username=username,password=password)
        ser = android_serialiser(ob,many=True)
        return Response(ser.data)


