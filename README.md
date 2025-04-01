# litellm-cloudfront-ai
An attempt to make LiteLLM and Aider work with Cloudflare AI Gateway and Deepseek

Best of luck - they don't get along.

Get started, or whatever:

You will need to bring your own Cloudfront AI Gateway and an API key you can use with it. The scripts in this repo look for:

- `CF_API_KEY` - your Cloudfront API key, with permissions to use the AI Gateway
- `CF_API_BASE` - your Cloudfront AI Gateway endpoint. It should look something like `https://gateway.ai.cloudflare.com/v1/<your account id>/<a worker path maybe?>

Setup and run:

- Run `./setup.sh`.

This will create a Python virtual env and install LiteLLM and its deps. Note that it installs a specific version because it patches it.

- Copy the files in `./aider` to `$HOME` or a Git directory you want to work on and rename them so they start with `.`

- Run `./litellm.sh` here.

- Start AIDER 
