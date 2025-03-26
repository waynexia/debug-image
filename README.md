# Debug Docker Image

A Docker image for debugging purposes, automatically built and published to GitHub Container Registry.

## Overview

This repository contains the source code and configuration to build a Docker debug image that's useful for troubleshooting and diagnostics in containerized environments.

## Tools
The image includes a variety of debugging tools and utilities, including:
- curl
- telnet
- nc
- fio
- iperf
- [kafka-bench](https://github.com/v0y4g3r/kafka-bench)

## Usage

Pull the image from GitHub Container Registry:

```bash
docker pull ghcr.io/waynexia/debug-image/debug-image:latest
```

Or use a specific version:

```bash
docker pull ghcr.io/waynexia/debug-image/debug-image:v1.0.0
```

Then use it with:

```bash
# Run an interactive shell in the debug container
docker run -it --rm ghcr.io/waynexia/debug-image/debug-image:latest bash

# Mount a volume for debugging
docker run -it --rm -v /path/to/debug:/mnt ghcr.io/waynexia/debug-image/debug-image:latest
```

## Build Process

The image is automatically built and published to GitHub Container Registry when:

1. A new tag is pushed with the pattern `v*.*.*`
2. A new GitHub release is published

The build process leverages GitHub Actions for CI/CD, using Docker Buildx for efficient builds with caching.

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature-name`
5. Submit a pull request

