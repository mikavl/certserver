#!/bin/sh
set -e
set -u

if [ ! -z "$SSH_ORIGINAL_COMMAND" ] && [ -f "$SSH_ORIGINAL_COMMAND" ]; then
  cat "$SSH_ORIGINAL_COMMAND"
else
  exit 1
fi
