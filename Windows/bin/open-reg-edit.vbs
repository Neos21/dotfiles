Option Explicit

' ================================================================================
' 指定したレジストリキーの位置で regedit を開く
' ================================================================================

' 登録したいキー : 空文字・存在しないキー文字列の場合はルートが開くようになる
Dim targetRegPath : targetRegPath = InputBox("開きたいレジストリキーを入力してください")

' 最後に開いていたレジストリキーを保存しているレジストリキー
Const lastKey = "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\LastKey"

Dim WSHShell   : Set WSHShell   = CreateObject("WScript.Shell")
Dim WMIService : Set WMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")

' OS バージョンに合わせて登録したいキーのルートを付与する
Dim regPath
If DetectOSVersion() >= 6 Then
  regPath = "コンピューター\"    & targetRegPath
Else
  regPath = "マイ コンピュータ\" & targetRegPath
End If

' 既に regedit が実行中の場合はいったん終了させる
Dim processList : Set processList = WMIService.ExecQuery("SELECT * FROM Win32_Process WHERE Name = 'regedit.exe'")
Dim process : For Each process In processList
  ' 最後のウインドウの位置とサイズを保存して終了させる
  WSHShell.AppActivate("レジストリ エディタ")
  WScript.Sleep(500)
  WSHShell.SendKeys("%{F4}")
  WScript.Sleep(500)
  ' 上の終了方法が失敗した時のために強制終了する
  On Error Resume Next
  process.Terminate()
  On Error GoTo 0
Next

' レジストリエディタが最後に開いていたキーとして登録する
WSHShell.RegWrite lastKey, regPath, "REG_SZ"

' レジストリエディタを起動する
Call WSHShell.Run("regedit.exe")

' OS バージョンを取得する
Function DetectOSVersion()
  ' OS 情報を取得し、バージョン番号を抜き出す
  Dim osData : Set osData = WMIService.ExecQuery("SELECT Version FROM Win32_OperatingSystem")
  
  Dim rawVersion
  Dim os : For Each os in osData
    rawVersion = os.Version
  Next
  
  ' バージョン番号をピリオドで分割する
  Dim versionNumbers : versionNumbers = Split(rawVersion, ".")
  
  ' 小数第1位までの値を格納する
  Dim osVersion
  Dim i : For i = 0 To UBound(versionNumbers)
    If i > 1 Then
      Exit For
    End If
    
    If i > 0 Then
      osVersion = osVersion & "."
    End If
    
    osVersion = osVersion & versionNumbers(i)
  Next
  
  ' 倍精度浮動小数点数型に変換して返す
  DetectOSVersion = CDbl(osVersion)
End Function
