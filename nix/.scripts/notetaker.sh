#!/bin/sh
 
noteFilename="$HOME/Documents/Notes/note-$(date +%Y-%m-%d).md"

nvim -c "norm Go" \
    -c "norm zz" \
    -c "startinsert" $noteFilename
