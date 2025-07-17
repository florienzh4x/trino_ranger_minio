ARG HIVE_VERSION=4.0.1

FROM apache/hive:${HIVE_VERSION}

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    wget \
    htop \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# download jar

ARG HADOOP_AWS_JAR_VERSION
ARG MINIO_JAR_VERSION
ARG POSTGRESQL_JAR_VERSION
ARG AWS_BUNDLE_JAR_VERSION
ARG JARS_DIRECTORY

RUN wget --no-check-certificate "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_AWS_JAR_VERSION/hadoop-aws-$HADOOP_AWS_JAR_VERSION.jar" -O $JARS_DIRECTORY/hadoop-aws-$HADOOP_AWS_JAR_VERSION.jar
RUN wget --no-check-certificate "https://repo1.maven.org/maven2/io/minio/minio/$MINIO_JAR_VERSION/minio-$MINIO_JAR_VERSION.jar" -O $JARS_DIRECTORY/minio-$MINIO_JAR_VERSION.jar
RUN wget --no-check-certificate "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/$AWS_BUNDLE_JAR_VERSION/aws-java-sdk-bundle-$AWS_BUNDLE_JAR_VERSION.jar" -O $JARS_DIRECTORY/aws-java-sdk-bundle-$AWS_BUNDLE_JAR_VERSION.jar
RUN wget --no-check-certificate "https://repo1.maven.org/maven2/org/postgresql/postgresql/$POSTGRESQL_JAR_VERSION/postgresql-$POSTGRESQL_JAR_VERSION.jar" -O $JARS_DIRECTORY/postgresql-$POSTGRESQL_JAR_VERSION.jar


USER hive