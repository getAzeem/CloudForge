# Use stable Python version instead of bleeding-edge 3.14
FROM --platform=$BUILDPLATFORM python:3.11-slim AS base

# =========================
# Builder Stage
# =========================
FROM base AS builder

# Install build dependencies
RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# =========================
# Runtime Stage
# =========================
FROM base

# Enable unbuffered logging
ENV PYTHONUNBUFFERED=1

WORKDIR /shoppingassistantservice

# Copy installed Python packages from builder
COPY --from=builder /usr/local/lib/python3.11/ /usr/local/lib/python3.11/
COPY --from=builder /usr/local/bin/ /usr/local/bin/

# Copy application code
COPY . .

# Application port
ENV PORT=8080
EXPOSE 8080

# Start application
ENTRYPOINT ["python", "shoppingassistantservice.py"]
