# Fix google chrome flickering issue

sed -i 's/google-chrome-stable/google-chrome-stable --disable-gpu-driver-bug-workarounds --enable-native-gpu-memory-buffers /g' /usr/share/applications/google-chrome.desktop
