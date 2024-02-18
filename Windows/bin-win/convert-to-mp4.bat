@Echo Off

Echo Convert To MP4
Echo.
Echo.

If "%~1" == "" (
  Echo ファイルが指定されていないよ・中止
  Pause > Nul
  Exit
)

Rem 実行確認
Echo 対象ファイル … "%~1"
Echo.
Echo 実行しますか？
Pause > Nul

Rem 実行開始
Echo.
ffmpeg -hwaccel cuda -i "%~1" -c:v h264_nvenc "_%~n1.mp4"
Echo.
Echo 書き出し成功・終了
Pause > Nul
