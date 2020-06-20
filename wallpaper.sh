#!/bin/bash
APPDATA="$HOME/Library/Application Support/my.wallpaper"
WFILE="wallpaper$RANDOM.jpg"
[[ -d "$APPDATA/current" ]] || mkdir -p "$APPDATA/current"
curl -k -s https://eumetview.eumetsat.int/static-images/latestImages/EUMETSAT_MSG_RGBNatColourEnhncd_LowResolution.jpg -o "$APPDATA/$WFILE"
if [ -f "$APPDATA/$WFILE" ]; then
	rm -f "$APPDATA/current"/*.jpg
	mv "$APPDATA/$WFILE" "$APPDATA/current/"
	rm -f "$APPDATA/$WFILE"
    osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$APPDATA/current/$WFILE\""
else
	#download failed, do nothing
	exit 0
fi

