Option Explicit

' タスクスケジューラで本ファイルを起動スクリプトにし、WSL を起動しっぱなしの状態に保つ。VBScript を経由することで余計なウィンドウが表示されないようにしている (PowerShell だと Windows Terminal タブとして残ってしまったため)
CreateObject("WScript.Shell").Run "C:\Windows\System32\wsl.exe -d Ubuntu --exec sleep infinity", 0, False
