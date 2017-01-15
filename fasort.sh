#!/bin/bash
#set -xv

SORTDIR=fasorted

for f in `ls | egrep '^\d+\.[0-9a-zA-Z-]+_.+\.\w+$'`
do
    ARTIST=$(echo $f | awk -F '.' '{print$2}' | awk -F _ '{print$1}')
    if [ ! -d $SORTDIR/$ARTIST ]; then
        mkdir -p $SORTDIR/$ARTIST
    fi
    mv $f $SORTDIR/$ARTIST/$f
done
