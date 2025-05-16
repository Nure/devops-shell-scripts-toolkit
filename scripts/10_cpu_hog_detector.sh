#!/bin/bash

THRESHOLD=80
echo "Checking for CPU hogs over $THRESHOLD%"

ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | awk -v t="$THRESHOLD" '
NR==1 {print $0}
NR>1 && $4 > t {print $0}
'

# CPU hogs are processes that consume an unusually 
# high percentage of CPU over a sustained period of time often 
# degrading system performance or affecting other processes.

# When to Worry?
# A process uses >80% CPU for long

# The system becomes slow, unresponsive

# CPU usage is spiking frequently