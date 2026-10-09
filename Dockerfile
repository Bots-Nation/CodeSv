
FROM codercom/code-server:4.141.0

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl wget nano vim unzip zip \
    build-essential gcc g++ cmake \
    python3 python3-pip python3-venv python3-dev \
    ffmpeg ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /home/coder/workspace \
       /home/coder/.config/code-server \
       /home/coder/.local/share/code-server/User \
    && chown -R coder:coder /home/coder

USER coder

ENV PORT=8000

WORKDIR /home/coder/workspace

EXPOSE 8000

ENTRYPOINT []

CMD ["/bin/bash", "-lc", "printf 'bind-addr: 0.0.0.0:8000\\nauth: password\\npassword: GOATS\\ncert: false\\n' > /home/coder/.config/code-server/config.yaml; exec /usr/bin/code-server --config /home/coder/.config/code-server/config.yaml --disable-telemetry --disable-update-check /home/coder/workspace"]
