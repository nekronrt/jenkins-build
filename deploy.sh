#!/bin/bash

pwd
git clone https://github.com/nekronrt/jenkins-build.git
cd jenkins-build
git pull
echo deploying image
docker rm -f jenkins || true
docker-compose up -d
