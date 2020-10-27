FROM golang:1.15 as builder
WORKDIR /build
ADD . .
RUN go get ./... && \
    CGO_ENABLED=0 GOOS=linux go build -o microbe

FROM alpine:3 as certs
RUN apk --no-cache add ca-certificates

FROM scratch
COPY --from=builder /build/microbe /microbe
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt 
ENTRYPOINT [ "/microbe" ]
