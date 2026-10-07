#!/bin/sh
set -eu

: "${PB_ADMIN_EMAIL:?Falta configurar PB_ADMIN_EMAIL}"
: "${PB_ADMIN_PASSWORD:?Falta configurar PB_ADMIN_PASSWORD}"

if [ ! -f /pb/pb_data/data.db ]; then
    /pb/pocketbase superuser create \
        "$PB_ADMIN_EMAIL" "$PB_ADMIN_PASSWORD"
fi

exec /pb/pocketbase serve --http="0.0.0.0:${PORT:-10000}"
