#!/bin/bash
export PATH="/opt/homebrew/bin:/usr/bin:/bin"
REPO="$HOME/Documents/GitHub/AuburnGroveSupport"
fswatch -o --exclude '\.git' "$REPO" | while read -r _; do
  sleep 2
  cd "$REPO" || continue
  if [[ -n $(git status --porcelain) ]]; then
    git add -A
    git commit -m "auto upload $(date '+%F %T')"
    git push
  fi
done
