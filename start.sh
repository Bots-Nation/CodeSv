
#!/usr/bin/env bash
set -e

PORT="${PORT:-8000}"
PASSWORD="GOATS"

mkdir -p /home/coder/.config/code-server

cat > /home/coder/.config/code-server/config.yaml <<EOF
bind-addr: 0.0.0.0:${PORT}
auth: password
password: "${PASSWORD}"
cert: false
EOF

exec code-server \
  --config /home/coder/.config/code-server/config.yaml \
  --disable-telemetry \
  --disable-update-check \
  /home/coder/workspace
