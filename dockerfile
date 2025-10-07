FROM maven:3.9.4-amazoncorretto

WORKDIR /app
COPY ./pom.xml .
RUN mvn dependency:resolve
COPY . .

RUN mvn package
CMD ["java", "-jar", "target/EmployeeService.jar"]


