#! /bin/bash
docker build . -t hubside_grafana
sleep 1
docker run -d -p 3000:3000 hubside_grafana
docker ps
