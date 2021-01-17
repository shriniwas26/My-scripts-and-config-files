#!/usr/bin/env python3
import sys
import time
import subprocess

RETRY_DELAY = 1
MAX_ATTEMPTS = 20

def main(args):
    for i in range(1, MAX_ATTEMPTS+1):
        try:
            shellout = subprocess.run(args)
            if shellout.returncode == 0:
                break
            else:
                raise RuntimeError("Nonzero return code!")
        except Exception as e:
            print(e)
            print("#" * 25)
            print("## Attempt {} failed!".format(i))
            print("## Retrying in {}s ...".format(RETRY_DELAY))
            print("#" * 25)
            time.sleep(RETRY_DELAY)
    return 0


if __name__ == "__main__":
    if len(sys.argv) < 2 or sys.argv[1] in ['-h', '--help']:
        print("Usage: run-forever <Executable> [<Command-line options>]")
        sys.exit(1)
    sys.exit(main(sys.argv[1:]))
