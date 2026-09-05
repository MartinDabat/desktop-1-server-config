#!/bin/bash
set -euo pipefail

iptables_cmd="/usr/sbin/iptables"
ip6tables_cmd="/usr/sbin/ip6tables"

ensure_chain() {
  local cmd="$1" chain="$2"
  "$cmd" -nL "$chain" >/dev/null 2>&1 || "$cmd" -N "$chain"
}

ensure_rule() {
  local cmd="$1" chain="$2"
  shift 2
  "$cmd" -C "$chain" "$@" >/dev/null 2>&1 || "$cmd" -A "$chain" "$@"
}

ensure_jump() {
  local cmd="$1" chain="$2" target="$3"
  "$cmd" -C "$chain" -j "$target" >/dev/null 2>&1 || "$cmd" -I "$chain" 1 -j "$target"
}

"$iptables_cmd" -P INPUT DROP
"$iptables_cmd" -P FORWARD DROP
"$iptables_cmd" -P OUTPUT ACCEPT
"$ip6tables_cmd" -P INPUT DROP
"$ip6tables_cmd" -P FORWARD DROP
"$ip6tables_cmd" -P OUTPUT ACCEPT

ensure_chain "$iptables_cmd" DOCKER-USER
ensure_rule "$iptables_cmd" INPUT -i lo -j ACCEPT
ensure_rule "$iptables_cmd" INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
ensure_rule "$iptables_cmd" INPUT -p tcp -s 192.168.0.0/24 --dport 22 -j ACCEPT
ensure_rule "$iptables_cmd" INPUT -p tcp -s 192.168.0.0/24 --dport 9090 -j ACCEPT
ensure_rule "$iptables_cmd" DOCKER-USER -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
ensure_rule "$iptables_cmd" DOCKER-USER -p tcp -s 192.168.0.23/32 --dport 9001 -j ACCEPT
ensure_rule "$iptables_cmd" DOCKER-USER -j RETURN

ensure_chain "$ip6tables_cmd" DOCKER-USER
ensure_rule "$ip6tables_cmd" INPUT -i lo -j ACCEPT
ensure_rule "$ip6tables_cmd" INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
ensure_rule "$ip6tables_cmd" DOCKER-USER -j RETURN

# Tailscale owns these chains. Add the jumps only when tailscaled has created
# them; otherwise the next service start will establish remote access.
if "$iptables_cmd" -nL ts-input >/dev/null 2>&1; then ensure_jump "$iptables_cmd" INPUT ts-input; fi
if "$iptables_cmd" -nL ts-forward >/dev/null 2>&1; then ensure_jump "$iptables_cmd" FORWARD ts-forward; fi
if "$ip6tables_cmd" -nL ts-input >/dev/null 2>&1; then ensure_jump "$ip6tables_cmd" INPUT ts-input; fi
if "$ip6tables_cmd" -nL ts-forward >/dev/null 2>&1; then ensure_jump "$ip6tables_cmd" FORWARD ts-forward; fi
