# Simple RAT Script

https://github.com/user-attachments/assets/2d0aaaf1-4bda-4263-80b8-37a5c44110f3

A simple `.bat` (Batch File) script designed to facilitate the operation of Remote Access Trojans (RATs) by disabling key Windows components. This script aims to make it difficult for users to remove the RAT from their PCs. 

**Works on Windows 10 & 11, do not forget to turn off antivirus before running the script!**

## Disabled Windows Components:

- **Consent Prompt Behavior Admin** (part of UAC)
- **Run Command**
- **Task Manager**
- **Registry Editor**
- **Notification Suppress** (part of Windows Defender)
- **Smart Screen** (part of Windows Defender, will be deleted instead of disabled)
- **Open File - Security Warning Prompt**
- **Windows Defender Core Protections** including:
  - Real-time Protection
  - Controlled Folder Access
  - Potentially Unwanted Application
  - Scheduled Scan
  - Windows Advanced Firewall
  - Cloud-Delivered Protection
  - Automatic Sample Submission

## Script Capabilities:

- Set default actions for threat detections (low/moderate/high/severe) to "Allow" permanently.
- Add exclusions for all file extensions in Windows Defender.
- Attempt to disable WinDefend using `sc` (with low or no chance of success).

## Usage Instructions:

1. Download the scripts from this repository or clone it using `git clone`.
2. Run the scripts to install the RAT on the victim's PC.

> **Tip:** If you encounter issues with the RAT (e.g., missing Python modules) and need to delete it, use File Explorer to locate and delete the RAT. Note that Task Manager and Run Command will be disabled after running the script, so test the RAT in a VM first.

Additionally, the repository includes a `.vbs` (Visual Basic Script) file that monitors and terminates system processes in the background, preventing the reversal of commands used by the `.bat` script. To have the script run at startup, move the `.vbs` file to `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup` or use the Run command and type `shell:startup`.

To edit which processes are monitored and killed, open the `.vbs` file in Notepad or any IDE, such as VS Code. It is recommended to keep the default values shown in the screenshot below (e.g., `mmc.exe` for Local Group Policy Editor).

![Screenshot](https://github.com/user-attachments/assets/492dd4f5-b186-41d8-b1c9-2cd5d72ca42c)

**Note:** These files are intended for educational purposes only. Use them responsibly and do not use them for malicious activities.
