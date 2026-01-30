#!/usr/bin/env bash
# Only in LiveCD executed in

set -euo pipefail
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

TARGET_HOST="${1:-}"
TARGET_USER="${2:-muxue}"

if [ "$(id -u)" -eq 0 ]; then
  echo "ERROR! $(basename "${0}") should be run as a regular user"
  exit 1
fi

if [[ -z "$TARGET_HOST" ]]; then
  echo "ERROR! $(basename "${0}") requires a hostname as the first argument"
  exit 1
fi

if [ ! -e "hosts/${TARGET_HOST}/special/partition.nix" ]; then
  echo "ERROR! $(basename "${0}") could not find the required hosts/${TARGET_HOST}/special/partition.nix"
  exit 1
fi

echo "WARNING! The disks in ${TARGET_HOST} are about to get wiped"
echo "         NixOS will be re-installed"
echo "         This is a destructive operation"
echo
read -p "Are you sure? [y/N]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo true

  sudo nix run github:nix-community/disko \
    --extra-experimental-features "nix-command flakes" \
    --no-write-lock-file \
    -- \
    --mode zap_create_mount \
    "hosts/${TARGET_HOST}/special/partition.nix/"

  sudo nixos-install --flake ".#${TARGET_HOST}"

  mkdir -p "/mnt/home/${TARGET_USER}/snowy"                   # 1: Change it to your favorite name.
  rsync -a --delete "${DIR}" "/mnt/home/${TARGET_USER}/snowy" # 2!!!
fi
