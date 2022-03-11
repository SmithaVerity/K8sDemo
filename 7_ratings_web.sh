kubectl apply --namespace ratingsapp -f ratings-web-deployment.yaml
kubectl get pods --namespace ratingsapp -l app=ratings-web -w
kubectl get deployment ratings-web --namespace ratingsapp
kubectl apply --namespace ratingsapp -f ratings-web-service.yaml
kubectl get service ratings-web --namespace ratingsapp -w
kubectl get endpoints ratings-web --namespace ratingsapp
