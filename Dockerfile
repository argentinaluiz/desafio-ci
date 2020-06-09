FROM golang:alpine3.10

WORKDIR /go/src/ci_challenge
COPY ./src/ci_challenge .

RUN go install -v ./...

CMD ["ci_challenge"]

FROM golang:alpine3.10

WORKDIR $GOPATH/src/ci_challenge/sum/
COPY ./src/ci_challenge .

RUN go get -d -v
RUN go build -o /go/bin/ci_challenge -ldflags "-s -w"

FROM scratch
COPY --from=0 /go/bin/ci_challenge /ci_challenge
ENTRYPOINT ["/ci_challenge"]