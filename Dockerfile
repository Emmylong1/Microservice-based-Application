# Use the official OpenJDK base image
FROM openjdk:11

# Copy the JAR file to the container's working directory
COPY target/ ..

# Set the working directory within the container
WORKDIR /usr/app/

# Expose port 8085 for the Java application
EXPOSE 8085

# Run the Java application when the container starts
CMD ["java", "-jar", "talentplus-integration.jar"]