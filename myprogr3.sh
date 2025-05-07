#!/bin/bash

# Create writable directory if it doesn't exist, or clear it if it does
if [ -d writable ]; then
  rm -rf writable/*
else
  mkdir -p writable
fi

count=0

# Move files with write permission for owner
for file in *; do
  if [[ -f $file && -w $file ]]; then
    mv "$file" writable/
    ((count++))
  fi
done

# Output the result
echo "$count files moved to writable directory."

