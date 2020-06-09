FROM golang:alpine as builder

WORKDIR /go/src

COPY sum.go .

# RUN go build -o sum -a -ldflags="-s -w" -installsuffix cgo && \
#     upx --ultra-brute -qq sum && \
#     upx -t sum
RUN GOOS=linux go build -ldflags="-s -w" sum.go

FROM hello-world

WORKDIR /go/bin

COPY --from=builder /go/src/sum .
# RUN pwd
# ENTRYPOINT ["/sum"]

ENTRYPOINT ["/go/bin/sum"]