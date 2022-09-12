helm repo add bitnami https://charts.bitnami.com/bitnami/index.yaml
helm search repo bitnami
helm install ratings bitnami/mongodb  --namespace ratingsapp \
    --set auth.username=cldtraining,auth.password=cldtraining,auth.database=ratingsdb
