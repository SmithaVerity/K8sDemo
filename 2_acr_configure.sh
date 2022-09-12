AKS_CLUSTER_NAME=k8demoCluster
ACR_NAME=acrVerityk8sdemo
az acr create  -g k8demo  -n $ACR_NAME  --sku Standard
cd ratings-api
az acr build  -g k8demo --registry acrVerityk8sdemo  --image ratings-api:v1 .
cd ~
cd K8sDemo/ratings-web
az acr build -g k8demo --registry acrVerityk8sdemo  --image ratings-web:v1 .
az acr repository list  --name acrVerityk8sdemo   --output table
cd ~
cd K8sDemo/
az aks update --name $AKS_CLUSTER_NAME  -g k8demo --attach-acr $ACR_NAME
