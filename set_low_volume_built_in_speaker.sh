#!/bin/bash
SINK="alsa_output.pci-0000_00_1f.3.analog-stereo"
pactl set-sink-mute ${SINK} false &&
pactl set-sink-volume ${SINK} 1%
