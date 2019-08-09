####Creating config file for redis

mkdir /etc/redis.d
cat >  /etc/redis.d/redis.conf << EOF
port              6379
daemonize         yes
save              60 1
bind              127.0.0.1
tcp-keepalive     300
dbfilename        dump.rdb
dir               ./
rdbcompression    yes

EOF


###Creating redis service file:
cat >  /etc/systemd/system/redis.service <<- "EOF"
[Unit]
Description="Redis server for the web counter"
Documentation=https://redis.io/
Requires=network-online.target
After=network-online.target
ConditionFileNotEmpty=/etc/redis/redis.conf

[Service]
User=vagrant
Group=vagrant
ExecStart=/usr/bin/redis-server /etc/redis.d/redis.conf --supervised systemd
ExecStop=/usr/bin/redis-cli shutdown
KillMode=process
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

###Enable the redis service
systemctl daemon-reload
systemctl start redis-server
systemctl enable redis-server



####Setting initional kv in redis needed for counting
#redis-cli set number 0

####Setting up django
# cd /home/vagrant
# django-admin startproject mysite
# cd mysite


# cat >  /home/vagrant/mysite/webcounter/views.py << EOF
# from django.http import HttpResponse
# import datetime
# import redis
# def index(request):

    
    
#      r = redis.Redis()
#      chislo = r.get("number").decode("utf-8")
#      chislo=int(chislo)
#      chislo=chislo + 1
#      html = "<html><body>You are visitor number %s.</body></html>" % chislo
#      r.mset({"number": chislo})
#      chislo = r.get("number").decode("utf-8")
#      return HttpResponse(html)

# EOF


# cat >  /home/vagrant/mysite/webcounter/urls.py  << EOF
# from django.urls import path

# from . import views

# urlpatterns = [
#     path('', views.index, name='index'),
# ]

# EOF




# cat >  /home/vagrant/mysite/mysite/urls.py << EOF
# from django.contrib import admin
# from django.urls import include, path

# urlpatterns = [
#     path('webcounter/', include('webcounter.urls')),
#     path('admin/', admin.site.urls),
# ]

# EOF