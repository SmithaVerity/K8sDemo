kubectl create secret generic mongosecret-scale --namespace ratingsapp-scale \
    --from-literal=MONGOCONNECTION="mongodb://cldtraining-scale:cldtraining-scale@ratings-scale-mongodb.ratingsapp:27017/ratingsdb-scale"
kubectl describe secret mongosecret-scale --namespace ratingsapp-scale
