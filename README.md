# Prometheus Node_Exporter
Release Version `1.1.0`

## Installation

Change directory `cd /opt/`
Download script

```bash
curl -O https://raw.githubusercontent.com/akunID/prometheus/main/node_exporter.sh
```

## Usage

```bash
sudo chmod +x node_exporter.sh
./node_exporter.sh
```

## Check Status

Check Service Running
```bash
systemctl status prometheus-node_exporter.service
```

Check Port Running
```bash
netstat -ntlup
```
see port `9100`

## License
[Prometheus](https://prometheus.io)
