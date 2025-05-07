#!/bin/bash

# Check if an output filename is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <output_filename>"
  exit 1
fi

output_file=$1

# Check if the output file exists and prompt for overwrite confirmation
if [ -e "$output_file" ]; then
  read -p "$output_file already exists. Overwrite? (y/n): " confirm
  [[ $confirm != "y" ]] && { echo "Operation cancelled."; exit 0; }
fi

# Clear or create the output file
> "$output_file"

# Process each section file
for section in giris.txt gelisme.txt sonuc.txt; do
  # Select a random non-empty line from the section file
  line=$(awk 'NF' "$section" | shuf -n 1)
  echo "$line" >> "$output_file"
done

echo "Random story created in $output_file."

