az aks update -g k8demo --name k8demoCluster  --enable-cluster-autoscaler --min-count 3 --max-count 5
kubectl get nodes -w
