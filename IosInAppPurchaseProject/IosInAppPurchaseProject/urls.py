"""CyberHealthProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/dev/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.contrib import admin
from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = patterns('',
                       (r'^verifyReceipt/', include('app.urls')),                       
                       # (r'^o/', include('oauth2_provider.urls', namespace='oauth2_provider')),
                       # (r'^admin/', include(admin.site.urls)),
                       # (r'^authorize/', include('rest_framework.urls', namespace='rest_framework')),                       
                       )

