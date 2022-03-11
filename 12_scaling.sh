kubectl apply  --namespace ratingsapp  -f ratings-api-hpa.yaml
kubectl get hpa --namespace ratingsapp -w
