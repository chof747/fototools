#!/bin/bash
TEST_DIR=`dirname $0` 
TEST_DIR="${TEST_DIR}/fotos"

echo $TEST_DIR
[[ -d "$TEST_DIR/20150118_koeszeg" ]] && rm -rf "$TEST_DIR/20150118_koeszeg"
mkdir -p $TEST_DIR
cp -R /Volumes/fotos/2015/20150118_koeszeg $TEST_DIR