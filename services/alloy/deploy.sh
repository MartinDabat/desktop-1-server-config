#!/usr/bin/env bash
set -euo pipefail

[[ "${1:-}" == "--apply" ]] || {
  echo 'Uso: sudo ./deploy.sh --apply' >&2
  exit 2
}

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
install -d -m 0750 /srv/alloy
docker compose -f "$ROOT_DIR/docker-compose.yml" up -d
docker inspect --format '{{.State.Status}}' desktop-1-alloy | grep -qx running
echo 'Grafana Alloy operativo.'
