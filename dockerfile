FROM maven:3.9.4-amazoncorretto


WORKDIR /app
COPY ./pom.xml .
RUN mvn dependency:resolve
COPY . .
RUN mvn package

FROM openjdk:latest
WORKDIR /app
COPY --from=builder /app/target/EmployeeService.jar .
CMD ["java", "-jar", "EmployeeService.jar"]


