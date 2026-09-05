# Arquitectura de Desktop 1

Desktop 1 es un nodo de cómputo local para ML, LLM y transcripción. No será
el nodo de almacenamiento principal, de entrada de webhooks ni de servicios
generales del HomeLab salvo decisiones posteriores.

## Límites

- MSI conserva almacenamiento y servicios centrales asignados.
- HP conserva n8n y servicios asignados de ingreso/orquestación.
- Lenovo conserva observabilidad y servicios asignados de datos.
- Desktop 1 ejecutará workers y APIs locales cuando el hardware y los límites
  de recursos hayan sido verificados.

La configuración específica vive en este repositorio; los contratos de
integración viven en `homelab-bootstrap`.
