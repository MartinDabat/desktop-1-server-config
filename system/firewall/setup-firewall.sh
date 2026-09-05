#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

install -m 0755 apply-firewall.sh /usr/local/sbin/desktop-1-firewall-apply
install -m 0644 iptables.rules /etc/iptables.rules
install -m 0644 ip6tables.rules /etc/ip6tables.rules
install -m 0644 iptables-restore.service /etc/systemd/system/iptables-restore.service

systemctl daemon-reload
/usr/local/sbin/desktop-1-firewall-apply
systemctl enable --now iptables-restore.service

echo "[OK] Firewall Desktop 1 aplicado y persistente."
iptables -S INPUT
iptables -S DOCKER-USER
ip6tables -S INPUT
