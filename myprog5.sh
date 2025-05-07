#!/bin/bash

# Check if at least one argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <wildcard> [directory]"
    exit 1
fi

# Handle wildcard and directory arguments
WILDCARD="$1"
DIR=${2:-.}  # Default to current directory if no second argument

# Verify if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
fi

echo "Searching for files matching '$WILDCARD' in directory '$DIR' and its subdirectories..."

# Find files matching the wildcard pattern in the specified directory and its subdirectories
FILES=$(find "$DIR" -type f -name "$WILDCARD")

# Check if any files matched
if [ -z "$FILES" ]; then
    echo "No files matching '$WILDCARD' found in '$DIR'."
    exit 0
fi

# Loop through each file and ask for confirmation to delete
COUNT=0
for FILE in $FILES; do
    echo "Do you want to delete $FILE? (y/n): "
    read -r RESPONSE
    if [ "$RESPONSE" == "y" ]; then
        rm "$FILE"
        COUNT=$((COUNT + 1))
        echo "Deleted: $FILE"
    fi
done

echo "$COUNT file(s) deleted."

