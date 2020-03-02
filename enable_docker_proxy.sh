sudo mv /etc/systemd/system/docker.service.d/http-proxy.conf.backup /etc/systemd/system/docker.service.d/http-proxy.conf
sudo systemctl daemon-reload
sudo systemctl restart docker

