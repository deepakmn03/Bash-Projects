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

---

# Deorganizer Script

A companion script that reverses the organization process by moving files from subdirectories back to the parent directory.

## Description

The `deorganizer.sh` script reverses the organization performed by `organizer.sh`. It moves all files from subdirectories back to the main directory and removes empty subdirectories afterward.

## Features

- Moves all files from subdirectories back to the parent directory
- Automatically removes empty directories after moving files
- Provides progress feedback during reverse organization
- Counts and reports the number of files moved

## Usage

### Basic Usage

Run the script in the current directory:
```bash
./deorganizer.sh
```

### Specify a Directory

Deorganize files in a specific directory:
```bash
./deorganizer.sh /path/to/directory
```

### Examples

```bash
# Deorganize files in current directory
./deorganizer.sh

# Deorganize files in Documents folder
./deorganizer.sh ~/Documents

# Deorganize files in a specific path
./deorganizer.sh /home/user/Downloads
```

## How It Works

1. The script accepts an optional directory path as an argument (defaults to current directory if not provided)
2. Verifies that the directory exists
3. Iterates through all subdirectories in the specified directory
4. For each subdirectory:
   - Moves all files back to the parent directory
   - Displays progress messages for each moved file
   - Removes the subdirectory if it becomes empty
5. Reports the total number of files moved

## Setup

1. Make the script executable:
   ```bash
   chmod +x deorganizer.sh
   ```

2. Run the script as described in the Usage section above.

## Notes

- The script only processes files (skips nested subdirectories)
- Empty subdirectories are automatically removed after files are moved
- If a file with the same name already exists in the parent directory, the move operation may fail or overwrite (depending on system settings)
- The script will skip the main directory itself if it's passed as a subdirectory

## Example Output

```
Directory . exists.
Starting reverse organization process...
Moved: document.pdf ← Pdfs/
Moved: image.jpg ← Jpgs/
Moved: script.sh ← Shs/
Moved: readme ← Others/
Removed empty directory: Pdfs/
Removed empty directory: Jpgs/
Removed empty directory: Shs/
Removed empty directory: Others/
Reverse organization complete! Moved 4 file(s) back to the main directory.
```

---
## Script Workflow

Here's how the scripts work together:

1. **`organizer.sh`**: Moves files from main directory → subdirectories (organized by extension)
2. **`deorganizer.sh`**: Moves files from subdirectories → main directory (reverses organizer)

You can alternate between organization and deorganization as needed!

