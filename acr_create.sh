REGION_NAME=eastus
RESOURCE_GROUP=k8demo
SUBNET_NAME=k8-subnet
VNET_NAME=k8-vnet
AKS_CLUSTER_NAME=k8demoCluster
ACR_NAME=k8demoContainerDirectory
WORKSPACE=k8demoworkspace

az acr create  --resource-group $RESOURCE_GROUP  --location $REGION_NAME  \
	--name $ACR_NAME  --sku Standard

cd ratings-api
az acr build  --resource-group $RESOURCE_GROUP --registry $ACR_NAME  --image ratings-api:v1 .

cd ~
cd ratings-web
az acr build --resource-group $RESOURCE_GROUP  --registry $ACR_NAME  --image ratings-web:v1 .
az acr repository list  --name $ACR_NAME   --output table