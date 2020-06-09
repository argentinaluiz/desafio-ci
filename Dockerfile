FROM golang:alpine AS builder

RUN apk add bash

WORKDIR /go/src/sum

COPY sum.go .

# RUN go build -o sum -a -ldflags="-s -w" -installsuffix cgo && \
#     upx --ultra-brute -qq sum && \
#     upx -t sum
RUN GOOS=linux go build -ldflags="-s -w" sum.go

RUN go run sum
ENTRYPOINT ["./sum"]
# WORKDIR /bin
# RUN cp /build/sum ./sum

# FROM scratch

# COPY --from=builder /go/src/app/sum .
# RUN pwd
# ENTRYPOINT ["/sum"]