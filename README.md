# Desktop 1 Server Configuration

Repositorio de configuración y reconstrucción del nodo **Desktop 1** del
HomeLab.

## Estado actual

- Hostname: `dsk-1-debian`
- Sistema: Debian 13 (trixie)
- Red primaria: Wi-Fi, `192.168.0.25`
- RAM observada: aproximadamente 14 GiB
- `/srv`: partición separada en el disco del sistema
- Rol previsto: análisis local, ML, LLM y transcripción
- Observabilidad prevista: Grafana Alloy hacia Loki
- Administración Docker: Portainer Agent administrado desde MSI

## Objetivos

- Documentar completamente el nodo Desktop 1.
- Versionar la configuración del host y sus servicios.
- Auditar el estado real antes de modificarlo.
- Preparar el nodo para ML, LLM pequeño y transcripción local.
- Mantener datos y secretos separados de Git.
- Registrar decisiones permanentes mediante ADR.
- Mantener el mismo contrato operativo que MSI, Lenovo y HP.

## Estructura del repositorio

```text
docs/       arquitectura, hardware, red, auditorías, ADR y operación
scripts/    auditoría, instalación, backup, deploy y mantenimiento
services/   servicios del nodo
system/     base, Docker, red, SSH, firewall, energía y Tailscale
scripts-desktop-1/ herramientas desde la Mac
```

El proyecto de analítica de WhatsApp se coordina en
[`homelab-bootstrap`](https://github.com/MartinDabat/homelab-bootstrap/issues/5).
Este repositorio contiene sólo la implementación específica de Desktop 1.

## Flujo de trabajo

```text
inventariar → auditar → documentar → ADR → refactorizar → automatizar → operar
```

Toda modificación permanente se transfiere mediante Git: validar, commit,
push, pull en el nodo, ejecutar y auditar.
