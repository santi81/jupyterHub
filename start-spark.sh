#!/bin/bash

# Use the spark-master-controller.yaml file to create a replication controller running the Spark Master service
kubectl --namespace=jupyterhub create -f spark/spark-master-controller.yaml

# create a logical service endpoint that Spark workers can use to access the Master pod:
kubectl --namespace=jupyterhub create -f spark/spark-master-service.yaml

# Deploy the proxy controller 
kubectl --namespace=jupyterhub create -f spark/spark-ui-proxy-controller.yaml

# Use the spark-worker-controller.yaml file to create a replication controller that manages the worker pods.
kubectl --namespace=jupyterhub create -f spark/spark-worker-controller.yaml

