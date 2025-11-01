# File Organizer Script

A bash script that automatically organizes files in a directory into subdirectories based on their file extensions.

## Description

This script scans a specified directory and organizes files by creating folders based on their file extensions. Files are automatically moved into their corresponding category folders (e.g., `.txt` files go into `Txts/`, `.pdf` files go into `Pdfs/`, etc.).

## Features

- Automatically organizes files by file extension
- Creates category folders automatically
- Handles files without extensions (categorizes them as "others")
- Skips existing directories
- Validates directory existence before processing
- Provides progress feedback during organization

## Usage

### Basic Usage

Run the script in the current directory:
```bash
./organizer.sh
```

### Specify a Directory

Organize files in a specific directory:
```bash
./organizer.sh /path/to/directory
```

### Examples

```bash
# Organize files in current directory
./organizer.sh

# Organize files in Documents folder
./organizer.sh ~/Documents

# Organize files in a specific path
./organizer.sh /home/user/Downloads
```

## How It Works

1. The script accepts an optional directory path as an argument (defaults to current directory if not provided)
2. Verifies that the directory exists
3. Iterates through all items in the directory
4. For each file:
   - Extracts the file extension
   - Files without extensions are categorized as "others"
   - Creates a folder name by capitalizing the first letter of the extension and appending 's' (e.g., `txt` → `Txts`, `pdf` → `Pdfs`)
   - Moves the file into the corresponding folder
5. Displays progress messages for each moved file

## Folder Naming Convention

The script creates folders with the following naming pattern:
- Extension: `txt` → Folder: `Txts`
- Extension: `pdf` → Folder: `Pdfs`
- Extension: `jpg` → Folder: `Jpgs`
- Files without extension → Folder: `Others`

## Requirements

- Bash shell (typically available on Linux, macOS, and Windows with Git Bash or WSL)
- Execute permissions on the script

## Setup

1. Make the script executable:
   ```bash
   chmod +x organizer.sh
   ```

2. Run the script as described in the Usage section above.

## Notes

- The script skips directories and only processes files
- Existing folders with the same name will be used (files are moved into them)
- The script does not recursively process subdirectories
- Files are moved, not copied, so the original files will no longer be in the root directory after organization

## Example Output

```
Directory . exists.
Let's start working on it.
Moved: document.pdf → Pdfs/
Moved: image.jpg → Jpgs/
Moved: script.sh → Shs/
Moved: readme → Others/
Organization complete!
```

