#!/bin/bash
# Author: Noxy (a dhole who likes paws)
# This script will find and move any FA files in the working directory and move them to artist folders under $SORTDIR.

set -euo pipefail

# Directory where you want files to end up
SORTDIR=~/Pictures/FA_Sorted

# Find files in pwd that match what I think is a decent regex for FA image files
find . -iregex '.*/[0-9]+\.[a-z0-9]+_.*' -print0 | while read -d $'\0' f
do

    # awk out the artist name
    ARTIST="$(printf '%s' "$(basename "$f")" | awk -F '.' '{print$2}' | awk -F _ '{print$1}')"

    # Create the directory for the artist name if it doesn't exist already
    mkdir -p "$SORTDIR/$ARTIST"

    # Move the file
    mv -v "$f" "$SORTDIR/$ARTIST/$f"
done
