# Auditoría de bootstrap — Desktop 1

Fecha: 2026-09-05  
Nodo: `dsk-1-debian`  
IP LAN: `192.168.0.25`  
IP Tailscale: `100.76.55.17`

## Estado observado

- Debian GNU/Linux 13.6 (trixie), kernel 6.12.
- Usuario administrativo `ampora` en grupo `sudo`, alineado con los otros
  nodos del HomeLab (`NOPASSWD: ALL`).
- SSH, NetworkManager y `systemd-timesyncd` activos.
- Docker `26.1.5` y Compose `2.26.1` instalados y activos.
- Cockpit `337` instalado mediante `cockpit.socket`, escuchando en TCP 9090.
- Tailscale `1.102.3` instalado, `tailscaled` activo y nodo autenticado.
- Grafana Alloy `v1.19.0` activo como `desktop-1-alloy`.
- Loki de Lenovo responde `ready` en `192.168.0.24:3100`.
- Alloy publica logs con las etiquetas `job=docker`, `node=desktop-1` y
  `host=dsk-1-debian`; la serie fue verificada en Loki después de recrear el
  contenedor.
- Telegraf está activo como `desktop-1-telegraf`, con proxy Docker limitado,
  y publica métricas del host a InfluxDB de Lenovo (`192.168.0.24:8086`).
- Portainer Agent está activo como `portainer_agent`, con HTTPS en TCP 9001;
  queda pendiente registrarlo como endpoint en la instancia central de
  Portainer.
- Grafana central tiene dashboards fijos de infraestructura y logs para
  Desktop 1, además de las vistas dinámicas del HomeLab.
- No se montó ni formateó el segundo disco (`/dev/sda`).
- No se desplegaron ML, LLM, transcripción, n8n ni WhatsApp.

## Configuración versionada

El checkout operativo está en `/home/ampora/git/desktop-1-server-config` y
fue actualizado mediante `git pull` hasta el commit del bootstrap. El
repositorio remoto es
[`MartinDabat/desktop-1-server-config`](https://github.com/MartinDabat/desktop-1-server-config).

## Pendientes explícitos

- definir y aplicar firewall después de la auditoría de red y acceso remoto;
- decidir zona horaria común y verificar timers;
- definir límites de Docker antes de cargas de ML/LLM;
- confirmar retención de Alloy/Loki y registrar el endpoint de Desktop 1 en
  Portainer central;
- incorporar auditoría automatizada del nodo;
- seleccionar runtime y modelos para el proyecto WhatsApp.
