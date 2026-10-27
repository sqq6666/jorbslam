#!/usr/bin/env bash
# Push JORBSLAM to GitHub via SSH: git@github.com:sqq6666/jorbslam.git
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

REMOTE_URL="${REMOTE_URL:-git@github.com:sqq6666/jorbslam.git}"
BRANCH="${BRANCH:-main}"

if [[ ! -d .git ]]; then
  git init -b "$BRANCH"
fi

if ! grep -q '^# jorbslam' README.md 2>/dev/null; then
  printf '%s\n\n' '# jorbslam' | cat - README.md > README.md.tmp && mv README.md.tmp README.md
fi

git add -A
git status

if git diff --cached --quiet; then
  echo "Nothing to commit (already clean)."
else
  git commit -m "first commit"
fi

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

git branch -M "$BRANCH"
git push -u origin "$BRANCH"

echo "Done (SSH): $REMOTE_URL"
