az resource create --resource-type Microsoft.OperationalInsights/workspaces \
        --name k8demoworkspace  -g k8demo  --location eastus \
        --properties '{}' -o table

WORKSPACE_ID=$(az resource show --resource-type Microsoft.OperationalInsights/workspaces \
    -g k8demo \
    --name k8demoworkspace \
    --query "id" -o tsv)

az aks enable-addons  -g k8demo  --name k8demoCluster  --addons monitoring  --workspace-resource-id $WORKSPACE_ID	
kubectl apply  -f logreader-rbac.yaml
