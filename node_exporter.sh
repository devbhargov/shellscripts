#!/bin/bash

echo "Changing directory"
cd /tmp
echo "Downloading the node exporter"
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz

echo "####--- extracting the exporter---####"
tar xvf node_exporter-*.tar.gz
echo "####--- moving the exporter to usr local bin ---####"
sudo mv node_exporter-*/node_exporter /usr/local/bin/
echo "####--- adding user for exporter ---####"
sudo useradd --no-create-home --shell /usr/sbin/nologin node_exporter

echo "####--- changing the user ownership for exporter ---####"
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

echo "####--- creating exporter service file ---####"
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
[Unit]
Description=Prometheus Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter 
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF


echo "####--- reload the daemon and enable the exporter ---####"

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now node_exporter
sudo systemctl start node_exporter
sudo systemctl status node_exporter
