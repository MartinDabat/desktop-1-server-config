#!/usr/bin/env bash
set -euo pipefail

[[ "${1:-}" == "--apply" ]] || {
  echo 'Uso: sudo ./scripts/install/tailscale.sh --apply' >&2
  exit 2
}

command -v tailscale >/dev/null 2>&1 || {
  curl -fsSL https://tailscale.com/install.sh | sh
}
systemctl enable --now tailscaled.service
echo 'Tailscale instalado y tailscaled activo. Falta autenticación interactiva con tailscale up.'
