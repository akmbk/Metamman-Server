# Use Java 21
FROM eclipse-temurin:21-jdk-alpine

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    ca-certificates

# 2. Get the MongoDB Key
RUN wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg

# 3. Add the Repo (Using 'jammy' which is highly compatible with Temurin images)
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-7.0.list

# 4. Final update and install
RUN apt-get update && apt-get install -y mongodb-mongosh

WORKDIR /app

# Copy your jar file
COPY app.jar app.jar

# Render passes the PORT env variable; Java reads it at runtime
CMD ["sh", "-c", "java -jar app.jar"]
