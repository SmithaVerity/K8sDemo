REGION_NAME=eastus
RESOURCE_GROUP=cnts-rg
SUBNET_NAME=cnts-subnet
VNET_NAME=cnts-vnet
AKS_CLUSTER_NAME=cntscluster
ACR_NAME=cntsacr
WORKSPACE=cntsworkspace


az group create   --name $RESOURCE_GROUP   --location $REGION_NAME
az network vnet create  --resource-group $RESOURCE_GROUP   --location $REGION_NAME   --name $VNET_NAME  --address-prefixes 10.0.0.0/8  --subnet-name $SUBNET_NAME   --subnet-prefixes 10.240.0.0/16
SUBNET_ID=$(az network vnet subnet show   --resource-group $RESOURCE_GROUP  --vnet-name $VNET_NAME --name $SUBNET_NAME  --query id -o tsv)	
VERSION=$(az aks get-versions  --location $REGION_NAME  --query 'orchestrators[?!isPreview] | [-1].orchestratorVersion'   --output tsv)

az aks create \
--resource-group $RESOURCE_GROUP \
--name $AKS_CLUSTER_NAME \
--vm-set-type VirtualMachineScaleSets \
--node-count 2 \
--load-balancer-sku standard \
--location $REGION_NAME \
--kubernetes-version $VERSION \
--network-plugin azure \
--vnet-subnet-id $SUBNET_ID \
--service-cidr 10.2.0.0/24 \
--dns-service-ip 10.2.0.10 \
--docker-bridge-address 172.17.0.1/16 \
--generate-ssh-keys --y

az aks get-credentials  --resource-group $RESOURCE_GROUP  --name $AKS_CLUSTER_NAME
kubectl get nodes
kubectl get namespace
kubectl create namespace ratingsapp

az acr create  -g $RESOURCE_GROUP  -n $ACR_NAME  --sku Standard
cd ratings-api
az acr build  -g $RESOURCE_GROUP --registry $ACR_NAME  --image ratings-api:v1 .
cd ~
cd K8sDemo/ratings-web
az acr build -g $RESOURCE_GROUP --registry $ACR_NAME  --image ratings-web:v1 .
az acr repository list  --name $ACR_NAME   --output table
cd ~
cd K8sDemo/
az aks update --name $AKS_CLUSTER_NAME  -g $RESOURCE_GROUP --attach-acr $ACR_NAME
