az acr create -g k8demo -sku Standard -n k8demoContainerDirectory

cd ratings-api
az acr build  -g k8demo --registry k8demoContainerDirectory  --image ratings-api:v1 .

cd ~
cd ratings-web
az acr build -g k8demo --registry k8demoContainerDirectory  --image ratings-web:v1 .
az acr repository list  --name k8demoContainerDirectory   --output table
