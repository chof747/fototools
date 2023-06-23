!/bin/sh
docker run -v $1:/fotos:delegated --name tinkering_fotos -it --entrypoint /bin/bash fotomaintainance:latest && docker rm tinkering_fotos
