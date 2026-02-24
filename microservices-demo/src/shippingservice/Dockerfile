# ----------- BUILDER STAGE -----------
FROM --platform=$BUILDPLATFORM golang:1.25.6-alpine AS builder

ARG TARGETOS
ARG TARGETARCH

WORKDIR /src

# Install git (required for GOPROXY=direct)
RUN apk add --no-cache git

# Fix Go proxy IPv6 issue
ENV GOPROXY=direct

# Restore dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Build binary
ARG SKAFFOLD_GO_GCFLAGS
RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} CGO_ENABLED=0 \
    go build -ldflags="-s -w" -gcflags="${SKAFFOLD_GO_GCFLAGS}" \
    -o /go/bin/shippingservice .

# ----------- RUNTIME STAGE -----------
FROM gcr.io/distroless/static

WORKDIR /src

COPY --from=builder /go/bin/shippingservice /src/shippingservice

ENV APP_PORT=50051
ENV GOTRACEBACK=single

EXPOSE 50051

ENTRYPOINT ["/src/shippingservice"]
