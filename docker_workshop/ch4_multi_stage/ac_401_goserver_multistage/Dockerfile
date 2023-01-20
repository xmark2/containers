FROM golang:1.19-alpine AS builder
WORKDIR /myapp
COPY main.go .
RUN go mod init feedme
RUN go build -o main .
FROM alpine:latest AS runtime
WORKDIR /myapp
COPY --from=builder /myapp/main .
ENTRYPOINT ["./main"]
EXPOSE 8080