# Grafana Alloy

Alloy es el agente para enviar logs Docker de Desktop 1 al Loki de Lenovo.
Usa el socket Docker en sólo lectura, persiste posiciones en `/srv/alloy` y
no requiere credenciales en la red interna actual. La imagen y la
configuración están versionadas en este directorio.

Despliegue explícito:

```bash
sudo ./deploy.sh --apply
```
