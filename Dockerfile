FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o binary .

FROM alpine:latest
COPY --from=builder /app/binary .
CMD ["./binary"]