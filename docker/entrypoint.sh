#!/usr/bin/env bash
set -e

# auto upgrade modules on start (optional)
if [[ "${AUTO_UPGRADE_MODULES}" == "1" && -n "${UPGRADE_LIST}" ]]; then
  echo "[entrypoint] Upgrading modules: ${UPGRADE_LIST}"
  odoo -c /etc/odoo/odoo.conf -u "${UPGRADE_LIST}" --stop-after-init
fi

exec "$@"
