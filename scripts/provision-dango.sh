####Installing needed packets
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv

####Creating and configuring the Django Project
mkdir ~/web-counter-project
cd ~/web-counter-project
##Creting virtual enviroment for the django project
virtualenv web-counter-project-env
source web-counter-project-env/bin/activate
##Installing django and redis into the virtual enviroment
pip install django gunicorn redis

django-admin.py startproject webcounter ~/web-counter-project
####Without this line `manage.py collectstatic` failes
echo "STATIC_ROOT = os.path.join(BASE_DIR, 'static/')" >> ~/web-counter-project/webcounter/settings.py

~/web-counter-project/manage.py makemigrations
~/web-counter-project/manage.py migrate
~/web-counter-project/manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('vagrant', 'admin@example.com', 'adminpass')"
~/web-counter-project/manage.py collectstatic


####Configuring the Django application
 cd ~/web-counter-project
 ./manage.py startapp webcounter_app 
mkdir -p ~/web-counter-project/webcounter_app/templates/webcounter_app
deactivate