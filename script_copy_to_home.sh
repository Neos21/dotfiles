#!/bin/bash

read -p "Copy To Home : 実行してよろしいですか？ (y/N): " yn
case "$yn" in
  [yY]* ) ;;
  * ) echo "中断" ; exit ;;
esac

echo '開始'

# ファイル系
cp -f ./.bash_profile ~/.bash_profile
cp -f ./.bashrc ~/.bashrc
cp -f ./.git-completion.bash ~/.git-completion.bash
cp -f ./.gitconfig ~/.gitconfig
cp -f ./.git-prompt.sh ~/.git-prompt.sh
cp -f ./.tigrc ~/.tigrc
cp -f ./.vimrc ~/.vimrc

# ディレクトリ系
cp -rf ./.vim ~  # 「~/」とすると「~/.vim/colors/」とならず「~/colors/」と作成されてしまう
# .vscode/ は Settings Sync 拡張機能を使っているので移動しない

# OS 別処理
if [ "$(uname)" == "Darwin" ]; then
  echo 'MacOS' > /dev/null
  cp -f ./Mac/.inputrc ~/.inputrc
  cp -f ./Mac/.npmrc ~/.npmrc
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo 'Windows' > /dev/null
  cp -f ./Win/.minttyrc ~/.minttyrc
  cp -f ./Win/.npmrc ~/.npmrc
  cp -f ./Win/Macros.txt ~/Macros.txt
  # AHK・MacType はユーザホームに移動しない
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo 'Linux' > /dev/null
else
  echo 'Unknown OS' > /dev/null
fi

echo '正常終了'
