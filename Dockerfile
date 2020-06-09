FROM golang:alpine as builder

WORKDIR /go/src

COPY ./src .

# RUN go build -o sum -a -ldflags="-s -w" -installsuffix cgo && \
#     upx --ultra-brute -qq sum && \
#     upx -t sum
RUN GOOS=linux go build -o /go/bin/sum -ldflags="-s -w" sum/sum.go

ENTRYPOINT ["/go/bin/sum"]