
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=rupeshpanwar/multi-server-k8s-pgfix:$SHA
kubectl set image deployments/client-deployment client=rupeshpanwar/multi-client-k8s:$SHA
kubectl set image deployments/worker-deployment worker=rupeshpanwar/multi-worker-k8s:$SHA