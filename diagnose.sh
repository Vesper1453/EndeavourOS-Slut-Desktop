#!/bin/bash
# 🔧 Diagnostic script - Run this to check what's wrong

echo "=== 1. Current Directory ==="
pwd

echo ""
echo "=== 2. Files in Current Directory ==="
ls -la

echo ""
echo "=== 3. Looking for install.sh ==="
if [ -f "install.sh" ]; then
    echo "✅ install.sh found"
    ls -la install.sh
else
    echo "❌ install.sh NOT found!"
    echo "Searching for it..."
    find . -name "install.sh" 2>/dev/null
fi

echo ""
echo "=== 4. Looking for KDE scripts ==="
ls -la kde/scripts/ 2>/dev/null || echo "❌ kde/scripts/ directory not found"

echo ""
echo "=== 5. Shell Info ==="
echo "Current shell: $SHELL"
echo "Shell version: $BASH_VERSION"

echo ""
echo "=== 6. EndeavourOS Check ==="
if [ -f /etc/os-release ]; then
    cat /etc/os-release | grep -E "^(NAME|ID|PRETTY_NAME)="
else
    echo "❌ Cannot detect OS"
fi

echo ""
echo "=== 7. Trying to run install.sh ==="
if [ -f "install.sh" ]; then
    echo "Testing bash install.sh..."
    bash install.sh --help 2>&1 || echo "Failed with exit code $?"
fi