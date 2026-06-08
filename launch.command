#!/bin/bash
# Double-click this file to launch the Slidev deck live in your browser. 💖
cd "$(dirname "$0")" || exit 1
echo "🍵  Knowledge VSI — launching your slides..."
echo

if [ ! -d node_modules ]; then
  echo "📦  First run: installing dependencies (this can take a minute)..."
  npm install || { echo "❌ npm install failed. Is Node installed? (https://nodejs.org)"; read -r -p "Press Return to close..."; exit 1; }
fi

echo "🚀  Starting the dev server — your browser will open at http://localhost:3030"
echo "    (Leave this window open while presenting. Press Ctrl+C here to stop.)"
echo
npm run dev
