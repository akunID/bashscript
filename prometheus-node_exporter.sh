#!/bin/bash
cd /opt/
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar -zxvf node_exporter-1.0.1.linux-amd64.tar.gz
mv node_exporter-1.0.1.linux-amd64/node_exporter /usr/local/bin/
rm -rf node_exporter-1.0.1.linux-amd64*
vim /lib/systemd/system/prometheus-node_exporter.service

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
systemctl status prometheus-node_exporter.service
