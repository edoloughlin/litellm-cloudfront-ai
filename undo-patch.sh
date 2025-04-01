#!/usr/bin/env bash
patch -R -N venv/lib/python3.12/site-packages/litellm/llms/cloudflare/chat/transformation.py < transformation.patch
