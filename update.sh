#!/bin/sh

git pull
docker build -t fotomaintainance:latest .
