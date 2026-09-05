# Firewall Desktop 1

Desktop 1 adopta el estándar probado en Lenovo y HP:

- IPv4 e IPv6: `INPUT DROP`, `FORWARD DROP`, `OUTPUT ACCEPT`.
- SSH y Cockpit: sólo desde `192.168.0.0/24`.
- Portainer Agent: TCP 9001 sólo desde MSI (`192.168.0.23`) mediante
  `DOCKER-USER`.
- Tailscale conserva sus cadenas propias y permite la administración por la
  interfaz VPN.
- Docker conserva sus cadenas dinámicas; no se aplica un `iptables-restore`
  destructivo sobre ellas.

## Aplicación

```bash
sudo ./system/firewall/setup-firewall.sh
```

El procedimiento requiere una segunda sesión SSH abierta y una verificación
posterior por LAN y Tailscale. La política versionada está en
`iptables.rules` e `ip6tables.rules`; el servicio persistente ejecuta el
aplicador idempotente instalado en `/usr/local/sbin`.
