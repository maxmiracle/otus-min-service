FROM alpine/java:17.0.12-jre
RUN apk update && apk add bash
WORKDIR /app
COPY build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
EXPOSE 8000
