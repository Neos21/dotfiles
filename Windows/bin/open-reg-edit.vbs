Option Explicit

' ================================================================================
' �w�肵�����W�X�g���L�[�̈ʒu�� regedit ���J��
' ================================================================================

' �o�^�������L�[ : �󕶎��E���݂��Ȃ��L�[������̏ꍇ�̓��[�g���J���悤�ɂȂ�
Dim targetRegPath
targetRegPath = InputBox("�J���������W�X�g���L�[����͂��Ă�������")

' �Ō�ɊJ���Ă������W�X�g���L�[��ۑ����Ă��郌�W�X�g���L�[
Const lastKey = "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\LastKey"

Dim WSHShell  : Set WSHShell   = CreateObject("WScript.Shell")
Dim WMIService: Set WMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")

' OS �o�[�W�����ɍ��킹�ēo�^�������L�[�̃��[�g��t�^����
Dim regPath
If DetectOSVersion() >= 6 Then
  regPath = "�R���s���[�^�[\"    & targetRegPath
Else
  regPath = "�}�C �R���s���[�^\" & targetRegPath
End If

' ���� regedit �����s���̏ꍇ�͂�������I��������
Dim processList: Set processList = WMIService.ExecQuery("SELECT * FROM Win32_Process WHERE Name = 'regedit.exe'")
Dim process: For Each process In processList
  ' �Ō�̃E�C���h�E�̈ʒu�ƃT�C�Y��ۑ����ďI��������
  WSHShell.AppActivate("���W�X�g�� �G�f�B�^")
  WScript.Sleep(500)
  WSHShell.SendKeys("%{F4}")
  WScript.Sleep(500)
  ' ��̏I�����@�����s�������̂��߂ɋ����I������
  On Error Resume Next
  process.Terminate()
  On Error GoTo 0
Next

' ���W�X�g���G�f�B�^���Ō�ɊJ���Ă����L�[�Ƃ��ēo�^����
WSHShell.RegWrite lastKey, regPath, "REG_SZ"

' ���W�X�g���G�f�B�^���N������
Call WSHShell.Run("regedit.exe")

' OS �o�[�W�������擾����
Function DetectOSVersion()
  ' OS �����擾���A�o�[�W�����ԍ��𔲂��o��
  Dim osData: Set osData = WMIService.ExecQuery("SELECT Version FROM Win32_OperatingSystem")
  
  Dim rawVersion
  Dim os: For Each os in osData
    rawVersion = os.Version
  Next
  
  ' �o�[�W�����ԍ����s���I�h�ŕ�������
  Dim versionNumbers: versionNumbers = Split(rawVersion, ".")
  
  ' ������1�ʂ܂ł̒l���i�[����
  Dim osVersion
  Dim i: For i = 0 To UBound(versionNumbers)
    If i > 1 Then
      Exit For
    End If
    
    If i > 0 Then
      osVersion = osVersion & "."
    End If
    
    osVersion = osVersion & versionNumbers(i)
  Next
  
  ' �{���x���������_���^�ɕϊ����ĕԂ�
  DetectOSVersion = CDbl(osVersion)
End Function
