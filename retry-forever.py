#!/usr/bin/env python3
import sys
import time
import subprocess


def main(args):
    RETRY_DELAY = 1
    while True:
        try:
            shellout = subprocess.run(args)
            if shellout.returncode == 0:
                break
            else:
                raise RuntimeError("Command failed!")
        except Exception as e:
            print("=" * 100)
            print(e)
            print("Retrying in {}s...".format(RETRY_DELAY))
            print("=" * 100)
            time.sleep(RETRY_DELAY)
    return 0


if __name__ == "__main__":
    if len(sys.argv) < 2 or sys.argv[1] in ['-h', '--help']:
        print("Usage: run-forever <Executable> [<Command-line options>]")
        sys.exit(1)
    sys.exit(main(sys.argv[1:]))
