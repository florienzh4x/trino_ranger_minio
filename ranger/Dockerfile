FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

CMD ["/bin/bash"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo \
    lsb-release \
    cmake \
    git \
    curl \
    wget \
    bc \
    python3 \
    python3-pip \
    python3-venv \
    maven \
    apt-transport-https \
    ca-certificates \
    gnupg \
    zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

RUN curl -s https://repos.azul.com/azul-repo.key | sudo gpg --dearmor -o /usr/share/keyrings/azul.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | sudo tee /etc/apt/sources.list.d/zulu.list
RUN sudo apt update -y && sudo apt install -y zulu11-jdk

WORKDIR /root

ENV JAVA_HOME=/usr/lib/jvm/zulu11-ca-amd64
ENV PATH=$PATH:$JAVA_HOME/bin

RUN wget -qO /root/postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.7.5.jar

RUN wget -qO /root/ranger-2.6.0-admin.tar.gz https://downloads.apache.org/ranger/2.6.0/services/admin/ranger-2.6.0-admin.tar.gz

RUN tar -xzf /root/ranger-2.6.0-admin.tar.gz && rm ranger-2.6.0-admin.tar.gz && mv /root/ranger-2.6.0-admin /root/ranger-admin

WORKDIR /root/ranger-admin

COPY ./config/ /root/ranger-admin/

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh