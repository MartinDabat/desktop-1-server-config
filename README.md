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
.
├── docs/
│   ├── adr/
│   ├── audits/
│   ├── architecture.md
│   ├── hardware.md
│   ├── network.md
│   ├── operations.md
│   ├── rebuild-desktop-1.md
│   ├── recovery.md
│   ├── reconstruction-inventory.md
│   ├── reconstruction-matrix-current.md
│   ├── reconstruction-status.md
│   ├── security.md
│   └── services.md
│
├── services/
│   ├── README.md
│   ├── alloy/
│   ├── cockpit/
│   ├── portainer-agent/
│   ├── promtail/
│   └── telegraf/
│
├── system/
│   ├── README.md
│   ├── base/
│   ├── docker/
│   ├── firewall/
│   ├── network/
│   ├── power/
│   ├── ssh/
│   ├── tailscale/
│   └── timesyncd/
│
├── scripts/
│   ├── README.md
│   ├── audit/
│   ├── backup/
│   ├── deploy/
│   ├── install/
│   └── maintenance/
│
├── scripts-desktop-1/
├── AGENTS.md
├── README.md
└── .gitignore
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
