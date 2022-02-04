kubectl delete service  --namespace ratingsapp  ratings-web
kubectl apply  --namespace ratingsapp  -f ratings-web-service.yaml
kubectl apply  --namespace ratingsapp  -f ratings-web-ingress.yaml
