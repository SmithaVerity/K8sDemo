LOADTEST_API_ENDPOINT=https://frontend.20.62.212.11.nip.io/api/loadtest		
az container create -g k8demo -n loadtest --cpu 8 --memory 1 --image azch/artillery --restart-policy Never --command-line "artillery quick -r 1000 -d 120 $LOADTEST_API_ENDPOINT"
