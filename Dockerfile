FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN go build -o fullcycle .

FROM scratch

COPY --from=builder /go/src/app/fullcycle /fullcycle

CMD ["/fullcycle"]
