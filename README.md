# NAS Foto and private video renaming tool

The container provides a renaming service for a foto livrary stored on a NAS or other location. It renames all images which are not following the nomenclature: YYYYMMDD_title-of-album_0000.jpg to the correct name by using the name of the folder where the image is residing.

## Installation

```console
docker build -t fotomaintainance:latest .
```

## Execution of docker container

```console
 docker --name renaming_fotos_tool run -v PATH_TO_YOUR_LIBRARY_ON_MACHINE:/fotos:delegated fotomaintainance:latest 
   && docker rm renaming_fotos_tool
```

