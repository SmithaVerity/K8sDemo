LOADTEST_API_ENDPOINT=https://frontend.20.62.212.11.nip.io/api/loadtest		
az container create -g k8demo -n loadtest --cpu 4 --memory 1 --image azch/artillery --restart-policy Never --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"
az container create -g k8demo -n loadtest1 --cpu 4 --memory 1 --image azch/artillery --restart-policy Never --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"
az container create -g k8demo -n loadtest2 --cpu 2 --memory 1 --image azch/artillery --restart-policy Never --command-line "artillery quick -r 500 -d 120 $LOADTEST_API_ENDPOINT"
