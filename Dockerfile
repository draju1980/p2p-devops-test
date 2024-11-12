# Stage 1: Build the Go application
FROM golang:1.23.2 AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod tidy
RUN go mod download

COPY *.go ./

RUN go build -o /p2p-devops-test

# Stage 2: Use the golang image for the final stage
FROM golang:1.23.2

WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /p2p-devops-test .

# Expose the necessary port
EXPOSE 3000

# Command to run the application
CMD ["./p2p-devops-test"]
