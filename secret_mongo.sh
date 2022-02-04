kubectl create secret generic mongosecret   --namespace ratingsapp \
    --from-literal=MONGOCONNECTION="mongodb://cldtraining:cldtraining@ratings-mongodb.ratingsapp:27017/ratingsdb"
kubectl describe secret mongosecret --namespace ratingsapp 
