# Stage 1: Compile and build the application
FROM amazoncorretto:17-al2-jdk AS build
WORKDIR /app
COPY . /app
RUN ./gradlew build

# Stage 2: Run the application
FROM openjdk:17-slim
WORKDIR /app
COPY --from=build /app/build/libs/demo-0.0.1-SNAPSHOT.jar /app
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
