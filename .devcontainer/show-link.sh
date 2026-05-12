#!/bin/bash
CODESPACE_NAME_FROM_ARG="$1"
if [ -z "$CODESPACE_NAME_FROM_ARG" ]; then
  echo "usage: show-link.sh <codespace-name>"
  exit 1
fi
CONFIG="/etc/xray/g2ray.json"
UUID=$(grep -o '"id": *"[^"]*"' "$CONFIG" | head -1 | grep -o '"[^"]*"$' | tr -d '"')
if [ -z "$UUID" ]; then echo "UUID not found"; exit 1; fi
SNI="${CODESPACE_NAME_FROM_ARG}-443.app.github.dev"
LINK="vless://${UUID}@94.130.50.12:443?encryption=none&security=tls&sni=${SNI}&host=${SNI}&fp=chrome&allowInsecure=1&type=xhttp&mode=packet-up&path=%2F#g2ray"
echo "$LINK"