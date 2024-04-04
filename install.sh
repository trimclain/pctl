#!/usr/bin/env bash

DEST="$HOME/.local/bin/pctl"

# add the -s or --silent flag to suppress output
SILENT='false'
if [[ "$1" == "-s" || "$1" == "--silent" ]]; then
    SILENT='true'
fi

[[ "$SILENT" == "true" ]] || echo "Installing pctl..."

if [[ "$SILENT" == "true" ]]; then
    curl -fsSL# https://raw.githubusercontent.com/trimclain/pctl/main/pctl --output pctl.tmp
else
    curl -fL# https://raw.githubusercontent.com/trimclain/pctl/main/pctl --output pctl.tmp
fi

rm -f "$DEST"
install -Dm755 pctl.tmp "$DEST"
rm -f pctl.tmp

[[ "$SILENT" == "true" ]] || echo "${GREEN}Installation finished${RESET}"
