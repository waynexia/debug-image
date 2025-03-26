# Build kafka-bench
FROM rust:slim AS builder
ENV HTTP_PROXY=http://172.17.0.1:7890
ENV HTTPS_PROXY=http://172.17.0.1:7890
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN git clone https://github.com/v0y4g3r/kafka-bench.git
RUN cd kafka-bench && cargo build --release

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

# Copy the built kafka-bench binary from the builder stage
COPY --from=builder /build/kafka-bench/target/release/kafka-bench /usr/local/bin/kafka-bench
RUN chmod +x /usr/local/bin/kafka-bench && \
    kafka-bench --help

# Set working directory
WORKDIR /workspace

# Set an entrypoint that keeps the container running
CMD ["bash"]
