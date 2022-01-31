az acr create -g k8demo --sku Standard --name k8demoCR

cd ratings-api
az acr build  -g k8demo --registry k8demoCR  --image ratings-api:v1 .

cd ~
cd ratings-web
az acr build -g k8demo --registry k8demoCR  --image ratings-web:v1 .
az acr repository list  --name k8demoCR   --output table
