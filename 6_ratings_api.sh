#Check ratings-api-deployment.yaml file before excecuting this code
#IMPORTANT: update the Azure Container registry path with your own repository
kubectl apply --namespace ratingsapp -f ratings-api-deployment.yaml
kubectl get pods --namespace ratingsapp -l app=ratings-api -w
kubectl get deployment ratings-api --namespace ratingsapp
kubectl apply --namespace ratingsapp -f ratings-api-service.yaml
kubectl get service ratings-api --namespace ratingsapp
kubectl get endpoints ratings-api --namespace ratingsapp
