#!/bin/bash
cd $HOME/Pictures/.icons/
curl -o "calendar.png" "https://www.gstatic.com/images/branding/productlogos/calendar_2026_$(date +%d)/v2/png/calendar_2026_$(date +%d)_96dp.png"
exit
