Option Explicit

' ================================================================================
' 休止状態にする
' 
' `SetSuspendState` の引数に `Hibernate` を与えなければスタンバイになるようだが差が分からない
' ================================================================================

CreateObject("WScript.Shell").Run "rundll32 powrprof.dll, SetSuspendState Hibernate"
