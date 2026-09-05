# Portainer Agent

Portainer Agent permite que el Portainer central de MSI administre el Docker
Engine de Desktop 1. No se instala un segundo Portainer Server.

El puerto `9001` queda publicado para la integración y deberá restringirse al
consumidor aprobado mediante el firewall del nodo. El agente usa el socket
Docker y los volúmenes Docker del host.

Despliegue explícito:

```bash
sudo ./deploy.sh --apply
```

Endpoint que deberá registrarse en Portainer MSI:

```text
192.168.0.25:9001
```
