#!/usr/bin/env python3
import os
import sys
import time
import signal

WAIT_SECONDS = 0.5

def execute(exec_comm):
    i = 0
    while True:
        i += 1
        print("---> Attempt #{}".format(i))
        print("---> Executing command: {}".format(exec_comm))
        return_code = os.system(exec_comm)
        if return_code == 0:
            break
        else:
            print("---> Retrying in {} seconds...".format(WAIT_SECONDS))
            print()
            time.sleep(WAIT_SECONDS)


if __name__ == "__main__":
    exec_comm = " ".join(sys.argv[1:])
    execute(exec_comm)
