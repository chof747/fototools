FROM alpine:latest
RUN apk update && apk upgrade
RUN apk add exiftool
RUN apk add bash
RUN apk add util-linux

WORKDIR /usr/src/app

COPY . ./
ENTRYPOINT ["tail", "-f", "/dev/null"]