A simple .bat file (Batch File Script) used to run RATs (Remote Access Trojans) smoothly on the victim's PC.  
It works by disabling Windows components, making it difficult for the user to delete the RAT from the victim's PC.

The following Windows components are disabled:

• Consent Prompt Behavior Admin (part of UAC)  
• Run Command  
• Task Manager  
• Registry Editor  
• Notification Suppress (part of Windows Defender)  
• Windows Defender Real-Time Protection  
• Smart Screen (part of Windows Defender, will be deleted instead of disabled)  

How to use this script?  
Download the scripts in this repo or git clone, then run the scripts, and install the RAT on the victim's PC, and voila!  
Tip: If the RAT has problems (e.g., missing a module in Python) and you want to delete it, you can use File Explorer to find and delete the RAT.  
Remember, you won't be able to use Task Manager or Run after running the script, so test the RAT first in a VM to make sure it works.  

It also includes a .vbs file (Visual Basic Script) to monitor and kill system processes in the background, preventing the reversion of the commands used by the .bat script.  
If you want to run the script at start-up, move the vbs file into %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup or via Run command and type "shell::startup".  

To edit which processes will be monitored and killed, you can edit the .vbs file in Notepad or any IDE, such as VS Code.  
It is not advisable to remove the default values shown in the picture below. (mmc.exe is for Local Group Policy Editor)  

![Screenshot 2024-07-31 202525](https://github.com/user-attachments/assets/492dd4f5-b186-41d8-b1c9-2cd5d72ca42c)

These files are for educational purposes only. Do not use them for other purposes!
