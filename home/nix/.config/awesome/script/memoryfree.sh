#!/bin/bash

#free -m | awk ' FNR == 2 {print " M " $3 }  '
free -m | awk ' FNR == 2 {print " " $3 }  '
