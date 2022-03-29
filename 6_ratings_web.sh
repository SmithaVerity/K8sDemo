#Check ratings-web-deployment.yaml file before excecuting this code
#IMPORTANT: update the Azure Container registry path with your own repository
kubectl apply --namespace ratingsapp-scale -f ratings-web-deployment.yaml
kubectl get pods --namespace ratingsapp-scale -l app=ratings-web-scale -w
kubectl get deployment ratings-web-scale --namespace ratingsapp-scale
kubectl apply --namespace ratingsapp-scale -f ratings-web-service.yaml
kubectl get service ratings-web-scale --namespace ratingsapp-scale -w
