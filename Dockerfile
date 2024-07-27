ARG BUILD_DIR=/opt/app
ARG JAVA_IMAGE=docker-all.artifactory.8451.cloud/core-images/java
ARG JAVA_VERSION=17

#
# Build stage
#

FROM ${JAVA_IMAGE}:${JAVA_VERSION}-build AS builder

# Set a clean directory for the build operations.
ARG BUILD_DIR
WORKDIR ${BUILD_DIR}

# Copy in the jar file.
ARG JAR_FILE=e451-sds-example-java-service-*.jar
COPY ${JAR_FILE} application.jar

# Extract.
RUN set -eux \
    && java -Djarmode=layertools -jar application.jar extract

#
# App stage
#

ARG JAVA_IMAGE
ARG JAVA_VERSION
FROM ${JAVA_IMAGE}:${JAVA_VERSION} AS app

ARG BUILD_DIR

# Copy in runtime dependencies from build stage.
COPY --from=builder ${BUILD_DIR}/dependencies ./
COPY --from=builder ${BUILD_DIR}/snapshot-dependencies ./
COPY --from=builder ${BUILD_DIR}/spring-boot-loader ./
COPY --from=builder ${BUILD_DIR}/application ./

# Expose application ports.
EXPOSE 8080 8081

# Run the service.
ARG JAVA_OPTS
CMD java ${JAVA_OPTS} org.springframework.boot.loader.launch.JarLauncher
