FROM alpine:latest
RUN apk update && apk upgrade
RUN apk add exiftool
RUN apk add bash
RUN apk add util-linux

ENV FOTOS_PATH=/fotos

WORKDIR /usr/src/app

COPY . ./
CMD ["/usr/src/app/execute-search.sh"]