"""profLewis fork contract: built locally from the pinned skill fork, otherwise the upstream add-on."""

import re
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parents[1]
ADDON = ROOT / "music-assistant-alexa-api"


def test_built_locally_not_pulled():
    config = yaml.safe_load((ADDON / "config.yaml").read_text())
    # with an image key Supervisor would pull upstream's prebuilt image and the fork's code would never run
    assert "image" not in config
    assert "fork" in config["name"]


def test_skill_code_is_the_fork_pinned_by_commit():
    dockerfile = (ADDON / "Dockerfile").read_text()
    assert "ARG SKILL_REPO=https://github.com/profLewis/music-assistant-alexa-skill" in dockerfile
    assert re.search(r"^ARG SKILL_REF=[0-9a-f]{40}$", dockerfile, re.M), "pin the skill fork by full commit SHA"
    # both copies of the skill app the image carries are replaced
    assert 'cp -a "$tmp/app" /app/src' in dockerfile
    assert 'cp -a "$tmp/app" /app/app' in dockerfile


def test_settings_import_never_overwrites_and_cleans_up():
    entrypoint = (ADDON / "rootfs/usr/local/bin/entrypoint.sh").read_text()
    assert '[ ! -f "$APP_SETTINGS_PATH" ]' in entrypoint
    assert 'rm -rf "$IMPORT_DIR"' in entrypoint
    # the import runs after the settings path is defined and before the server starts
    assert entrypoint.index("APP_SETTINGS_PATH=") < entrypoint.index("IMPORT_DIR=") < entrypoint.index("exec ")
