# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Ensure mvnw has executable permissions
RUN chmod +x ./mvnw

# Compile the application using Maven Wrapper
RUN ./mvnw package -Dmaven.test.skip=true

# Expose the application's port
EXPOSE 8080

# Set the command to run the application
CMD ["java", "-jar", "target/admin-0.0.1-SNAPSHOT.jar"]
