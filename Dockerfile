# Use Java 21
FROM eclipse-temurin:21-jdk-alpine

RUN apt-get update && apt-get install -y wget gnupg && \
    wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list && \
    apt-get update && \
    apt-get install -y mongodb-mongosh

WORKDIR /app

# Copy your jar file
COPY app.jar app.jar

# Render passes the PORT env variable; Java reads it at runtime
CMD ["sh", "-c", "java -jar app.jar"]
