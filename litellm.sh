#!/usr/bin/env bash
source .env
if [ -z "$CF_API_KEY" ]; then
  echo "Error: CF_API_KEY environment variable not set"
  exit 1
fi
if [ ! -n "$VIRTUAL_ENV" ]; then
  source venv/bin/activate
  [ "$?" -ne "0" ] && echo "Couldn't activate a virtual env" && exit 1
fi
litellm --config config.yml
