#!/bin/bash

echo "🔄 Starting auto-deploy process for AgitationPressureDrive..."

# Set Git config if not already set
git config --global user.name "TheRickyFoster"
git config --global user.email "therickyfoster@outlook.com"

# Normalize line endings for cross-platform compatibility
git config --global core.autocrlf input

# Initialize git repo if not already initialized
if [ ! -d ".git" ]; then
  git init
fi

# Set default branch to main
git branch -M main

# Add and commit changes
git add .
git commit -m "🚀 Initial commit for AgitationPressureDrive masterzip upload"

# Set GitHub repo URL (replace with your actual repo URL if needed)
REPO_NAME="AgitationPressureDrive"
USERNAME="TheRickyFoster"
REMOTE_URL="https://github.com/$USERNAME/$REPO_NAME.git"

# Check if remote already exists
if git remote | grep -q origin; then
  git remote set-url origin $REMOTE_URL
else
  git remote add origin $REMOTE_URL
fi

# Pull before pushing to avoid rejection errors
git fetch origin main || echo "No remote branch yet, safe to push."
git pull origin main --rebase || echo "Nothing to rebase."

# Push to GitHub
git push -u origin main

echo "✅ Deployment complete."
