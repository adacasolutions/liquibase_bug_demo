#!/usr/bin/env bash

if [ -n "$VERBOSE" ]; then
  set -x
fi

set -euo pipefail

docker-compose -p example down
