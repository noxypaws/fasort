#!/bin/bash

# List files
ls | egrep '$\d+\.[0-9a-zA-Z-]+_.+\.\w+^' > fasort.txt 
