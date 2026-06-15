#!/usr/bin/env bash
# 開啟 Demo 網頁
set -euo pipefail

URL="http://10.184.3.137:9004"

echo "Opening ${URL} ..."

if command -v firefox >/dev/null 2>&1; then
    firefox "${URL}" >/dev/null 2>&1 &
elif command -v google-chrome >/dev/null 2>&1; then
    google-chrome "${URL}" >/dev/null 2>&1 &
elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "${URL}"
else
    echo "找不到可用的瀏覽器，請手動開啟：${URL}"
    exit 1
fi
