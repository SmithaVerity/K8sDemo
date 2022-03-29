# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm search repo bitnami
helm install ratings-scale bitnami/mongodb  --namespace ratingsapp-scale --set auth.username=cldtraining-scale,auth.password=cldtraining-scale,auth.database=ratingsdb-scale
