1) Crate jar project file. Go inside the folder project.
```
    cd <project-folder-name>
    mvn clean package
```
2) Add Dokerfile file to create Docker image with the following commands.
```
    FROM openjdk:17
    EXPOSE 8080
    ADD target/spring-boot-mysql-docker-compose-0.0.1-SNAPSHOT.jar spring-boot-mysql-docker-compose.jar
    ENTRYPOINT ["java", "-jar", "/spring-boot-mysql-docker-compose.jar"]
```
3) Create Doker image from Dockerfile
```
    docker build -t spring-docker-compose .
```
4) Create docker-compose.yml and add the following commadas to create spring boot applicationa and mysql containers.
```
---
version: "3"

services:
  application:
    image: spring-docker-compose
    networks:
      - springboot-db-net
    ports:
      - "8080:8080"
    depends_on: 
      - mysqldb

  mysqldb:
    image: mysql:5.7
    networks:
      - spring-docker-compose
    enviroment:
      - MYSQL_ROOT_PASSWORD: password
      - MYSQL_DATABASE: sbmdc
networks:
  - springboot-db-net:

volumes:
...
```
5) Run docker-compose
```
    docker-compose up -d
```
