#!/bin/bash
docker build -t soumay94/multi-client:latest -t soumay94/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t soumay94/multi-server:latest -t soumay94/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t soumay94/multi-worker:latest -t soumay94/multi-worker:$SHA -f ./worker/Dockerfule ./worker

docker push soumay94/multi-client:latest
docker push soumay94/multi-server:latest
docker push soumay94/multi-worker:latest

docker push soumay94/multi-client:$SHA
docker push soumay94/multi-server:$SHA
docker push soumay94/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=soumay94/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=soumay94/multi-worker:$SHA
kubectl set image deployments/client-deployment client=soumay94/multi-client:$SHA

