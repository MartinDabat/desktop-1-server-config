#!/usr/bin/env bash
set -euo pipefail

[[ "${1:-}" == "--apply" ]] || {
  echo 'Uso: sudo ./scripts/install/bootstrap.sh --apply' >&2
  exit 2
}

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y ca-certificates curl git docker.io docker-compose-v2 cockpit
systemctl enable --now docker.service cockpit.socket systemd-timesyncd.service
usermod -aG docker ampora

echo 'Base instalada: Docker, Compose, Cockpit, Git, curl y NTP.'
echo 'Tailscale y Promtail se habilitan mediante sus procedimientos versionados.'
