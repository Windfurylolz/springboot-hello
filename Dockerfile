FROM maven:3.8.5-openjdk-11 AS maven_build
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package
#pull base image
FROM eclipse-temurin:11
#expose port 8080
EXPOSE 8080
#default command
CMD java -jar /data/springboot-hello-world.jar
#copy hello world to docker image from builder image
COPY --from=maven_build /tmp/target/springboot-hello-world.jar /data/springboot-hello-world.jar