#!/bin/sh

set -e

PORT="${PORT:-8080}"

echo "======================================"
echo "       KOSHIBAR VMESS"
echo "======================================"
echo "[INFO] Cloud Run PORT=$PORT"

# Remplace le port du fichier de configuration
sed -i "s/__PORT__/$PORT/g" /Koshibar/Vmess/config.json

echo "[INFO] Vérification de la configuration Xray..."

xray run -test -config /Koshibar/Vmess/config.json

echo "[INFO] Démarrage de Xray..."
echo "[INFO] Écoute sur 0.0.0.0:$PORT"

exec xray run -config /Koshibar/Vmess/config.json
