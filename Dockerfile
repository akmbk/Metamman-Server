# Use Java 21
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copy your jar file
COPY app.jar app.jar

# Render passes the PORT env variable; Java reads it at runtime
CMD ["sh", "-c", "java -jar app.jar"]
