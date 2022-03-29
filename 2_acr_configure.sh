AKS_CLUSTER_NAME=k8demoCluster-scale
ACR_NAME=acrVerityk8sscale
az acr create  -g k8demo-scale  -n $ACR_NAME  --sku Standard
cd ratings-api
az acr build  -g k8demo-scale --registry acrVerityk8sscale  --image ratings-api:v1 .
cd ~
cd CloudTraining/ratings-web
az acr build -g k8demo-scale --registry acrVerityk8sscale  --image ratings-web:v1 .
az acr repository list  --name acrVerityk8sscale   --output table
cd ~
cd CloudTraining/
az aks update --name $AKS_CLUSTER_NAME  -g k8demo-scale --attach-acr $ACR_NAME
