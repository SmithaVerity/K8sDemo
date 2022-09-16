# ratings-web-service.yaml Change the last line service type to ClusterIP.
# ratings-web-ingress.yaml Change IP address
kubectl delete service  --namespace ratingsapp  ratings-web
kubectl apply  --namespace ratingsapp  -f ratings-web-service.yaml
kubectl apply  --namespace ratingsapp  -f ratings-web-ingress.yaml
