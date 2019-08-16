#!/bin/bash

pwd
git clone https://github.com/nekronrt/jenkins-build.git
cd jenkins-build
echo deploying image
docker rm -f jenkins || true
docker-compose up -d
