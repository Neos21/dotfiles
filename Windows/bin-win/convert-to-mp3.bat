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
ffmpeg -i "%~1" -vn -ac 2 -ar 44100 -ab 192k -acodec libmp3lame -f mp3 "_%~n1.mp3"
Echo.
Echo �����o�������E�I��
Pause > Nul
