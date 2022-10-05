1) Crate jar project file. Go inside the folder project.
```
    cd <project-folder-name>
    mvn clean package -DskipTests
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
    docker build -t springboot-app .
```
4) Create docker-compose.yml and add the following commadas to create spring boot applicationa and mysql containers.
```
---
version: "3"
services:
  application:
    image: springboot-app
    ports:
      - "8080:8080"
    networks:
      - springboot-db-net
    depends_on:
      - mysqldb

  mysqldb:
    image: mysql:5.7
    networks:
      - springboot-db-net
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_DATABASE=sbmdc
    volumes:
      - app_data:/var/lib/mysql

networks:
  springboot-net:

volumes:
  app_data:
...
```
5) Run docker-compose
```
    docker-compose up -d
```
