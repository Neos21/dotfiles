Option Explicit

' 本ファイルと同じディレクトリにある「同じファイル名.ps1」を、ウィンドウを開かずサイレント実行する
' 例 : 「example.ps1」があるディレクトリに、本ファイルを「example.vbs」とリネームして配置する
'      「example.vbs」を実行すると、PowerShell ウィンドウを開くことなく「example.ps1」が実行される

Dim psFilePath : psFilePath = Replace(WScript.ScriptFullName, ".vbs", ".ps1")
WScript.CreateObject("WScript.Shell").Run "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -File " & Chr(34) & psFilePath & Chr(34), 0
