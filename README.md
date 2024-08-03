<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>README</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }
        h1, h2 {
            color: #333;
        }
        ul {
            list-style-type: disc;
            margin: 0;
            padding: 0;
            padding-left: 20px;
        }
        li {
            margin-bottom: 10px;
        }
        .tip {
            background-color: #f0f8ff;
            border-left: 3px solid #4a90e2;
            padding: 10px;
            margin: 20px 0;
        }
        .warning {
            background-color: #ffefef;
            border-left: 3px solid #e94e77;
            padding: 10px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <h1>README</h1>
    <p>A simple .bat file (Batch File Script) used to run RATs (Remote Access Trojans) smoothly on the victim's PC.</p>
    <p>It works by disabling Windows components, making it difficult for the user to delete the RAT from the victim's PC.</p>

    <h2>The following Windows components are disabled:</h2>
    <ul>
        <li>Consent Prompt Behavior Admin (part of UAC)</li>
        <li>Run Command</li>
        <li>Task Manager</li>
        <li>Registry Editor</li>
        <li>Notification Suppress (part of Windows Defender)</li>
        <li>Windows Defender Real-Time Protection</li>
        <li>Smart Screen (part of Windows Defender, will be deleted instead of disabled)</li>
    </ul>

    <h2>How to use this script?</h2>
    <p>Download the scripts in this repo or git clone, then run the scripts, and install the RAT on the victim's PC, and voila!</p>
    <div class="tip">
        Tip: If the RAT has problems (e.g., missing a module in Python) and you want to delete it, you can use File Explorer to find and delete the RAT.
        Remember, you won't be able to use Task Manager or Run after running the script, so test the RAT first in a VM to make sure it works.
    </div>

    <p>It also includes a .vbs file (Visual Basic Script) to monitor and kill system processes in the background, preventing the reversion of the commands used by the .bat script.</p>
    <p>If you want to run the script at start-up, move the vbs file into <code>%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup</code> or via Run command and type <code>shell::startup</code>.</p>

    <p>To edit which processes will be monitored and killed, you can edit the .vbs file in Notepad or any IDE, such as VS Code.</p>
    <div class="warning">
        It is not advisable to remove the default values shown in the picture below. (mmc.exe is for Local Group Policy Editor)
    </div>

    ![Screenshot 2024-07-31 202525](https://github.com/user-attachments/assets/492dd4f5-b186-41d8-b1c9-2cd5d72ca42c)

    <p>These files are for educational purposes only. Do not use them for other purposes!</p>
</body>
</html>
