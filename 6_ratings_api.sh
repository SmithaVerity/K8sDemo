#Check ratings-api-deployment.yaml file before excecuting this code
#IMPORTANT: update the Azure Container registry path with your own repository
kubectl apply --namespace ratingsapp-scale -f ratings-api-deployment.yaml
kubectl get pods --namespace ratingsapp-scale -l app=ratings-api-scale -w
kubectl get deployment ratings-api-scale --namespace ratingsapp-scale
kubectl apply --namespace ratingsapp-scale -f ratings-api-service.yaml
kubectl get service ratings-api-scale --namespace ratingsapp-scale
kubectl get endpoints ratings-api-scale --namespace ratingsapp-scale
