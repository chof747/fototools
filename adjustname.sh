#!/bin/bash

album=`basename $1`
workdir=$1

if test -n "$(find ${workdir} -maxdepth 1 -name '*.JPG' -print -quit)"; then
    rename 's/(.*)\.JPG$/$1.jpeg/' ${workdir}*.JPG
    rename 's/(.*)\.jpeg$/$1.jpg/' ${workdir}*.jpeg
fi

exiftool "-filename<DateTimeOriginal" -d "renaming_##%Y%m%d%H%M%S##.%%e" $workdir

countjpg=$((`find ${workdir} -maxdepth 1 -type f -name *.jpg | wc -l`))

if [[ $countjpg -lt 1000 ]]; then
    digits=3
else
    digits=4
fi

i=1
for img in `ls ${workdir}renaming*.jpg`; do
    mv $img `printf "${workdir}${album}_%0${digits}d.jpg" $i`
    ((i=i+1))
done    