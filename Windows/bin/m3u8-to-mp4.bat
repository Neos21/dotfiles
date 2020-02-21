@echo off

rem ================================================================================
rem .m3u8 ファイルを元に .mp4 ファイルに結合して書き出すバッチ
rem 
rem このバッチファイルに .m3u8 ファイルをドラッグ・アンド・ドロップすると
rem このバッチファイルがあるフォルダに .mp4 ファイルを書き出す
rem 
rem 要 ffmpeg。「choco install ffmpeg」などでインストールしておくこと
rem 
rem Author : Neo (@Neos21) : https://neos21.hatenablog.com/entry/2017/09/09/080000
rem ================================================================================

echo .m3u8 ファイルを元に .mp4 ファイルに結合して書き出すバッチ
echo.
echo.

@rem このバッチファイルがある場所をカレントフォルダにする
pushd "%~dp0"

if "%~1" == "" (
  echo ファイルが指定されていないよ・中止
  pause > nul
  exit
)

if not "%~x1" == ".m3u8" (
  echo 拡張子が m3u8 じゃないよ不正だよ・中止
  pause > nul
  exit
)

@rem 実行確認
echo ・対象ファイル … "%~1"
echo ・保存フォルダ … "%~dp0"
echo.
echo 実行しますか？
pause > nul

@rem 実行開始
echo.
ffmpeg -protocol_whitelist file,http,https,tcp,tls -i "%~1" -movflags faststart -c copy "%~n1.mp4"
echo.
echo 書き出し成功・終了
pause > nul
