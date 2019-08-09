from django.shortcuts import render
from datetime import datetime
import redis

def index(request):
     dateTimeObj = datetime.now()
     date = dateTimeObj.strftime("%d-%m-%Y %H:%M %H:%M:%S.%f")
     r = redis.Redis()
     if not r.exists("number"):
          r.mset({"number": 0 })
     chislo = r.get("number").decode("utf-8")
     chislo=int(chislo)
     chislo=chislo + 1
     r.mset({"number": chislo})
     return render(request, 'index.html', {'chislo':chislo , 'date':date})