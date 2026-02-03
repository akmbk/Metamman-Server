# Step 1: Use an OpenJDK runtime
FROM eclipse-temurin:17-jdk-alpine

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy your jar file into the container
# Make sure your jar is actually named 'app.jar' in your repo or adjust accordingly
COPY app.jar app.jar

# Step 4: Expose the port (Render uses $PORT environment variable)
# We don't hardcode it here, but we let the app know it's available.

# Step 5: Run the application
# We use the shell form or a specific syntax to ensure $PORT is read correctly
CMD ["sh", "-c", "java -jar app.jar"]
