cd ratings-api
az acr build  -g k8demo --registry acrVerityk8sdemo  --image ratings-api:v1 .
