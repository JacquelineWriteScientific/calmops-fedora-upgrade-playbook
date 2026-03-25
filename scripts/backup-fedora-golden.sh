#!/usr/bin/env bash
set -euo pipefail

DEST="${1:-/mnt/usb/fedora-42-golden}"

sudo rsync -aAXv \
  --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} \
  / "$DEST"
