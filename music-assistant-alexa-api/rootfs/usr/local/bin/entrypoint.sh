#!/bin/sh
# ==============================================================================
# Add-on service entrypoint.
# The skill image has no Home Assistant base s6-overlay/bashio, so the service
# environment and the gunicorn invocation live here (they previously lived in
# rootfs/etc/services.d/music-assistant-alexa-api/run).
# ==============================================================================
set -e

# Application settings are migrated and persisted by the web app.
export PORT=5000
export APP_SETTINGS_PATH="/data/app-settings.json"
export ASK_CREDENTIALS_DIR="/data/.ask"
export DEVICE_MAPPING_PATH="/data/device_players.json"
export SKILL_DEPLOYMENT_PATH="/data/skill-deployment.json"
export PYTHONFAULTHANDLER=1
export HA_INGRESS_ENABLED=true

# profLewis fork: one-time import of the original add-on's settings (app settings, ASK/LWA credentials, device
# mapping, skill deployment) so the fork takes over the deployed skill without a new Amazon login. Copy the
# original add-on's /data files into /share/ma_alexa_import/; they are moved in only when this add-on has no
# settings yet, and the import folder is deleted afterwards (it holds secrets).
IMPORT_DIR="/share/ma_alexa_import"
if [ -d "$IMPORT_DIR" ] && [ ! -f "$APP_SETTINGS_PATH" ]; then
    echo "[fork] importing settings from $IMPORT_DIR"
    cp -a "$IMPORT_DIR"/. /data/
    rm -rf "$IMPORT_DIR"
fi
echo "[fork] skill code: $(cat /app/SKILL_REF 2>/dev/null || echo unknown)"

# The upstream application stores the current stream in memory, so it must run
# as a single worker to keep push and playback requests consistent.
exec /app/venv/bin/gunicorn --config /app/gunicorn.conf.py --workers 1 --worker-class gthread --threads 8 --access-logfile - --error-logfile - --capture-output app:app --chdir /app/src --bind "0.0.0.0:${PORT}" --bind "0.0.0.0:8099"
