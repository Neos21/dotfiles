@Echo Off

Echo WAV To MP3
Echo.
Echo.

If "%~1" == "" (
  Echo �t�@�C�����w�肳��Ă��Ȃ���E���~
  Pause > Nul
  Exit
)

If Not "%~x1" == ".wav" (
  Echo �g���q�� wav ����Ȃ���s������E���~
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
ffmpeg -i "%~1" -vn -ac 2 -ar 44100 -ab 192k -acodec libmp3lame -f mp3 "%~n1.mp3"
Echo.
Echo �����o�������E�I��
Pause > Nul
