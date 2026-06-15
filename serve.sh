#!/usr/bin/env bash
# 啟動一個簡單的 HTTP server，讓大家用瀏覽器瀏覽 web/ 內的旅遊筆記
set -euo pipefail

PORT="${1:-9004}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/web" && pwd)"

# 取得本機 IP 方便分享給其他人
IP="$(hostname -I 2>/dev/null | awk '{print $1}')"
[ -z "${IP}" ] && IP="127.0.0.1"

echo "============================================"
echo " 旅遊筆記 HTTP server 啟動中"
echo "  目錄  : ${ROOT}"
echo "  本機  : http://localhost:${PORT}/"
echo "  區網  : http://${IP}:${PORT}/"
echo " 按 Ctrl+C 停止"
echo "============================================"

cd "${ROOT}"
exec python3 -m http.server "${PORT}" --bind 0.0.0.0
