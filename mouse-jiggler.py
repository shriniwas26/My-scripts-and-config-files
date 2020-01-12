#!/usr/bin/env python3
import time
from autopilot.input import Mouse


def move_mouse(delta):
    x, y = mouse.position()
    print()
    print("Mouse at position :", (x, y))
    x1, y1 = x + delta, y + delta
    mouse.move(x1, y1, animate=False)
    print("Moved mouse to    :", (x1, y1))


def main():
    # Number of pixels to move in one jiggle
    DELTA = 5
    # Jiggle time period in seconds
    TIME_PERIOD = 1
    mouse = Mouse.create()
    while True:
        move_mouse(DELTA)
        time.sleep(TIME_PERIOD/2)
        move_mouse(DELTA * -1)
        time.sleep(TIME_PERIOD/2)


if __name__ == "__main__":
    main()