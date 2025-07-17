ARG TRINO_VERSION=475

FROM trinodb/trino:${TRINO_VERSION}

ARG HADOOP_AWS_JAR_VERSION
ARG MINIO_JAR_VERSION
ARG AWS_BUNDLE_JAR_VERSION
ARG JARS_DIRECTORY

RUN curl -skL "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$HADOOP_AWS_JAR_VERSION/hadoop-aws-$HADOOP_AWS_JAR_VERSION.jar" -o $JARS_DIRECTORY/hadoop-aws-$HADOOP_AWS_JAR_VERSION.jar
RUN curl -skL "https://repo1.maven.org/maven2/io/minio/minio/$MINIO_JAR_VERSION/minio-$MINIO_JAR_VERSION.jar" -o $JARS_DIRECTORY/minio-$MINIO_JAR_VERSION.jar
RUN curl -skL "https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/$AWS_BUNDLE_JAR_VERSION/aws-java-sdk-bundle-$AWS_BUNDLE_JAR_VERSION.jar" -o $JARS_DIRECTORY/aws-java-sdk-bundle-$AWS_BUNDLE_JAR_VERSION.jar

RUN chmod 755 $JARS_DIRECTORY/*.jar
RUN chown trino:trino $JARS_DIRECTORY/*.jar