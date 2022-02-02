AKS_CLUSTER_NAME=k8demoCluster
ACR_NAME=acrVerityk8sdemo
az acr create  -g k8demo  -n $ACR_NAME  --sku Standard
cd ratings-api
az acr build  -g k8demo --registry acrVerityk8sdemo  --image ratings-api:v1 .
cd ~
cd ratings-web
az acr build -g k8demo --registry acrVerityk8sdemo  --image ratings-web:v1 .
az acr repository list  --name acrVerityk8sdemo   --output table
az aks update --name $AKS_CLUSTER_NAME  -g k8demo --attach-acr $ACR_NAME
