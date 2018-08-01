#!/bin/bash
# Fix google chrome flickering issue
DESKTOP_FILE='/usr/share/applications/google-chrome.desktop'
NUM_MATCHES=$(grep "disable-gpu-driver-bug-workarounds.*enable-native-gpu-memory-buffers" $DESKTOP_FILE | wc -l)
echo "$NUM_MATCHES matches found"
if (( $NUM_MATCHES >= 3 ))
then
    echo "Fix already applied"
else
    echo "Applying changes to  $DESKTOP_FILE";
    sed -i 's/google-chrome-stable/google-chrome-stable --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers /g' $DESKTOP_FILE
fi


