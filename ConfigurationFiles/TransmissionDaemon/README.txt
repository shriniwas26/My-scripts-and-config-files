======
Step 1
======
Install transmission-daemon package.

======
Step 2
======
Disable the default service, which runs as debian-transmission user.
sudo systemctl disable transmission-daemon.service

======
Step 3
======
Create & run a new service using the 'pi' user
sudo systemctl daemon-reload && sudo systemctl enable transmission-daemon-pi.service                                                                          130 ↵

======
Step 4
======
Copy settings.json to ~/.config/transmission-daemon/settings.json.

======
Step 5
======
Reboot the Pi.