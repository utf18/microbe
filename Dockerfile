# builder image
FROM golang:1.11 as builder
WORKDIR /build
ADD . .
RUN go get ./... && \
    CGO_ENABLED=0 GOOS=linux go build -o simple

# image that runs the binary
FROM alpine:3.8
COPY --from=builder /build/simple /simple
RUN apk --no-cache add ca-certificates
CMD ["/simple"]