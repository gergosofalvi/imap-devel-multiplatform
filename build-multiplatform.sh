#!/bin/bash
docker buildx build \
-t geriapp/imap-devel \
--file Dockerfile \
--platform linux/arm64,linux/amd64 \
.
