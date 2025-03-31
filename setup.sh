#!/usr/bin/env bash

set -e

echo "🌀 installing nvim dependencies..."

# detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "🍎 macOS detected"
  brew install lua-language-server
elif command -v pacman &>/dev/null; then
  echo "🐧 arch-based system detected"
  sudo pacman -Sy --noconfirm lua-language-server
elif command -v apt &>/dev/null; then
  echo "🐧 debian-based system detected"
  sudo apt update
  sudo apt install -y lua-language-server
else
  echo "⚠️ unsupported system. install lua-language-server manually."
fi

echo "✅ done. now run nvim and let lazy.nvim do its thing."
