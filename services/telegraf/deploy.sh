#!/usr/bin/env bash
set -euo pipefail

[[ "${1:-}" == "--apply" ]] || {
  echo 'Uso: sudo ./deploy.sh --apply' >&2
  exit 2
}

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SECRETS_ROOT="${SECRETS_ROOT:-/etc/desktop-1-server-config/secrets}"
ENV_FILE="${TELEGRAF_ENV_FILE:-$SECRETS_ROOT/telegraf.env}"

[[ -f "$ENV_FILE" ]] || {
  echo "Falta el secreto externo: $ENV_FILE" >&2
  exit 1
}

set -a
source "$ENV_FILE"
set +a
for variable in INFLUX_URL INFLUX_ORG INFLUX_BUCKET INFLUX_TOKEN; do
  [[ -n "${!variable:-}" ]] || { echo "Falta $variable en $ENV_FILE" >&2; exit 1; }
done

docker network inspect metrics >/dev/null 2>&1 || docker network create metrics
TELEGRAF_ENV_FILE="$ENV_FILE" docker compose -f "$ROOT_DIR/docker-compose.yml" --env-file "$ENV_FILE" up -d
docker inspect --format '{{.State.Status}}' desktop-1-telegraf | grep -qx running
echo 'Telegraf y el proxy Docker están operativos.'
