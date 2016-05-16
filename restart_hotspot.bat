rem netsh wlan show drivers
netsh wlan stop hostednetwork
timeout 2
netsh wlan set hostednetwork mode=allow ssid=Shriniwas key=123qweasd
netsh wlan start hostednetwork
timeout 10