# Use a lightweight, production-ready JRE
FROM eclipse-temurin:17-jre

# Create app directory
WORKDIR /app

# Copy your already-built JAR into the image
COPY app.jar app.jar

# Run the JAR
CMD ["java", "-jar", "app.jar"]
