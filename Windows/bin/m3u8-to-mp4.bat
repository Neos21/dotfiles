@Echo Off

Rem ================================================================================
Rem .m3u8 �t�@�C�������� .mp4 �t�@�C���Ɍ������ď����o���o�b�`
Rem 
Rem ���̃o�b�`�t�@�C���� .m3u8 �t�@�C�����h���b�O�E�A���h�E�h���b�v�����
Rem ���̃o�b�`�t�@�C��������t�H���_�� .mp4 �t�@�C���������o��
Rem 
Rem - �v ffmpeg�B�uchoco install ffmpeg�v�ȂǂŃC���X�g�[�����Ă�������
Rem - https://neos21.net/blog/2017/09/09-01.html
Rem ================================================================================

Echo .m3u8 �t�@�C�������� .mp4 �t�@�C���Ɍ������ď����o���o�b�`
Echo.
Echo.

Rem ���̃o�b�`�t�@�C��������ꏊ���J�����g�t�H���_�ɂ���
Pushd "%~dp0"

If "%~1" == "" (
  Echo �t�@�C�����w�肳��Ă��Ȃ���E���~
  Pause > Nul
  Exit
)

If Not "%~x1" == ".m3u8" (
  Echo �g���q�� m3u8 ����Ȃ���s������E���~
  Pause > Nul
  Exit
)

Rem ���s�m�F
Echo �E�Ώۃt�@�C�� �c "%~1"
Echo �E�ۑ��t�H���_ �c "%~dp0"
Echo.
Echo ���s���܂����H
Pause > Nul

Rem ���s�J�n
Echo.
ffmpeg -protocol_whitelist file,http,https,tcp,tls -allowed_extensions ALL -i "%~1" -movflags faststart -c copy "%~n1.mp4"
Echo.
Echo �����o�������E�I��
Pause > Nul
