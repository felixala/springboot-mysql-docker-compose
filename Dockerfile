FROM openjdk:17
EXPOSE 8080
ADD target/spring-boot-mysql-docker-compose-0.0.1-SNAPSHOT.jar spring-boot-mysql-docker-compose.jar
ENTRYPOINT ["java", "-jar", "/spring-boot-mysql-docker-compose.jar"]