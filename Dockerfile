FROM ubuntu:24.04

# Set non-interactive installation to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required tools
RUN apt-get update && apt-get install -y \
    curl \
    telnet \
    netcat-openbsd \
    fio \
    iperf3 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Set an entrypoint that keeps the container running
CMD ["bash"]
