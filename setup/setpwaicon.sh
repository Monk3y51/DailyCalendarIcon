#!/bin/sh

# Set paths using $HOME for user directory expansion
SEARCH_DIR="$HOME/.local/share/applications"
NEW_ICON="$HOME/Pictures/calendar.png"

# Verify the replacement image exists first
if [ ! -f "$NEW_ICON" ]; then
    echo "Error: Image file not found at $NEW_ICON"
    exit 1
fi

# Locate the Google Calendar .desktop file created by Chrome/Chromium
DESKTOP_FILE=$(grep -l -i "Google Calendar" "$SEARCH_DIR"/chrome-*.desktop 2>/dev/null | head -n 1)

if [ -n "$DESKTOP_FILE" ]; then
    # Update or add the Icon key inside the .desktop file
    if grep -q "^Icon=" "$DESKTOP_FILE"; then
        sed -i "s|^Icon=.*|Icon=$NEW_ICON|" "$DESKTOP_FILE"
    else
        echo "Icon=$NEW_ICON" >> "$DESKTOP_FILE"
    fi
    
    # Refresh the desktop database so changes reflect immediately
    update-desktop-database "$SEARCH_DIR" 2>/dev/null
    echo "Successfully updated icon in: $DESKTOP_FILE"
else
    echo "Error: Could not find Google Calendar .desktop file in $SEARCH_DIR"
    exit 1
fi
