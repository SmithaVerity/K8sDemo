#Check ratings-web-deployment.yaml file before excecuting this code
#IMPORTANT: update the Azure Container registry path with your own repository
kubectl apply --namespace ratingsapp -f ratings-web-deployment.yaml
kubectl get pods --namespace ratingsapp -l app=ratings-web -w
kubectl get deployment ratings-web --namespace ratingsapp
kubectl apply --namespace ratingsapp -f ratings-web-service.yaml
kubectl get service ratings-web --namespace ratingsapp -w
