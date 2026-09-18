#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Execute este script no macOS, não no Linux."
  exit 1
fi

PYTHON_BIN="${PYTHON_BIN:-python3}"
"$PYTHON_BIN" -m pip install -r requirements.txt
"$PYTHON_BIN" OpenCore-Patcher-GUI.command --build --model MacBookPro8,1 --verbose

echo "Build concluído. Verifique a pasta dist/ se o modo de build estiver configurado."
