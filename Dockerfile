FROM docker.io/golang:1.25-alpine AS builder

WORKDIR /app
COPY . .
RUN go mod download

# Perform a security scan
RUN go install golang.org/x/vuln/cmd/govulncheck@latest
RUN govulncheck ./...

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/

COPY --from=builder /app/main .

CMD ["./main"]

