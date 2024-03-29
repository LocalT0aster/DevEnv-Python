#!/usr/bin/env /bin/bash
if [[ $# -eq 0 ]] then
docker build -t pydev-img -f .devenv/Dockerfile .
elif [[ $# -eq 1 ]] then
docker build -t pydev-img -f .devenv/Dockerfile --build-arg password=$1 .
elif [[ $# -eq 2 ]] then
docker build -t pydev-img -f .devenv/Dockerfile --build-arg username=$1 --build-arg password=$2 .
else
echo "Too many arguments!"
fi
docker run -p 22222:22222 -d --name pydev pydev-img