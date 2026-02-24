# ----------- BUILDER STAGE -----------
FROM gradle:8.5-jdk21 AS builder

WORKDIR /app

# Copy project
COPY . .

# Build application
RUN gradle installDist --no-daemon

# ----------- RUNTIME STAGE -----------
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=builder /app .

EXPOSE 9555

ENTRYPOINT ["/app/build/install/hipstershop/bin/AdService"]
