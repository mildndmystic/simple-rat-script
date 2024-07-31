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

Simply run this script first, then install the RAT on the victim's PC, and voila!  
Tip: If the RAT has problems (e.g., missing a module in Python) and you want to delete it, you can use File Explorer to find and delete the RAT.  
Remember, you won't be able to use Task Manager or Run after running the script, so test the RAT first in a VM to make sure it works.
