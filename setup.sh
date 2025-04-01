#!/usr/bin/env bash
# setup-litellm.sh

# Exit on any error
set -e

check_litellm() {
  if pip show litellm > /dev/null 2>&1; then
    echo "litellm is installed."
    return 0
  else
    return 1
  fi
}

# Create venv if it doesn’t exist
if [ ! -d "venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv venv
else
  echo "Virtual environment already exists, reusing it..."
fi

# Activate venv (works for this script’s scope)
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip in venv to avoid install issues
echo "Upgrading pip in the virtual environment..."
pip install --upgrade pip --quiet

# Install all packages from requirements.txt in venv
echo "Installing packages from requirements.txt in virtual environment..."
pip install -r requirements.txt --quiet

# Ensure litellm.sh is executable
if [ -f "litellm.sh" ]; then
  chmod +x litellm.sh
fi

# Apply transformation.patch if it exists.
# The -N option tells patch to ignore patches that appear to be already applied.
if [ -f "transformation.patch" ]; then
  echo "Applying transformation.patch..."
  patch -N venv/lib/python3.12/site-packages/litellm/llms/cloudflare/chat/transformation.py < transformation.patch
fi

# Check if litellm is available after install
if check_litellm; then
  echo "Setup complete! litellm is installed."
  echo "Make sure your .env and config.yml files are properly configured."
  echo "Run ./litellm.sh to start litellm."
else
  echo "Error: litellm installation failed."
  exit 1
fi
