Option Explicit

' �{�t�@�C���Ɠ����f�B���N�g���ɂ���u�����t�@�C����.ps1�v���A�E�B���h�E���J�����T�C�����g���s����
' �� : �uexample.ps1�v������f�B���N�g���ɁA�{�t�@�C�����uexample.vbs�v�ƃ��l�[�����Ĕz�u����
'      �uexample.vbs�v�����s����ƁAPowerShell �E�B���h�E���J�����ƂȂ��uexample.ps1�v�����s�����

Dim psFilePath : psFilePath = Replace(WScript.ScriptFullName, ".vbs", ".ps1")
WScript.CreateObject("WScript.Shell").Run "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -File " & Chr(34) & psFilePath & Chr(34), 0
