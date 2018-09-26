from django.http import JsonResponse
from django.http import HttpResponse
from django.conf import settings
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.decorators import parser_classes
from rest_framework.response import Response
from datetime import timedelta
import datetime,json
from django.utils import timezone
from datetime import date
from django.middleware.csrf import CsrfViewMiddleware
from django.conf import settings
import requests
import base64
from django.db import connection
import urllib2
import urllib
import contextlib
from django.core import serializers

# Get Random numbers
from django.utils.crypto import get_random_string
from django.core import serializers
from datetime import datetime
import json
#CSRF restriction Frameworks
from django.views.decorators.csrf import csrf_exempt, csrf_protect, requires_csrf_token
from django.core.context_processors import csrf



ITUNES_PRODUCTION_URL = "https://buy.itunes.apple.com/verifyReceipt"
ITUNES_SANDBOX_URL = "https://sandbox.itunes.apple.com/verifyReceipt"

@api_view(['POST'])
def kidsar(request):
	if request.method == 'POST':
		try:
			request_data=json.loads(request.body)
			receiptData=request_data.get('receiptdata')
			version=request_data.get('version')
			build=request_data.get('build')
			bundleId=request_data.get('bundleid')
			productId=request_data.get('productid')
			method = "POST"
			headers = {
			'Content-Type': 'application/json',
			}
			params=	{
			"receipt-data":receiptData,
			#Kids AR App In app Shared Secret
			"password":"db65af109e5648ea896cf194f9f24d21"
			}
			params = json.dumps(params)
			response = verifyReceipt(ITUNES_PRODUCTION_URL,method,headers,params)

			if response[0] == 0:
				# Server not reachable
				return HttpResponse(status=503,content_type="application/json")
			elif response[0] == 1:
				# Receipt Verification failed
				return JsonResponse({'status':'failure'})
			elif response[0] == 2:
				# Receipt Verification success
				print response
				response = validateResponse(response[1],bundleId,version,build,productId)
				if response == 1:
					return JsonResponse({'status':'success'})
				else:
					return JsonResponse({'status':'failure'})
			else:
				# Server not reachable
				return HttpResponse(status=503,content_type="application/json")
		except Exception, e:
			raise e
			return HttpResponse(status=500,content_type="application/json")
	else:
		return HttpResponse(status=405,content_type="application/json")


def verifyReceipt(url,method,headers,params):
	error_codes = [21000,21002,21003,21004,21005,21010]
	handler = urllib2.HTTPHandler()
	opener = urllib2.build_opener(handler)
	request = urllib2.Request(url,data=params,headers=headers)
	request.get_method = lambda: method
	try:
		connection = opener.open(request)
	except urllib2.HTTPError,e:
		connection = e
		print 'connection error'
		return [0]

	if connection.code == 200:
		data = connection.read()
		json_response = json.loads(data)
		status = json_response.get("status")
		print status
		if status == 0:
			# Success receipt validation
			return [2,json_response]
		elif status in error_codes:
			# unable to verify receipt
			return [1]
		elif status == 21007:
			# Sandbox Receipt sent to production
			return verifyReceipt(ITUNES_SANDBOX_URL,method,headers,params)
		elif status == 21008:
			# Production Receipt sent to sandbox
			return verifyReceipt(ITUNES_PRODUCTION_URL,method,headers,params)
		else:
			return [1]
	else:
		return [0]

def validateResponse(payload,appBundleId,appVersion,appBuild,appProductId):
	validationStatus = 0
	in_app = payload['receipt']['in_app']
	for p in in_app:
		if appProductId == str(p['product_id']):
			validationStatus = 1

	if validationStatus == 1 and appVersion == str(payload['receipt']['original_application_version']) and appBundleId == str(payload['receipt']['bundle_id']) and appBuild == str(payload['receipt']['application_version']) :
		validationStatus = 1
	else:
		validationStatus = 0

	return validationStatus



