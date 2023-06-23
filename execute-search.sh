#!/bin/bash

find $FOTOS_PATH -type f |
 # regexp to exclude the already correctly formatted names of images and movies
 grep -vE ".*/[0-9]{8}_[a-zA-Z-]*?_([0-9]*\.jpg|m[0-9]*\.mov)" |
 # regexp to exclude special files
 grep -vE "\.ini|\.db|\.info|@Recycle" |
 #select all entries that are in correctly named folders and have a 3-4 digit file extension
 grep -E ".*?/[0-9]{8}_[a-zA-Z-]*/[^/]*\.[[:alnum:]]{3,4}" | 
 #extract only the path part
 sed -n -e 's/\(.*[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]_[a-zA-Z0-9-]*\)\/.*/\1/p' |
 sort | uniq |
    while read folder ; do
        ./prepImgNames.sh $folder/
        ./adjustname.sh $folder/
    done 
 