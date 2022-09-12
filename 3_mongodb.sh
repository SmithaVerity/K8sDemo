helm repo remove bitnami
helm repo add bitnami  https://raw.githubusercontent.com/bitnami/charts/index/bitnami
helm search repo bitnami
helm install ratings bitnami/mongodb  --namespace ratingsapp \
    --set auth.username=cldtraining,auth.password=cldtraining,auth.database=ratingsdb
