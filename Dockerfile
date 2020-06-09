FROM golang:alpine as builder

COPY sum.go .

# RUN go build -o sum -a -ldflags="-s -w" -installsuffix cgo && \
#     upx --ultra-brute -qq sum && \
#     upx -t sum
RUN GOOS=linux go build -ldflags="-s -w" sum.go

FROM hello-world

COPY --from=builder /go/sum .
COPY sum.go .
# RUN pwd
# ENTRYPOINT ["/sum"]

ENTRYPOINT ["/sum"]