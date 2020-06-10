#!/usr/bin/env python3
import subprocess
import time
import sys
import re

SCALING_FACTOR_HIGH = 1.20
SCALING_FACTOR_LOW = 1.12


def get(cmd):
    return subprocess.check_output(cmd).decode("utf-8")

# - to count the occurrenc of "DP-2-"
def count_ext_screens():
    strings = get("xrandr").split('\n')
    count = 0
    for s in strings:
        m = re.search("DP.* connected", s)
        if m is not None:
            count += 1
    return count

# - to run the connect / disconnect command(s)
def run_command(cmd):
    subprocess.Popen(["/bin/bash", "-c", cmd])


def main():
    if count_ext_screens() > 2:
        print("More than 2 monitors connected, setting scaling factor {}".format(SCALING_FACTOR_LOW))
        run_command("gsettings set org.gnome.desktop.interface text-scaling-factor {}".format(SCALING_FACTOR_LOW))

    else:
        print("Less than 2 monitors connected, switching to {}".format(SCALING_FACTOR_HIGH))
        run_command("gsettings set org.gnome.desktop.interface text-scaling-factor {}".format(SCALING_FACTOR_HIGH))


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "oneshot":
        sys.exit(main())

    while True:
        try:
            main()
        except:
            time.sleep(5)
            continue
        time.sleep(15)
