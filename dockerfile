FROM maven:3.9.4-amazoncorretto AS builder
WORKDIR /app
COPY ./pom.xml .
RUN mvn dependency:resolve
COPY . .
RUN mvn clean package

FROM openjdk:latest
WORKDIR /app
COPY --from=builder /app/target/EmployeeService.jar .
CMD ["java", "-jar", "EmployeeService.jar"]


