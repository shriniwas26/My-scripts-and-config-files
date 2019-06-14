#!/bin/bash
# exit when any command fails
set -e

# Set variables
CCM_PROXY="http://192.168.250.6:8080"
ENV_FILE="/etc/environment"

# Functions
unset_proxy() {
    sed -i '/http_proxy/d' $ENV_FILE
    sed -i '/https_proxy/d' $ENV_FILE
    sed -i '/no_proxy/d' $ENV_FILE
}

set_proxy() {
    echo "http_proxy=$CCM_PROXY"  | tee -a $ENV_FILE
    echo "https_proxy=$CCM_PROXY" | tee -a $ENV_FILE
    echo "no_proxy='127.0.0.1, localhost'" | tee -a $ENV_FILE
}


# "main"

echo "Command line argument = [$1]"

if [[ "$1" == "" ]]; then
    echo "Enter at least one argument"

elif [[ "$1" == "0" ]]; then
    echo "Trying to unset proxy in file [$ENV_FILE]"
    unset_proxy
    echo "Done!"

elif [[ "$1" == "1" ]]; then
    echo "Trying to set proxy in [$ENV_FILE]"
    unset_proxy
    set_proxy
    echo "Done!"

else
    echo "Wrong command line argument: Provide 0 to unset, 1 to set proxy"
fi
