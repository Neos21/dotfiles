' 休止状態にする ： `SetSuspendState` の引数に `Hibernate` を与えなければスタンバイになるようだが差が分からん
CreateObject("WScript.Shell").Run "rundll32 powrprof.dll, SetSuspendState Hibernate"
