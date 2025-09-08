#!/usr/bin/env bash
set -e
if [[ "$AUTO_UPGRADE_MODULES" == "1" && -n "$UPGRADE_LIST" ]]; then
  odoo -c /etc/odoo/odoo.conf -u "$UPGRADE_LIST" --stop-after-init
fi
exec "$@"
