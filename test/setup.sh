#!/bin/bash
TEST_DIR=`dirname $0` 
TEST_DIR="${TEST_DIR}/fotos"

echo $TEST_DIR
[[ -d "$TEST_DIR/20210806_lesung-semmering" ]] && rm -rf "$TEST_DIR/20210806_lesung-semmering"
mkdir -p $TEST_DIR
cp -R /Volumes/fotos/2021/20210806_lesung-semmering $TEST_DIR