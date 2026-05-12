#!/bin/bash
echo "Starting Xray..."
nohup /usr/local/bin/xray run -c /etc/xray/g2ray.json &>/tmp/xray.log &
sleep 2
echo "Xray started"