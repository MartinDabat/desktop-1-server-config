#!/usr/bin/env bash
set -euo pipefail

[[ "${1:-}" == "--apply" ]] || {
  echo 'Uso: sudo ./deploy.sh --apply' >&2
  exit 2
}

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
docker compose -f "$ROOT_DIR/docker-compose.yml" pull
docker compose -f "$ROOT_DIR/docker-compose.yml" up -d
docker inspect --format '{{.State.Status}}' portainer_agent | grep -qx running
curl -kfsS --max-time 10 https://127.0.0.1:9001/ping
echo
echo 'Portainer Agent operativo en TCP 9001.'
