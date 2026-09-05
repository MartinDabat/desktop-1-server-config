# Hardware

- CPU observada: Intel Core i7-2600.
- RAM nominal: 14 GB; aproximadamente 13 GiB visibles para el sistema.
- Discos: `/dev/sdb` aloja el sistema y `/dev/sda` permanece sin montar.
- `/srv`: partición separada en `/dev/sdb7`.

La capacidad de ML/LLM debe verificarse con mediciones antes de desplegar
modelos. No se debe asumir aceleración por GPU sin inventario del hardware.
