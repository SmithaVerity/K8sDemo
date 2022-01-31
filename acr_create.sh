CLIENTNAME=Verityk8sdemo$RANDOM
ACR_NAME=acr$CLIENTNAME

az acr create -g k8demo --sku Standard --name $ACR_NAME

cd ratings-api
az acr build  -g k8demo --registry $ACR_NAME  --image ratings-api:v1 .

cd ~
cd ratings-web
az acr build -g k8demo --registry $ACR_NAME  --image ratings-web:v1 .
az acr repository list  --name $ACR_NAME   --output table
