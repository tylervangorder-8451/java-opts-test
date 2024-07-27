# Getting Started

Quick experiment to test if passing JAVA_OPTS is working correctly when using Dockerfile.

You must have both Java and maven installed on your machine to run this project. My recommendation is to use SDKMAN to
install both Java and maven (https://sdkman.io/)

1. First build the application using the following command:

```shell
mvn clean package
```

2. Adjust the JAVA_OPTS in the Dockerfile to the desired value, we are setting both max heap size and initial heap size to 512m:

`-Xmx512m -Xms512m`

3. Then run docker-compose to start the application:


`docker-compose up`

3. You can use the following URL to get the max heap sie of the JVM: 

`http://localhost:9001/actuator/metrics/jvm.memory.max?tag=area:heap`



