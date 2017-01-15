#!/bin/bash
# Author: Noxy (a dhole who likes paws)
# This script will find and move any FA files in the working directory and move them to artist folders under $SORTDIR.

# Directory where you want files to end up
SORTDIR=~/Pictures/FA_Sorted

# Find files in pwd that match what I think is a decent regex for FA image files
for f in `ls | egrep '^\d+\.[0-9a-zA-Z-]+_.+\.\w+$'`
do

    # awk out the artist name
    ARTIST=$(echo $f | awk -F '.' '{print$2}' | awk -F _ '{print$1}')

    # Create the directory for the artist name if it doesn't exist already
    if [ ! -d $SORTDIR/$ARTIST ]; then
        mkdir -p $SORTDIR/$ARTIST
    fi

    # Move the file
    mv $f $SORTDIR/$ARTIST/$f
done
