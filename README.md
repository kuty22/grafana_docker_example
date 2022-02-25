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


## Error

- Connection between grafana and mysql isn't possible because of network container and host:
    1. Find `bind-address` in `/etc/mysql/`
    ```SH
    sudo grep -r 'bind-address' `/etc/mysql/`
    /etc/mysql/mysql.conf.d/mysqld.cnf:bind-address		= 127.0.0.1
    ````
    1. Edit `bind-address` and replace it with `0.0.0.0`
    2. Connect to mysql and allow conection:
    ```
    # Do not use that procedure on production environment, it's only for local test.
    mysql -u root -p;
    $ GRANT ALL ON *.* to root@'%' INDENTIFY BY '<YOUR-MYSQL-PASSWORD>';
    $ exit
    # MYSQL service can be named differently (mysqld, mysql-server, etc...)
    sudo service mysql restart
    ```
    1. Get your ip with `ip a` and add it to datasources configuration (`provisioning/datasources/all.yml`, in `url` field)