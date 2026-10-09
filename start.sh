
#!/usr/bin/env bash
set -e

PORT="${PORT:-8000}"

exec /usr/bin/code-server \
  --bind-addr "0.0.0.0:${PORT}" \
  --auth none \
  --disable-telemetry \
  --disable-update-check \
  /home/coder/workspace
