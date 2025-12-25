#!/usr/bin/env bash

echo "---------- $(date --iso-8601=seconds) ----- Start"

function encode_video() {
  local output="_$1.mp3"
  ffmpeg -hide_banner -loglevel error -stats -i "$1" "$output"
}

# ls -1 の結果を改行ごとに処理するため IFS を変更しておく
ORIGINAL_IFS=$IFS
IFS=$'\n'

# ls -1 で上手く表示できているか見ておく。ファイル名が長すぎるとダメ
# for 部分の `$(ls -1)` はダブルクォートで囲んではダメ。バッククォートは同じ
for input in $(ls -1 | grep '\.mp4'); do
  echo "---------- $(date --iso-8601=seconds) ----- ${input} Start"
  encode_video "${input}"
  echo "========== $(date --iso-8601=seconds) ===== ${input} Finished"
done

IFS=$ORIGINAL_IFS
echo "========== $(date --iso-8601=seconds) ===== Finished"
