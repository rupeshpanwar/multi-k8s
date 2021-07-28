docker build -t rupeshpanwar/multi-client:latest -t rupeshpanwar/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t rupeshpanwar/multi-server:latest -t rupeshpanwar/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t rupeshpanwar/multi-worker:latest -t rupeshpanwar/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push rupeshpanwar/multi-client:latest
docker push rupeshpanwar/multi-server:latest
docker push rupeshpanwar/multi-worker:latest

docker push rupeshpanwar/multi-client:$SHA
docker push rupeshpanwar/multi-server:$SHA
docker push rupeshpanwar/multi-worker:$SHA


kubectl apply -f k8s
kubectl set image deployments/server-deployment server=rupeshpanwar/multi-server:$SHA
kubectl set image deployments/client-deployment client=rupeshpanwar/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=rupeshpanwar/multi-worker:$SHA