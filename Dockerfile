FROM golang:1.21-alpine
WORKDIR /app
COPY . .
RUN go mod init myapp || true
RUN go mod tidy || true
RUN CGO_ENABLED=0 GOOS=linux go build -o main .
CMD ["./main"]