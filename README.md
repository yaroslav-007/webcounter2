
# Simple webcounter page

This is simple webcounter page written on python, provisioned by packer and vagrant. **Packer** is a free and open source tool for creating golden images while **vagrant** enables users to create and configure lightweight, reproducible, and portable development environments.
In our case we will use **packer** to create and virtualbox image that we will provision and configure with **vagrant**.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

You should install the following software

```
git -> https://git-scm.com/downloads
packer -> https://www.packer.io/downloads.html
vagrant -> https://www.vagrantup.com/downloads.html
virtualbox -> https://www.virtualbox.org/wiki/Downloads
```

### Getting the code

First we have to get the code. Open you terminal and perform the following command:
```
git clone https://github.com/yaroslav-007/webcounter2.git
```

This will download the project in your current directory in folder named **webcounter2**. Change you location to that folder.

```
cd webcounter2
```




## Building the virtual machine and run the code

We will build a base image, will add it in virtualbox and upload the setting into the created machine. As a result will have a simple web site running on **localhost** on port **8000** that counts the number of times the page was accessed.

### Break down into end to end tests


First we will use packer to create base virtualbox image for the project.

```
packer build bionic64.json
```

After the box is build we will use vagrant to run the box image we have created and import the settings for the app.
```
vagrant up
```
After vagrant builds the vm, you should be able to access http://localhost:8000.




## Built With

* [Django](https://www.djangoproject.com/) - The python web framework used
* [Python](https://www.python.org/) - Programming language
* [Nginx](https://www.nginx.com/) - Web server
* [Redis](https://redis.io/) - Database
* [Gunicorn](https://gunicorn.org/) - Python WSGI HTTP Server

## Used articles
* [Django’s Templates](https://djangobook.com/mdj2-django-templates/)
*  [Set Up Django, Nginx, and Gunicorn](https://www.cloudbooklet.com/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-18-04-in-google-cloud/)
*  [Django First app tutorial](https://docs.djangoproject.com/en/2.2/intro/tutorial01/)
*  [Packer code for Ubuntu 18.04 box](https://github.com/kikitux/packer_bionic64)
*  [How to Use Redis With Python](https://realpython.com/python-redis/)


