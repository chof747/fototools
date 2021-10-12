#!/bin/bash

album=`basename $1`
workdir=$1

if test -n "$(find ${workdir} -maxdepth 1 -name '*.JPG' -print -quit)"; then
    rename 's/(.*)\.JPG$/$1.jpeg/' ${workdir}*.JPG
    rename 's/(.*)\.jpeg$/$1.jpg/' ${workdir}*.jpeg
fi

if test -n "$(find ${workdir} -maxdepth 1 -name '*.MOV' -print -quit)"; then
    rename 's/(.*)\.MOV$/$1.movie/' ${workdir}*.MOV
    rename 's/(.*)\.movie$/$1.mov/' ${workdir}*.movie
fi


exiftool "-filename<DateTimeOriginal" -d "renaming_##%Y%m%d%H%M%S##.%%e" $workdir/*.jpg
exiftool "-filename<DateTimeOriginal" -d "duplicate_##%Y%m%d%H%M%S##%%-c.%%e" $workdir/IMG*.jpg

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

if test -n "$(find ${workdir} -maxdepth 1 -name 'IMG*.jpg' -print -quit)"; then
    for img in `ls ${workdir}IMG*.jpg`; do
        mv $img `printf "${workdir}${album}_%0${digits}d.jpg" $i`
        ((i=i+1))
    done    
fi


if test -n "$(find ${workdir} -maxdepth 1 -name '*.mov' -print -quit)"; then
    i=1
    for mov in `ls ${workdir}*.mov`; do
        mv $mov `printf "${workdir}${album}_m%02d.mov" $i`
        ((i=i+1))
    done    
fi