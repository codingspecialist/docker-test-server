FROM openjdk:11-jdk-slim

WORKDIR /app

# COPY만 docker-compose 파일의 위치를 기반으로 작동함
COPY . .

# RUN은 현재 파일의 위치를 기반으로 작동함
RUN chmod +x ./gradlew
RUN ./gradlew clean build

ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]