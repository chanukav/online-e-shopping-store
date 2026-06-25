# Build stage
FROM maven:3.8.7-openjdk-18-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests && rm -rf /root/.m2/repository

# Run stage
FROM tomcat:9.0-jdk17-openjdk-slim
# Remove default webapps to keep image small and clean
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy the WAR file to ROOT.war to serve at root context
COPY --from=build /app/target/online-e-shopping-store.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
