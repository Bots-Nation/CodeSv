
FROM codercom/code-server:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV PORT=8000

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl wget nano vim unzip zip \
    build-essential gcc g++ clang cmake gdb \
    python3 python3-pip python3-venv python3-dev \
    ffmpeg ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/coder/workspace \
    && chown -R coder:coder /home/coder

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

USER coder
WORKDIR /home/coder/workspace

EXPOSE 8000

CMD ["/usr/local/bin/start.sh"]
