#!/usr/bin/env bash

set -e

echo "🌀 installing nvim dependencies..."

# detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "🍎 macOS detected"
  brew install lua-language-server
  brew install stylua
  brew install shfmt
  # bash-language-server
  if ! command -v bash-language-server &>/dev/null; then
    echo "📦 installing bash-language-server..."
    npm install -g bash-language-server
  fi
else
  echo "⚠️ unsupported system. install lua-language-server manually."
fi

echo "✅ done. now run nvim and let lazy.nvim do its thing."
