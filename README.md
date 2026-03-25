# Fedora Safe Upgrade Playbook

A calm, structured approach to upgrading Fedora across major versions without breaking your system.

## Overview
Fedora 40 → 42 → 43  
Dual boot (Windows + Fedora)  
UEFI + BTRFS  
Golden backup workflow

## Philosophy
- Do not touch what is not broken
- Verify before acting
- Use official tools
- Keep a golden state before changes

## Quick Start

### Check system
lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINTS
df -h

### Upgrade
sudo dnf upgrade --refresh
sudo dnf install dnf-plugin-system-upgrade -y
sudo dnf system-upgrade download --releasever=XX
sudo dnf system-upgrade reboot

### Cleanup
sudo dnf autoremove
sudo dnf clean all

### Golden backup
sudo rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /mnt/usb/fedora-golden

## Safety Rules
- Verify disks with lsblk
- Do not format internal drives
- Do not touch EFI unless required
- Maintain free disk space

## Lessons Learned
- Disk space is critical
- BTRFS needs breathing room
- Simplicity prevents failure

Wouldn’t it be nice to have calm as part of your workday? Every day?
