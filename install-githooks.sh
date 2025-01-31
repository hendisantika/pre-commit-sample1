#!/bin/bash

echo "Installing Git hooks..."

HOOKS_DIR=".githooks"
GIT_HOOKS_DIR=".git/hooks"

# Copy hooks to .git/hooks and make them executable
cp -r "$HOOKS_DIR/"* "$GIT_HOOKS_DIR/"
chmod +x "$GIT_HOOKS_DIR/pre-commit"
chmod +x "$GIT_HOOKS_DIR/commit-msg"

echo "Git hooks installed successfully!"
echo "Hendi Santika: $(date)"
