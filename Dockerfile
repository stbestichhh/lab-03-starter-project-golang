FROM golang:latest

WORKDIR /fizzbuzz

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY cmd ./cmd
COPY lib ./lib
COPY templates ./templates
COPY main.go .

RUN go build -o ./fizzbuzz

CMD ["./fizzbuzz", "serve"]
