@echo off

rem ================================================================================
rem .m3u8 �t�@�C�������� .mp4 �t�@�C���Ɍ������ď����o���o�b�`
rem 
rem ���̃o�b�`�t�@�C���� .m3u8 �t�@�C�����h���b�O�E�A���h�E�h���b�v�����
rem ���̃o�b�`�t�@�C��������t�H���_�� .mp4 �t�@�C���������o��
rem 
rem �v ffmpeg�B�uchoco install ffmpeg�v�ȂǂŃC���X�g�[�����Ă�������
rem 
rem Author : Neo (@Neos21) : http://neos21.hatenablog.com/entry/2017/09/09/080000
rem ================================================================================

echo .m3u8 �t�@�C�������� .mp4 �t�@�C���Ɍ������ď����o���o�b�`
echo.
echo.

@rem ���̃o�b�`�t�@�C��������ꏊ���J�����g�t�H���_�ɂ���
pushd "%~dp0"

if "%~1" == "" (
  echo �t�@�C�����w�肳��Ă��Ȃ���E���~
  pause > nul
  exit
)

if not "%~x1" == ".m3u8" (
  echo �g���q�� m3u8 ����Ȃ���s������E���~
  pause > nul
  exit
)

@rem ���s�m�F
echo �E�Ώۃt�@�C�� �c "%~1"
echo �E�ۑ��t�H���_ �c "%~dp0"
echo.
echo ���s���܂����H
pause > nul

@rem ���s�J�n
echo.
ffmpeg -protocol_whitelist file,http,https,tcp,tls -allowed_extensions ALL -i "%~1" -movflags faststart -c copy "%~n1.mp4"
echo.
echo �����o�������E�I��
pause > nul
