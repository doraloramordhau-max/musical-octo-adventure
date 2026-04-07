FROM golang:1.21-alpine
RUN apk add --no-cache gcc musl-dev
WORKDIR /app
COPY . .
RUN go mod init myapp || true
RUN go mod tidy || true
RUN CGO_ENABLED=1 GOOS=linux go build -o main .
CMD ["./main"]