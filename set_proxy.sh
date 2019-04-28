#!/bin/bash
CCM_PROXY="http://192.168.250.6:8080"
ENV_FILE="/etc/environment"

unset_proxy() {
    sed -i '/http_proxy/d' $ENV_FILE
    sed -i '/https_proxy/d' $ENV_FILE
}

set_proxy() {
    echo "http_proxy=$CCM_PROXY"  | tee -a $ENV_FILE
    echo "https_proxy=$CCM_PROXY" | tee -a $ENV_FILE
}

if [[ "$1" -eq "" ]]; then
    echo "Enter at least one argument"
elif [[ "$1" -eq "0" ]]; then
    unset_proxy
elif [[ "$1" -eq "1" ]]; then
    unset_proxy
    set_proxy
else
    echo "Provide 0 to unset, 1 to set"
fi
