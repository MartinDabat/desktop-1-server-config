# Contrato de trabajo de Desktop 1

Este repositorio documenta y automatiza la reconstrucción del nodo Desktop 1.
No contiene la arquitectura cross-node del HomeLab ni secretos reales.

## Orden obligatorio

1. inventariar;
2. auditar;
3. documentar el estado observado;
4. registrar decisiones mediante ADR;
5. refactorizar;
6. automatizar;
7. operar.

Las auditorías son exclusivamente de lectura. Los scripts con cambios deben
exigir una opción explícita como `--apply`, documentar impacto y conservar
rollback cuando corresponda.

## Git y operación

El flujo normal es: revisar diff, validar, commit, push, pull en Desktop 1,
ejecutar y auditar. No guardar secretos, tokens, claves privadas, bases de
datos ni `.env` reales.

Desktop 1 usa Debian 13, aunque los nodos existentes usan Debian 12. Las
diferencias de hardware y sistema deben quedar documentadas, no ocultarse por
similitud con otros nodos.
