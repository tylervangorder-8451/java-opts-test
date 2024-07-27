# Getting Started

Quick experiment to test if passing JAVA_OPTS is working correctly when using Dockerfile.

You must have both Java and maven installed on your machine to run this project. My recommendation is to use SDKMAN to
install both Java and maven (https://sdkman.io/)

1. First build the application using the following command:

```shell
mvn clean package
```

2. Then run docker-compose up to start the application:

```shell
docker-compose up
```