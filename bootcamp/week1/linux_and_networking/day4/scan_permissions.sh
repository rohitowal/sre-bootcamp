#!/bin/bash

# Get the current working directory
# pwd shows the directory from which the script is being executed
echo "Scanning current directory: $(pwd)"

# Find all world-writable files in the current directory
#
# .              -> start searching from the current directory
# -maxdepth 1    -> scan only the current directory, not subdirectories
# -type f        -> look for files only
# -perm -o+w     -> find files where "others" (world) have write permission
# -print         -> display the file path
# -exec          -> execute a command on each file found
# chmod o-w      -> remove write permission from "others"
# {}             -> represents the file found by find
# \;             -> marks the end of the -exec command
find . -maxdepth 1 -type f -perm -o+w -print -exec chmod o-w {} \;

# Print a message after the scan is complete
echo "Done."
