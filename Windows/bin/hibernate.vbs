Option Explicit

' ================================================================================
' �x�~��Ԃɂ���
' 
' `SetSuspendState` �̈����� `Hibernate` ��^���Ȃ���΃X�^���o�C�ɂȂ�悤��������������Ȃ�
' ================================================================================

CreateObject("WScript.Shell").Run "rundll32 powrprof.dll, SetSuspendState Hibernate"
