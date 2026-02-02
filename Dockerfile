# Use OpenJDK 17 image for running the Java app
FROM openjdk:17-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the pre-built JAR file into the container
COPY app.jar /app/app.jar

# Expose the port (just a hint, Render will assign the actual port)
EXPOSE 8080

# Run the pre-built JAR file
CMD ["java", "-jar", "app.jar"]
