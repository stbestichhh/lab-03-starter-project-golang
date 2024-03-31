FROM golang:latest AS build

WORKDIR /fizzbuzz

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY cmd ./cmd
COPY lib ./lib
COPY templates ./templates
COPY main.go .

RUN CGO_ENABLED=0 go build -o ./fizzbuzz

FROM gcr.io/distroless/base

COPY --from=build /fizzbuzz/fizzbuzz /fizzbuzz
COPY templates /templates

CMD ["/fizzbuzz", "serve"]
