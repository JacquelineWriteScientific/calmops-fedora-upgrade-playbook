#!/usr/bin/env bash
set -euo pipefail

sudo dnf upgrade --refresh -y
sudo dnf install dnf-plugin-system-upgrade -y
sudo dnf system-upgrade download --releasever=43
echo "Run: sudo dnf system-upgrade reboot"
