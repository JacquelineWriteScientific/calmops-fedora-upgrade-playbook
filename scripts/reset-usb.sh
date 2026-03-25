#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-/dev/sda}"

lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINTS "$TARGET"
read -rp "Type YES to erase $TARGET: " OK
[ "$OK" = "YES" ] || exit 1

sudo umount ${TARGET}?* 2>/dev/null || true
sudo wipefs -a "$TARGET"
sudo parted "$TARGET" --script mklabel gpt
sudo parted "$TARGET" --script mkpart primary ext4 0% 100%
sudo mkfs.ext4 -F "${TARGET}1"
sudo mkdir -p /mnt/usb
sudo mount "${TARGET}1" /mnt/usb
df -h /mnt/usb
