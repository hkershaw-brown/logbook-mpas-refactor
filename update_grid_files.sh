#!/bin/bash

replacement_value=655362

# Read file names from the file 'namelists'
while IFS= read -r file; do
    if [[ -f "$file" ]]; then
        # Replace 10242 with the value of $replacement_value in the file
        sed -i "s/10242/$replacement_value/g" "$file"
        echo "Updated $file"
    else
        echo "File not found: $file"
    fi
done < files.txt