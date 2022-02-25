# grafana_docker_example
example grafana in docker connect datasource easy.


## start database

if mysql is already install juste start it.

```BASH
# on initd
sudo service mysql-server start
# on systemd
sudo systemctl start mysql-server 
```

if  not install it.  
Or  use docker:

```
docker run --name switch_mysql -e MYSQL_ROOT_PASSWORD=pass -d mysql:latest
# get ip
docker inspect switch_mysql | jq ".[0].NetworkSettings.Networks.bridge.IPAddress"
# connect to database:
mysql -h <IP GET PREVIUSLY> -u root -p
```


## start grafana


```
./start_grafana.sh
```