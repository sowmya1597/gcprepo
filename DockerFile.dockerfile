FROM eclipse-temurin:17-alpine

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for the application
RUN mkdir /app

# Copy the application files into the container
COPY . /app

# Set the working directory to the application directory
WORKDIR /app

# Build the application using Maven
RUN mvn clean install -Dskiptests

# Copy entrypoint.sh into the container
COPY entrypoint.sh /

# Set entrypoint to entrypoint.sh
RUN chmod 755 ./docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]