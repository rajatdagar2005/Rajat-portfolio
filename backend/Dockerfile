# Use OpenJDK 17 for building the app
FROM openjdk:17-jdk-slim as build

WORKDIR /app

# Copy Gradle wrapper and project files
COPY gradlew ./gradlew
COPY gradle ./gradle
COPY build.gradle.kts settings.gradle.kts ./

# ✅ Ensure gradlew has proper permissions
RUN chmod +x gradlew

# Copy the rest of the backend source code
COPY . .

# ✅ Run gradlew with bash to avoid shell issues
RUN bash ./gradlew installDist

# Final stage: smaller runtime image
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy built files from previous stage
COPY --from=build /app/build/install/Portfolio-backend ./Portfolio-backend

# Expose Ktor default port
EXPOSE 8080

# Command to run the app
CMD ["./Portfolio-backend/bin/Portfolio-backend"]
