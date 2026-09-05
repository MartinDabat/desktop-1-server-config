# Operaciones

## Flujo obligatorio

Inventariar → auditar → documentar → registrar ADR → refactorizar →
automatizar → operar.

## Actualización del nodo

```bash
cd ~/git/desktop-1-server-config
git pull --ff-only
```

Los despliegues requieren un script explícito y la opción `--apply` cuando el
servicio la implementa. Después se verifica el estado real y se documenta.
