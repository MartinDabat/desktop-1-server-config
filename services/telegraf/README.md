# Telegraf

Recolecta métricas de Desktop 1 y Docker mediante un proxy limitado del socket,
y las envía al InfluxDB central de Lenovo. El token se carga desde
`/etc/desktop-1-server-config/secrets/telegraf.env` y nunca se versiona.

Despliegue explícito:

```bash
sudo ./deploy.sh --apply
```
