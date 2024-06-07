#!/bin/bash
docker buildx build \
-t geriapp/imap-devel:1.2 \
-t geriapp/imap-devel:latest \
--file Dockerfile \
--platform linux/arm64,linux/amd64 \
--push .