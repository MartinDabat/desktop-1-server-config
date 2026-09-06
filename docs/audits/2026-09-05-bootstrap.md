# Auditoría de bootstrap — Desktop 1

Fecha: 2026-09-05 (verificación remota final)
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
- El segundo disco (`/dev/sda`) no está montado ni fue formateado durante el
  bootstrap; sus particiones y filesystems existentes fueron preservados.
- Firewall IPv4/IPv6 aplicado y persistente: `INPUT DROP`, `FORWARD DROP`,
  `OUTPUT ACCEPT`; las cadenas de Docker y Tailscale están activas.
- No se desplegaron ML, LLM, transcripción, n8n ni WhatsApp; quedan fuera del
  alcance de la incorporación base.

## Configuración versionada

El checkout operativo está en `/home/ampora/git/desktop-1-server-config`.
Durante esta verificación permanece en `d65089d` porque Desktop 1 no pudo
resolver GitHub por DNS. El aplicador final del firewall está instalado en
`/usr/local/sbin/desktop-1-firewall-apply` y la política activa fue verificada.
El checkout debe actualizarse con `git pull --ff-only` cuando se restablezca
la resolución de GitHub. El
repositorio remoto es
[`MartinDabat/desktop-1-server-config`](https://github.com/MartinDabat/desktop-1-server-config).

## Pendientes explícitos

- decidir zona horaria común y verificar timers;
- definir límites de Docker antes de cargas de ML/LLM;
- confirmar retención de Alloy/Loki;
- incorporar auditoría automatizada del nodo;
- seleccionar runtime y modelos para el proyecto WhatsApp.

## Resultado de la incorporación

La incorporación base al HomeLab está completada. La tarea MSI #24 puede
cerrarse como completada, dejando como trabajo posterior sólo los pendientes
funcionales indicados arriba.
