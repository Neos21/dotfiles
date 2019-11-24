#!/bin/bash

# ファイルの差分をチェックする

function check_diff() {
  local file_name="$1"
  git diff --name-only "./${file_name}" "${HOME}/${file_name}"
  if [ "$?" -ne 0 ]; then
    echo "  git diff ./${file_name} ~/${file_name}"
  fi
}

check_diff '.bash_profile'
check_diff '.bashrc'
check_diff '.gitconfig'
check_diff '.tigrc'
check_diff '.tmux.conf'
check_diff '.vimrc'
check_diff '.vim/colors/monokai.vim'
