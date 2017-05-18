#### Kubernetes based Jupyter Hub training enviroment for Scalable Machine Learning using Spark and Vora

A training environment based on Kubernetes that allows to launch applications within a few minutes. This document is currently
using the Google cloud environment, but it is designed to work everywhere (e.g. AWS, Azure, and soon on the SAP Cloud Platform).
Currently we support the  following topics:

         Apache Spark
         
         Apache Kafka (relevant for IoT scenarios and real-time machine learning applications)
         
         SAP Vora (all engines are supported incl. Vora vFlow;please note that we are utilizing a setup that
         was developed by the Vora team)
        
         Machine Learning (TensorFlow, Spark ML, Sci-Kit Learn, R, …)
         
         Advanced Scala (Scala is an ideal language for distributed data processing and a command
         of the language is beneficial to everyone who is actively working with Spark)
          
For the user interface,we are using Jupyter notebooks.The training environment has some nice features. After logging on with
an SAP account (using single-sign-on), every user gets his/her individual Jupyter environment.
They are  three separate content folders:
 
         Public Folder (read-only) - Containing training content and datasets
         
         Personal Folder - Users have their own personal (and private) persistent hard drives .
         
         Shared Folder - This is a shared drive to which everyone has read/write access to.It’s used for collaboration and 
         content sharing
         
Getting Started

 We’ll be using Google Container Engine (GKE), but this should work anywhere you have installed a Kubernetes cluster
 
  0. Clone the repository 
  
         git clone git@github.wdf.sap.corp:i033085/jupyterHub.git
         
  1. Set the Compute Zone for gcloud
  
         gcloud config set compute/zone us-west1-a
 
  2. Create a Container Engine Cluster with n nodes with kubernetes version 1.6.2 : 
  
         gcloud container clusters create jupyterhub --num-nodes=n --cluster-version=1.6.2
         
  3. Create Disk for training content and Datasets(read-only).This script creates a disk on the google cloud,attaches the disk to a provisioner instance and mounts the disk in the configured path
         sh make-disk.bash jupyterhub-public-ro-data 100GB
 
  4. You can now copy your Data-Sets to this disk as below (Optional): 
         gcloud compute copy-files ~/LOCAL-FILE-1 ~/LOCAL-FILE-2 provisioner-01:/mnt/disks/jupyterhub-public-ro-data 
  
  5. Create Disk for Shared Content (read-write)
         sh make-disk.bash jupyterhub-public-rw-data 100GB
  
  6. Create a namespace for Kubernetes
  
         kubectl create namespace jupyterhub 
     
