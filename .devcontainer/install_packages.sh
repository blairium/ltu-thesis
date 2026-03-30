#!/bin/sh
# Force the path to the 2026 binaries
TL_PATH="/usr/local/texlive/2026/bin/x86_64-linux"
REQUIREMENTS="requirements.tex.txt"

# Use the full path for tlmgr to avoid "command not found"
installed=$($TL_PATH/tlmgr list --only-installed --data name)

for pkg in $(cat "$REQUIREMENTS"); do
    if echo "$installed" | grep -q "^$pkg$"; then # Added ^ and $ for exact matching
        echo "$pkg is already installed, skipping."
        continue
    fi
    tlmgr install "$pkg"
done

# Ensure the binaries are linked
$TL_PATH/tlmgr path add