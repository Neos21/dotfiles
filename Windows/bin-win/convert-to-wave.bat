@Echo Off

Echo Convert To Wave
Echo.
Echo.

If "%~1" == "" (
  Echo �t�@�C�����w�肳��Ă��Ȃ���E���~
  Pause > Nul
  Exit
)

Rem ���s�m�F
Echo �Ώۃt�@�C�� �c "%~1"
Echo.
Echo ���s���܂����H
Pause > Nul

Rem ���s�J�n
Echo.
ffmpeg -i "%~1" -ar 44100 "_%~n1.wav"
Echo.
Echo �����o�������E�I��
Pause > Nul
