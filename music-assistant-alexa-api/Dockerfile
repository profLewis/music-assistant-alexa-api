# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
# The application layer ships prebuilt: the skill image contains the Python
# 3.12 environment (with the verifier/certvalidator patches applied), ASK CLI,
# the skill code and the assets. This layer adds the add-on runtime glue.
# The tag+digest here and in build.yaml must stay identical — see AGENTS.md.
# profLewis fork: the base is named directly (not via BUILD_FROM) - a local Supervisor build passes its own default
# (Alpine) base as BUILD_FROM, which has none of the skill image's /app/venv, so the build failed at the pip step.
FROM ghcr.io/timlaing/music-assistant-skill:v1.4.1@sha256:395514e4310c110988ae73c28510ad49e0454148778bcea848c2a178fdf2758a

# Serve with gunicorn instead of the skill image's Flask dev server, using the
# Home Assistant ingress log format from gunicorn.conf.py.
RUN /app/venv/bin/pip install --no-cache-dir gunicorn==26.2.0

# profLewis fork: swap the image's skill code (/app/src and /app/app, both copies of the skill repo's app/) for
# the fork's, pinned by commit. The fork branched from the same v1.4.1 the image was built from, and its
# golden-response tests hold it to upstream's exact responses except for documented, deliberate changes.
ARG SKILL_REPO=https://github.com/profLewis/music-assistant-alexa-skill
ARG SKILL_REF=1e92cfdcdaf42c305f76b02c2a2978d672bc2add
RUN set -eu; \
    tmp="$(mktemp -d)"; \
    curl -fsSL "${SKILL_REPO}/archive/${SKILL_REF}.tar.gz" | tar -xz -C "$tmp" --strip-components=1; \
    test -f "$tmp/app/app.py"; \
    rm -rf /app/src /app/app; \
    cp -a "$tmp/app" /app/src; \
    cp -a "$tmp/app" /app/app; \
    echo "${SKILL_REF}" > /app/SKILL_REF; \
    rm -rf "$tmp"

# Add-on service definition. The skill image is Ubuntu-based and has no Home
# Assistant base s6-overlay/bashio, so the service is a plain entrypoint
# replacing the image CMD.
COPY gunicorn.conf.py /app/gunicorn.conf.py
COPY rootfs /

ENV LOCALE="en-US" \
    MA_HOSTNAME="" \
    PORT="5000" \
    QUIET_HTTP="1" \
    SKILL_HOSTNAME="" \
    SKIP_URL_VALIDATION="false" \
    ENABLE_APL="false" \
    PYTHONFAULTHANDLER="1"

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD curl --fail --silent --output /dev/null "http://localhost:5000/health"
