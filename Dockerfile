FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        unzip \
        apt-transport-https \
        software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_linux_amd64.zip -o tf.zip
RUN unzip -d /usr/local/bin/ tf.zip && rm tf.zip
