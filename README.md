# NAS Foto and private video renaming tool

The container provides a renaming service for a foto livrary stored on a NAS or other location. It renames all images which are not following the nomenclature: YYYYMMDD_title-of-album_0000.jpg to the correct name by using the name of the folder where the image is residing.

## Installation

```console
docker build -t fotomaintainance:latest .
```

### Preparation of host environment

- Add share on NAS containing folders to be mounted on a mountpoint
  1. create the mount point (e.g. /mnt/images)
  2. add mounting the images directories to the mountpoint in the `/etc/fstab` file. E.g:
  ```
      <IP to NAS>:/<path to images>       <mountpoint>      nfs     defaults        0       0
  ```
  3. If you want to run the task periodically add the line for the execution below to your `/etc/crontab` and use the user you specified when executing on the command line
  
## Checking the container and shakedown testing

```console
docker run --name test_fotomaintainance -it --entrypoint /bin/sh --volume /mnt/fotos:/fotos fotomaintainance:latest && docker rm test_fotomaintainance
```

## Execution of docker container

```console
 docker --name renaming_fotos_tool run -v PATH_TO_YOUR_LIBRARY_ON_MACHINE:/fotos:delegated fotomaintainance:latest 
   && docker rm renaming_fotos_tool
```

