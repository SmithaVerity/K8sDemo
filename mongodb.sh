helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami
helm install ratings bitnami/mongodb  --namespace ratingsapp \
    --set auth.username=cldtraining,auth.password=cldtraining,auth.database=ratingsdb
	
kubectl create secret generic mongosecret   --namespace ratingsapp \
    --from-literal=MONGOCONNECTION="mongodb://cldtraining:cldtraining@ratings-mongodb.ratingsapp:27017/ratingsdb"
kubectl describe secret mongosecret --namespace ratingsapp
