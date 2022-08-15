@Echo Off

Rem ================================================================================
Rem .m3u8 ファイルを元に .mp4 ファイルに結合して書き出すバッチ
Rem 
Rem このバッチファイルに .m3u8 ファイルをドラッグ・アンド・ドロップすると
Rem このバッチファイルがあるフォルダに .mp4 ファイルを書き出す
Rem 
Rem - 要 ffmpeg。「choco install ffmpeg」などでインストールしておくこと
Rem - https://neos21.net/blog/2017/09/09-01.html
Rem ================================================================================

Echo .m3u8 ファイルを元に .mp4 ファイルに結合して書き出すバッチ
Echo.
Echo.

Rem このバッチファイルがある場所をカレントフォルダにする
Pushd "%~dp0"

If "%~1" == "" (
  Echo ファイルが指定されていないよ・中止
  Pause > Nul
  Exit
)

If Not "%~x1" == ".m3u8" (
  Echo 拡張子が m3u8 じゃないよ不正だよ・中止
  Pause > Nul
  Exit
)

Rem 実行確認
Echo ・対象ファイル … "%~1"
Echo ・保存フォルダ … "%~dp0"
Echo.
Echo 実行しますか？
Pause > Nul

Rem 実行開始
Echo.
ffmpeg -protocol_whitelist file,http,https,tcp,tls -allowed_extensions ALL -i "%~1" -movflags faststart -c copy "%~n1.mp4"
Echo.
Echo 書き出し成功・終了
Pause > Nul
