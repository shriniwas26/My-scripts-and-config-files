#!/usr/bin/env python3
import os
import subprocess
import sys
import time

RETRY_DELAY = 1
MAX_ATTEMPTS = 20


def main(args):
    for i in range(1, MAX_ATTEMPTS+1):
        try:
            shellout = subprocess.run(args)
            if shellout.returncode == 0:
                return 0
            else:
                raise RuntimeError("Nonzero return code!")
        except Exception as e:
            print(e)
            print("#" * 25)
            print("## Attempt {} failed!".format(i))
            print("## Retrying in {}s ...".format(RETRY_DELAY))
            print("#" * 25)
            time.sleep(RETRY_DELAY)

    print("## All {} attempts over. Exiting.".format(MAX_ATTEMPTS))
    return 1


if __name__ == "__main__":
    if len(sys.argv) < 2 or sys.argv[1] in ['-h', '--help']:
        self_name = os.path.split(sys.argv[0])[1]
        print("Usage: {} <Executable> [CMD LINE ARG 1] [CMD LINE ARG 2] ...".format(self_name))
        sys.exit(1)
    sys.exit(main(sys.argv[1:]))
