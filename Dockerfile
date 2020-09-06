FROM golang:alpine as builder

WORKDIR /go/src/aspiratv

RUN apk add git

RUN git clone https://github.com/simulot/aspiratv.git .

COPY dash.go download/dash.go

RUN go install -v ./...


FROM alpine

COPY --from=builder /go/bin/aspiratv .

RUN apk add --no-cache ffmpeg

CMD ["./aspiratv"]
