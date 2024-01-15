#!/bin/sh
DOWNLOAD_PATH=/tmp/mongolian-phonetic-keyboard
KBL_PATH=$HOME/Library/Keyboard\ Layouts
DIR_NAME=amgaa-mongolian-phonetic-*

echo 'Downloading...'
if [ ! -d "$DOWNLOAD_PATH" ]; then
  mkdir -p $DOWNLOAD_PATH
fi
cd $DOWNLOAD_PATH

curl -sL $(curl -s https://api.github.com/repos/amgaa/mongolian-phonetic/releases/latest | grep "zipball_url" | awk '{print $2}' | sed 's|[\"\,]*||g') > mongolian-phonetic.zip
unzip mongolian-phonetic.zip
rm mongolian-phonetic.zip

echo 'Downloaded, copying files...'
if [ ! -d "$KBL_PATH" ]; then
    mkdir -p $KBL_PATH
fi

for dir in $DIR_NAME; do
    if [ -d "$dir" ]; then
        cp -R "$dir"/Mongolian-phonetic.* "$KBL_PATH"/
    fi
done


echo 'Please first logout and login. Then ...'
echo 'Ventura: Go to System Settings -> Keyboard -> Input Sources -> press edit button -> press + button'
echo 'Others: Go to System Preferences -> Keyboard -> Input Sources -> press + button'
echo 'Search "Mongolian-phonetic" and press add'