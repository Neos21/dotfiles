@Echo Off

Echo Convert To Wave
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
ffmpeg -i "%~1" -vn -ac 2 -ar 44100 -ab 192k -acodec libmp3lame -f mp3 "_%~n1.mp3"
Echo.
Echo 書き出し成功・終了
Pause > Nul
