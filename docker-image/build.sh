#!/bin/sh

cp ./dist/grafana_latest_amd64.deb ./docker-image/

docker build -t drillster/grafana:latest ./docker-image
