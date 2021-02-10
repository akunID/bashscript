#!/bin/bash

wget https://github.com/prometheus/node_exporter/releases/download/v1.1.0/node_exporter-1.1.0.linux-amd64.tar.gz
tar -zxvf node_exporter-1.1.0.linux-amd64.tar.gz
mv node_exporter-1.1.0.linux-amd64/node_exporter /usr/local/bin/

cat <<EOF > /lib/systemd/system/prometheus-node_exporter.service {
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=root
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
}
EOF

systemctl daemon-reload
systemctl enable prometheus-node_exporter.service
systemctl start prometheus-node_exporter.service
rm -rf node_exporter*

