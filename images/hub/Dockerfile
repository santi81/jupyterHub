#FROM debian:jessie

FROM ubuntu:16.04
RUN apt-get update

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      git \
      libcurl4-openssl-dev \
      libssl-dev \
      python3 \
      python3-dev \
      python3-setuptools \
      python3-pip && \
     apt-get purge && apt-get clean

RUN pip3 install --upgrade pip

#RUN pip3 install --no-cache-dir jupyterhub==0.7.2 oauthenticator==0.5.1 jupyterhub-dummyauthenticator==0.1 jupyterhub-tmpauthenticator==0.1 statsd

RUN pip3 install --no-cache-dir \
         jupyterhub==0.7.2 \
         oauthenticator==0.5.1 \
         jupyterhub-dummyauthenticator==0.1 \
         jupyterhub-tmpauthenticator==0.1 \
         statsd==3.2.1 \
         pymysql==0.7.11

RUN pip3 --no-cache-dir install git+https://github.com/jupyterhub/kubespawner@228799af

#RUN python3 -m pip install oauthenticator
#RUN pip3 install  git+https://github.com/santi81/oauthenticator.git
RUN pip3 install  git+https://github.com/jupyterhub/oauthenticator.git

ENV  OAUTH2_TOKEN_URL https://oauthasservices-b4230efae.us1.hana.ondemand.com/oauth2/api/v1/token	
ENV  OAUTH2_AUTHORIZE_URL https://oauthasservices-b4230efae.us1.hana.ondemand.com/oauth2/api/v1/authorize?response_type=code&client_id=bd382640-c1c6-303c-9dcd-ea238fa6c4b9
ENV  OAUTH2_USERDATA_URL https://testservice1b4230efae.us1.hana.ondemand.com/testservice-1.0-SNAPSHOT/helloworld

ADD jupyterhub_config.py /srv/jupyterhub_config.py

WORKDIR /srv/jupyterhub

# JupyterHub API port
EXPOSE 8081

CMD jupyterhub --config /srv/jupyterhub_config.py --no-ssl
