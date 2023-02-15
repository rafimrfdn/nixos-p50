#!/bin/bash
#uptime | awk '{print "    " $3 }' | sed 's/,/ /'
uptime | awk '{print "  " $3 }' | sed 's/,/ /'
