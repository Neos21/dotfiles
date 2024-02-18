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
ffmpeg -i "%~1" -ar 44100 "_%~n1.wav"
Echo.
Echo 書き出し成功・終了
Pause > Nul
