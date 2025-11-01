#!/bin/bash
# Description: This script reverses the organization process by moving files from subdirectories back to the parent directory.

# Choosing the working directory
DIR=${1:-.}

# Checking if directory exists
if [ ! -d "$DIR" ]; 
then 
  echo "Directory $DIR does not exist."
  exit 1
else
  echo "Directory $DIR exists."
  echo "Starting reverse organization process..."
fi

# Counter for moved files
files_moved=0

# Iterating through all subdirectories in the specified directory
for subdir in "$DIR"/*; do
    # Skip if not a directory or if it's the same as DIR (shouldn't happen but safety check)
    [ -d "$subdir" ] || continue
    [ "$subdir" = "$DIR" ] && continue
    
    subdir_name=$(basename -- "$subdir")
    
    # Process all files in the subdirectory
    moved_from_subdir=0
    for file in "$subdir"/*; do
        # Skip if it's a directory or doesn't exist
        [ -e "$file" ] || continue
        [ -d "$file" ] && continue
        
        filename=$(basename -- "$file")
        
        # Move file back to parent directory
        mv "$file" "$DIR/"
        echo "Moved: $filename ← $subdir_name/"
        ((files_moved++))
        ((moved_from_subdir++))
    done
    
    # Remove the subdirectory if it's now empty
    if [ "$moved_from_subdir" -gt 0 ]; then
        # Check if directory is empty after moving files
        if [ -z "$(ls -A "$subdir" 2>/dev/null)" ]; then
            rmdir "$subdir"
            echo "Removed empty directory: $subdir_name/"
        fi
    fi
done

if [ "$files_moved" -eq 0 ]; then
    echo "No files found to move back. All files are already in the main directory."
else
    echo "Reverse organization complete! Moved $files_moved file(s) back to the main directory."
fi

