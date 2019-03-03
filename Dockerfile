FROM golang:1.12 as builder
WORKDIR /build
ADD . .
RUN go get ./... && \
    CGO_ENABLED=0 GOOS=linux go build -o simple

FROM alpine:3.9 as certs
RUN apk --no-cache add ca-certificates

FROM scratch
COPY --from=builder /build/simple /simple
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt 
ENTRYPOINT [ "/simple" ]