# Certificate Manager
# Update your email id in the cluster-issuer.yaml


kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.6.1/cert-manager.crds.yaml
helm install cert-manager  --namespace cert-manager --version v1.6.1 jetstack/cert-manager
kubectl get pods --namespace cert-manager
kubectl apply  --namespace ratingsapp  -f cluster-issuer.yaml
