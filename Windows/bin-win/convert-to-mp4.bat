@Echo Off

Echo Convert To MP4
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
ffmpeg -hwaccel cuda -i "%~1" -c:v h264_nvenc "_%~n1.mp4"
Echo.
Echo �����o�������E�I��
Pause > Nul
