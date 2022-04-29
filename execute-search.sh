#!/bin/bash

find $FOTOS_PATH -type f |
 grep -vE ".*/[0-9]{8}_[a-zA-Z-]*?_([0-9]*\.jpg|m[0-9]*\.mov)" |
 grep -E ".*?/[0-9]{8}_[a-zA-Z-]*/[^/]*\.[[:alnum:]]{3,4}" | 
 sed -n -e 's/\(.*[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]_[a-zA-Z0-9-]*\)\/.*/\1/p' |
 sort | uniq |
    while read folder ; do
        ./prepImgNames.sh $folder/
        ./adjustname.sh $folder/
    done 
 