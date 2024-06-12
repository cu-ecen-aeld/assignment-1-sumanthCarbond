#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory."
    exit 1
fi

# Count the number of files (excluding subdirectories)
file_count=$(find "$filesdir" -type f | wc -l)

# Search for matching lines within files
matching_lines=$(grep -rl "$searchstr" "$filesdir" | wc -l)

# Print the results
echo "The number of files are $file_count and the number of matching lines are $matching_lines."

