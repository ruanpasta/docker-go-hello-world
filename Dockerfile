FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -ldflags="-s -w" -o binary .

FROM scratch
COPY --from=builder /app/binary .
CMD ["./binary"]