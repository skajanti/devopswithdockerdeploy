FROM golang:alpine AS build-stage39

ENV PORT=8080 PATH=${PATH}:/usr/local/go/bin CGO_ENABLED=0

WORKDIR /usr/src/app

COPY . .

RUN go build


FROM scratch

WORKDIR /usr/src/app

COPY --from=build-stage39 usr/src/app/server .

EXPOSE 8080

ENTRYPOINT ["./server"]