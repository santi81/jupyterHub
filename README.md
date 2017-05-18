# jupyterHub

A training environment based on Kubernetes that allows to launch applications within a few minutes. This document is currently
using the Google cloud environment, but it is designed to work everywhere (e.g. AWS, Azure, and soon on the SAP Cloud Platform).
Currently we support the  following topics:

1)       Apache Spark
2)       Apache Kafka (relevant for IoT scenarios and real-time machine learning applications)
3)       SAP Vora (all engines are supported incl. Vora vFlow;please note that we are utilizing a setup that
         was developed by the Vora team)
4)       Machine Learning (TensorFlow, Spark ML, Sci-Kit Learn, R, …)
5)       Advanced Scala (Scala is an ideal language for distributed data processing and a command
          of the language is beneficial to everyone who is actively working with Spark)
          
For the user interface,we are using Jupyter notebooks.The training environment has some nice features. After logging on with
an SAP account (using single-sign-on), every user gets his/her individual Jupyter environment.
They are  three separate content folders:
 
1) Public Folder (read-only) - Containing training content and datasets
2) Personal Folder - Users have their own personal (and private) persistent hard drives .
3) Shared Folder - This is a shared drive to which everyone has read/write access to.
It’s used for collaboration and content sharing
