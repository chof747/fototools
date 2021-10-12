#!/bin/bash

exiftool '-filename<${filesequence;$_=sprintf("IMG_4711%03d",$_)}.%e' -fileorder createdate $1