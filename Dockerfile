FROM docker.io/golang:1.25-alpine AS builder

RUN apk update --no-cache && \
  apk add curl && \
  curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin latest


WORKDIR /app
COPY . .

RUN trivy fs --exit-code 1 --severity HIGH,CRITICAL --no-progress /

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Final stage
FROM docker.io/alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/

COPY --from=builder /app/main .

CMD ["./main"]
