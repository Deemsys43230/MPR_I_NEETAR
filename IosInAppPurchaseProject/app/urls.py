from django.conf.urls import url
from django.conf.urls import patterns, include, url
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework import permissions, routers, serializers, viewsets
from app import views


urlpatterns = patterns('CyberHealth.views',
	#==== kids AR ===
	url(r'^kidsar$', views.kidsar, name='kidsar')
	)
urlpatterns = format_suffix_patterns(urlpatterns, allowed=['json', 'html'])
