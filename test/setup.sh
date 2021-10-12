#!/bin/bash
TEST_MAIN_DIR=`dirname $0` 
TEST_DIR="${TEST_MAIN_DIR}/fotos"

echo $TEST_DIR
[[ -d "$TEST_DIR/20150118_koeszeg" ]] && rm -rf "$TEST_DIR/20150118_koeszeg"
[[ -d "$TEST_DIR/renamed_images" ]] && rm -rf "$TEST_DIR/renamed_images" 
mkdir -p $TEST_DIR
cp -R $TEST_MAIN_DIR/fotos_template/* $TEST_DIR