#!/bin/bash
# One-time setup for Electrum WojakCoin (run from repo root).
# Uses system libsecp256k1 to avoid building it (set ELECTRUM_ECC_DONT_COMPILE=1).

set -e
cd "$(dirname "$0")/.."

echo "== Installing system dependencies =="
sudo apt-get update -qq
sudo apt-get install -y -qq libsecp256k1-dev python3-pip python3-venv 2>/dev/null || true

echo "== Upgrading pip =="
python3 -m pip install --upgrade pip

echo "== Installing Python requirements (with system libsecp) =="
ELECTRUM_ECC_DONT_COMPILE=1 python3 -m pip install -r contrib/requirements/requirements.txt

echo "== Installing cryptography and Electrum [crypto] =="
python3 -m pip install cryptography ".[crypto]"

echo "== Optional: Qt GUI =="
echo "  For GUI: sudo apt-get install python3-pyqt6 && pip install '.[gui]'"
echo ""
echo "Done. Run: ./run_electrum"
echo "  (Default network is WojakCoin; use --mainnet for Bitcoin.)"
