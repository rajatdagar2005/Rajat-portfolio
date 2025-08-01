# Use OpenJDK 17 for building the app
FROM openjdk:17-jdk-slim as build

WORKDIR /app

# Copy Gradle wrapper and project files
COPY gradlew ./
COPY gradle ./gradle
COPY build.gradle.kts settings.gradle.kts ./

# Copy the rest of the backend source code
COPY . .

# Give execute permission to gradlew (important!)
RUN chmod +x gradlew

# Build the Ktor app
RUN ./gradlew installDist

# Final stage: smaller runtime image
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy built files from previous stage
COPY --from=build /app/build/install/Portfolio-backend ./Portfolio-backend

# Expose Ktor default port
EXPOSE 8080

# Command to run the app
CMD ["./Portfolio-backend/bin/Portfolio-backend"]
