FROM golang:alpine as builder

WORKDIR /go/src

COPY sum.go .

# RUN go build -o sum -a -ldflags="-s -w" -installsuffix cgo && \
#     upx --ultra-brute -qq sum && \
#     upx -t sum
RUN GOOS=linux go build -ldflags="-s -w" sum.go
RUN ls .
RUN ls /go/bin
#FROM scratch

#COPY --from=builder /go/sum .
#COPY . .
# ENTRYPOINT ["/sum"]
ENV GOPATH=.
ENTRYPOINT ["./sum"]