# Test-Kube Project
#### In this project we are creating a deployment and expose it, using the minikube cluster
###

Before anything else, start the minikube cluster:
```sh
minikube start
```

###
To ensure we have a route to services deployed with type LoadBalancer, use this command:
```sh
minikube tunnel
```

###
Use the following command to configure your local environment to reuse the Docker daemon inside the minikube instance:
```sh 
eval $(minikube docker-env)
```
in that way we can use local images for kubernetes deployments.

###
To build the docker image, deploy and expose it in the cluster, run:
```sh
docker build -t test-kube/hello:1.0.0 -f Dockerfile .
kubectl apply -f kube.yaml
```

###
You can test the application by running this command:
```sh
curl localhost:8000/hello/Pietro
```

###
To delete the deployment call:
```sh
kubectl delete -f kube.yaml
```
