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

## Estructura

```text
docs/       arquitectura, auditorías, ADR y operación
scripts/    auditoría, instalación, backup, deploy y mantenimiento
services/   servicios del nodo
system/     base, Docker, red, SSH, energía, Tailscale y NTP
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
