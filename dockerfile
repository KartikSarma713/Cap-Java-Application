FROM maven:3.9.4-amazoncorretto AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

FROM jetty:9.4
COPY --from=builder /app/target/maven-web-application.war /var/lib/jetty/webapps/root.war