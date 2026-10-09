
FROM codercom/code-server:latest

USER root

RUN mkdir -p /home/coder/workspace \
    /home/coder/.config/code-server \
    && chown -R coder:coder /home/coder

USER coder

ENV PORT=8000

WORKDIR /home/coder/workspace

EXPOSE 8000

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["printf 'bind-addr: 0.0.0.0:%s\\nauth: password\\npassword: GOATS\\ncert: false\\n' \"${PORT:-8000}\" > /home/coder/.config/code-server/config.yaml && exec /usr/bin/code-server --config /home/coder/.config/code-server/config.yaml --disable-telemetry /home/coder/workspace"]
