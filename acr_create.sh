
ACR_NAME=acrVerityk8sdemo

cd ratings-api
az acr build  -g k8demo --registry $ACR_NAME  --image ratings-api:v1 .
cd ~
cd ratings-web
az acr build -g k8demo --registry $ACR_NAME  --image ratings-web:v1 .
az acr repository list  --name $ACR_NAME   --output table
