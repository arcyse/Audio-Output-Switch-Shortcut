Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run "powershell.exe -ExecutionPolicy Bypass -File ""C:\path\to\your\script.ps1""", 0, False
