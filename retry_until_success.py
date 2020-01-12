#!/usr/bin/env python3
import os
import sys
import time
import signal

WAIT_SECONDS = 1


def my_print(string):
    buf = "=" * 25
    print("{0} {1:<30} {0}".format(buf, string))


def execute(exec_comm):
    i = 0
    while True:
        i += 1
        my_print("Attempt #{}".format(i))
        print("Executing command: {}".format(exec_comm))
        print()
        return_code = os.system(exec_comm)
        if return_code == 0:
            break
        else:
            retry_time = WAIT_SECONDS
            my_print("Retrying in {:.2f} seconds...".format(retry_time))
            time.sleep(retry_time)

if __name__ == "__main__":
    exec_comm = " ".join(sys.argv[1:])
    execute(exec_comm)
