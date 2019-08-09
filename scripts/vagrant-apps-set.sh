####Coping django config files
cp /vagrant/django-config/mysite/setting.py  ~/web-counter-project/webcounter/settings.py 
cp /vagrant/django-config/webcounter/views.py ~/web-counter-project/webcounter_app/views.py
cp /vagrant/django-config/webcounter/urls.py ~/web-counter-project/webcounter_app/urls.py
cp /vagrant/django-config/mysite/urls.py ~/web-counter-project/webcounter/urls.py
cp /vagrant/django-config/webcounter/index.html ~/web-counter-project/webcounter_app/templates/webcounter_app/index.html

####Coping gunicorn config files
sudo cp /vagrant/django-config/mysite/gunicorn.socket /etc/systemd/system/gunicorn.socket
sudo cp /vagrant/django-config/mysite/gunicorn.service  /etc/systemd/system/gunicorn.service 

####Enable gunicorn socket
sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket

####Coping nginx config files,setting blocks configuration files and restarting the service
sudo cp /vagrant/django-config/mysite/localhost /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
sudo service nginx restart