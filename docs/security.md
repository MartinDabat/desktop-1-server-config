# Seguridad

- No versionar secretos, tokens, claves, bases de datos ni `.env` reales.
- El acceso administrativo usa SSH y el usuario `ampora` con sudo.
- Portainer Agent escucha por HTTPS en TCP 9001 y es administrado desde MSI.
- El firewall limita la entrada y conserva las cadenas dinámicas de Docker y
  Tailscale.
- Todo cambio de SSH, red, firewall, Docker o Tailscale requiere rollback
  verificable.
