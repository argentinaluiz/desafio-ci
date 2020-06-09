FROM golang:alpine as builder

WORKDIR /go/src/sum

COPY sum.go .

# RUN go build -o sum -a -ldflags="-s -w" -installsuffix cgo && \
#     upx --ultra-brute -qq sum && \
#     upx -t sum
RUN GOOS=linux go build -ldflags="-s -w" sum.go

#FROM scratch

#COPY --from=builder /go/sum .
#COPY . .
# ENTRYPOINT ["/sum"]
ENV GOPATH=/go
RUN go run sum
ENTRYPOINT ["./sum"]