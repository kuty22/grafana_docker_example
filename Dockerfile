FROM grafana/grafana-enterprise:8.1.2-ubuntu
ADD ./provisioning /etc/grafana/provisioning
ADD ./config.ini /etc/grafana/config.ini
