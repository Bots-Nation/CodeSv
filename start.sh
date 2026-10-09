
#!/usr/bin/env bash
set -e

PORT="${PORT:-8000}"
CONFIG="/home/coder/.config/code-server/config.yaml"

mkdir -p "$(dirname "$CONFIG")"
mkdir -p /home/coder/workspace

cat > "$CONFIG" <<EOF
bind-addr: 0.0.0.0:${PORT}
auth: password
password: GOATS
cert: false
EOF

echo "=== Active Code Server Config ==="
cat "$CONFIG"

exec code-server \
  --config "$CONFIG" \
  --disable-telemetry \
  --disable-update-check \
  /home/coder/workspace
