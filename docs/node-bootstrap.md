# Bootstrap inicial

## Estado observado antes del bootstrap

- Hostname `dsk-1-debian`.
- Debian GNU/Linux 13.6, kernel 6.12.
- IP LAN `192.168.0.25` sobre interfaz Wi-Fi.
- SSH y `systemd-timesyncd` activos.
- Docker y Tailscale ausentes o inactivos.
- Dos discos de aproximadamente 1 TB; `/dev/sdb` aloja el sistema y `/dev/sda`
  permanece sin montar.
- `/srv` está separado en `/dev/sdb7`.

No se particionan, formatean ni montan discos adicionales durante este
bootstrap.

## Base prevista

Instalar y verificar Git, Docker Engine/Compose, Cockpit, Grafana Alloy y
Tailscale. Alloy reemplaza a Promtail, que quedó fuera de soporte en marzo de
2026. El acceso remoto y los servicios publicados se auditarán antes de
asignar cargas de ML o LLM.
