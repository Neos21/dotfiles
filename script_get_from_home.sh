#!/bin/bash

read -p "Get From Home : 実行してよろしいですか？ (y/N): " yn
case "$yn" in
  [yY]* ) ;;
  * ) echo "中断" ; exit ;;
esac

echo '開始'

# ファイル系
cp -f ~/.bash_profile ./.bash_profile
cp -f ~/.bashrc ./.bashrc
cp -f ~/.gitconfig ./.gitconfig
cp -f ~/.tigrc ./.tigrc
cp -f ~/.vimrc ./.vimrc
cp -f ~/git-completion.bash ./git-completion.bash

# ディレクトリ系
cp -rf ~/.vim .
cp -rf ~/.vscode .  # .vscode/ は Settings Sync 拡張機能を使っているがバックアップのため持ってくる

# OS 別処理
if [ "$(uname)" == "Darwin" ]; then
  echo 'MacOS' > /dev/null
  cp -f ~/.inputrc ./Mac/.inputrc
  cp -f ~/.npmrc ./Mac/.npmrc
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo 'Windows' > /dev/null
  cp -f ~/.minttyrc ./Win/.minttyrc
  cp -f ~/.npmrc ./Win/.npmrc
  cp -f ~/Macros.txt ./Win/Macros.txt
  # AHK・MacType はユーザホームにない
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo 'Linux' > /dev/null
else
  echo 'Unknown OS' > /dev/null
fi

echo '正常終了'
