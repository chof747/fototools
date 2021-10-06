#!/bin/bash
TEST_DIR=`dirname $0` 
TEST_DIR="${TEST_DIR}/fotos"

echo $TEST_DIR
[[ -d "$TEST_DIR/20191023_marokko" ]] && rm -rf "$TEST_DIR/20191023_marokko"
mkdir -p $TEST_DIR
cp -R /Volumes/fotos/2019/20191023_marokko $TEST_DIR
#rename 's/.*(\d*)_marokko(.*)/$$1_img_$2/'  $TEST_DIR/20191023_marokko/*.jpg