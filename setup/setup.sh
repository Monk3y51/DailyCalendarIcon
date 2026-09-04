#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# move the autostart desktop file
cp $SCRIPT_DIR/.config/autostart/calendariconupdate.sh.desktop $HOME/.config/autostart/

# move the calendariconupdate.sh files
cp $SCRIPT_DIR/.scripts/calendariconupdate.sh $HOME/.scripts/
chmod +x $HOME/.scripts/calendariconupdate.sh

# run the setpwaicon.sh
chmod +x $SCRIPT_DIR/.scripts/setpwaicon.sh
$SCRIPT_DIR/.scripts/setpwaicon.sh

exit
