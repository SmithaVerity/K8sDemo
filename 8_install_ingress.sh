helm repo update
helm install nginx-ingress ingress-nginx/ingress-nginx  --namespace ingress \
    --set controller.replicaCount=2 \
    --set controller.nodeSelector."kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux
kubectl get services --namespace ingress -w
