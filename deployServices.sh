#run the repo add command directly in the ctl 
helm repo add bitnami1 https://charts.bitnami.com/bitnami
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami2
helm install ratings bitnami/mongodb  --namespace ratingsapp \
    --set auth.username=cldtraining,auth.password=cldtraining,auth.database=ratingsdb

kubectl create secret generic mongosecret --namespace ratingsapp \
    --from-literal=MONGOCONNECTION="mongodb://cldtraining:cldtraining@ratings-mongodb.ratingsapp:27017/ratingsdb"
kubectl describe secret mongosecret --namespace ratingsapp

#Check ratings-api-deployment.yaml file before excecuting this code
#IMPORTANT: update the Azure Container registry path with your own repository
kubectl apply --namespace ratingsapp -f ratings-api-deployment.yaml
kubectl get pods --namespace ratingsapp -l app=ratings-api -w
kubectl get deployment ratings-api --namespace ratingsapp
kubectl apply --namespace ratingsapp -f ratings-api-service.yaml
kubectl get service ratings-api --namespace ratingsapp
kubectl get endpoints ratings-api --namespace ratingsapp



#Check ratings-web-deployment.yaml file before excecuting this code
#IMPORTANT: update the Azure Container registry path with your own repository
kubectl apply --namespace ratingsapp -f ratings-web-deployment.yaml
kubectl get pods --namespace ratingsapp -l app=ratings-web -w
kubectl get deployment ratings-web --namespace ratingsapp
kubectl apply --namespace ratingsapp -f ratings-web-service.yaml
kubectl get service ratings-web --namespace ratingsapp -w


#Get Ingress
kubectl create namespace ingress
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

#Install Ingress

helm repo update
helm install nginx-ingress ingress-nginx/ingress-nginx  --namespace ingress \
    --set controller.replicaCount=2 \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux
kubectl get services --namespace ingress -w
