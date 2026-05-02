#!/bin/bash
# Don't Git Afraid - Git status analyzer
# Usage: bash git-status.sh [repo_path]

set -e

REPO_PATH="${1:-.}"
cd "$REPO_PATH"

# Check if git repo
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "NOT_A_REPO"
  exit 0
fi

echo "=== DONT_GIT_AFRAID_STATUS ==="

# Branch
BRANCH=$(git branch --show-current 2>/dev/null || echo "DETACHED")
IS_DETACHED=$(git symbolic-ref -q HEAD &>/dev/null && echo "false" || echo "true")
echo "BRANCH=$BRANCH"
echo "DETACHED=$IS_DETACHED"

# Ahead/Behind
UPSTREAM=$(git rev-parse --abbrev-ref @{upstream} 2>/dev/null || echo "")
if [ -n "$UPSTREAM" ]; then
  AHEAD=$(git rev-list --count @{upstream}..HEAD 2>/dev/null || echo "0")
  BEHIND=$(git rev-list --count HEAD..@{upstream} 2>/dev/null || echo "0")
else
  AHEAD="0"
  BEHIND="0"
fi
echo "AHEAD=$AHEAD"
echo "BEHIND=$BEHIND"
echo "HAS_REMOTE=$([ -n "$UPSTREAM" ] && echo 'true' || echo 'false')"

# Working directory changes (not staged)
echo "--- WORKING ---"
git diff --name-status 2>/dev/null | while IFS=$'\t' read -r status file; do
  case "$status" in
    M) echo "MODIFIED $file" ;;
    D) echo "DELETED $file" ;;
    R*) echo "RENAMED $file" ;;
    *) echo "CHANGED $file" ;;
  esac
done

# Untracked files
git ls-files --others --exclude-standard 2>/dev/null | while read -r file; do
  echo "NEW $file"
done

# Staged changes
echo "--- STAGED ---"
git diff --cached --name-status 2>/dev/null | while IFS=$'\t' read -r status file; do
  case "$status" in
    M) echo "MODIFIED $file" ;;
    A) echo "NEW $file" ;;
    D) echo "DELETED $file" ;;
    R*) echo "RENAMED $file" ;;
    *) echo "CHANGED $file" ;;
  esac
done

# Conflicts
echo "--- CONFLICTS ---"
git diff --name-only --diff-filter=U 2>/dev/null | while read -r file; do
  echo "CONFLICT $file"
done

# Recent commits (last 5)
echo "--- COMMITS ---"
git log --oneline --format="%h|%s|%cr" -5 2>/dev/null | while IFS='|' read -r hash msg time; do
  echo "COMMIT $hash|$msg|$time"
done

# Stash count
STASH_COUNT=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
echo "--- META ---"
echo "STASH_COUNT=$STASH_COUNT"

# Total file count in repo
TOTAL_FILES=$(git ls-files 2>/dev/null | wc -l | tr -d ' ')
echo "TOTAL_FILES=$TOTAL_FILES"

# .gitignore check
if [ -f ".gitignore" ]; then
  echo "HAS_GITIGNORE=true"
else
  echo "HAS_GITIGNORE=false"
fi

# Dangerous files check (files that should NOT be committed)
echo "--- DANGERS ---"

# Check if node_modules is tracked or about to be
if git ls-files --cached node_modules 2>/dev/null | head -1 | grep -q .; then
  echo "DANGER node_modules is tracked!"
fi
if [ -d "node_modules" ] && ! grep -q "node_modules" .gitignore 2>/dev/null; then
  echo "WARN node_modules not in .gitignore"
fi

# Check for .env files
for envfile in .env .env.local .env.production .env.development; do
  if git ls-files --cached "$envfile" 2>/dev/null | grep -q .; then
    echo "DANGER $envfile is tracked!"
  fi
  if [ -f "$envfile" ] && ! grep -q "\.env" .gitignore 2>/dev/null; then
    echo "WARN $envfile not in .gitignore"
  fi
done

# Check for common secret patterns in staged files
git diff --cached --name-only 2>/dev/null | while read -r file; do
  if echo "$file" | grep -qiE '(\.pem|\.key|id_rsa|credentials|secret)'; then
    echo "DANGER $file looks like a secret file!"
  fi
done

# Remote info
echo "--- REMOTE ---"
REMOTE_URL=$(git remote get-url origin 2>/dev/null || echo "")
echo "REMOTE_URL=$REMOTE_URL"
REMOTE_NAME=$(git remote 2>/dev/null | head -1 || echo "")
echo "REMOTE_NAME=$REMOTE_NAME"

echo "=== END ==="
