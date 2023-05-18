FROM openjdk:11
COPY target/springboot-hello-world.jar springboot-hello-world.jar
ENTRYPOINT ["java","-jar","/springboot-hello-world.jar"]
