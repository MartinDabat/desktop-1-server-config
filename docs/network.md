# Red

- IP LAN: `192.168.0.25` sobre Wi-Fi.
- IP Tailscale observada: `100.76.55.17`.
- SSH y servicios entre nodos usan la LAN cuando están en la misma red.
- Tailscale se reserva para acceso remoto y rutas alternativas verificadas.
- El firewall aplica `INPUT DROP` y `FORWARD DROP` en IPv4 e IPv6.

Los puertos publicados deben mantenerse documentados por servicio y limitarse
al consumidor aprobado.
