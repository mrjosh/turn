FROM golang:1.16-alpine AS builder

LABEL maintainer="Alireza Josheghani <josheghani.dev@gmail.com>"

# Creating work directory
WORKDIR /build

# Adding project to work directory
ADD . /build

# build project
RUN go build -o server .

FROM alpine:latest

COPY --from=builder /build/server /usr/bin/server

EXPOSE 3478

ENTRYPOINT ["/usr/bin/server"]
