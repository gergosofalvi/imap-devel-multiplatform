#!/bin/bash
docker buildx build \
-t geriapp/imap-devel:1.1 \
--file Dockerfile \
--platform linux/arm64,linux/amd64 \
.
