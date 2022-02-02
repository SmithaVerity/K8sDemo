cd ratings-api
az acr build  -g k8demo --registry $ACR_NAME  --image ratings-api:v1 .
