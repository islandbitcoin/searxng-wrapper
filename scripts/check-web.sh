#!/bin/bash

DURATION=$(</dev/stdin)
if (($DURATION <= 5000)); then
    exit 60
else
    if curl -sSL --silent --fail https://searxng.embassy:8080 &>/dev/null; then
        echo "SearXNG Web UI is unreachable" >&2
        exit 1
    fi
fi