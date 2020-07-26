#!/bin/bash

# 各種ファイルをコピーする

function copy_file() {
  local file_name="$1"
  read -p "Do you want to copy [${file_name}] ? (y/n) : " yn
  if [ "${yn}" = 'y' ]; then
    cp "./${file_name}" "${HOME}/"
    echo '  Copied'
  else
    echo '  Not Copied'
  fi
}

echo "User Name : [$(whoami)]"
echo "User Home : [${HOME}]"

copy_file '.bash_profile'
copy_file '.bashrc'
copy_file '.gitconfig'
copy_file '.inputrc'
copy_file '.npmrc'
copy_file '.tigrc'
copy_file '.tmux.conf'
copy_file '.vimrc'

# Vim Colour
read -p "Do you want to copy [.vim/colors/monokai.vim] ? (y/n) : " yn
if [ "${yn}" = 'y' ]; then
  mkdir -p "${HOME}/.vim/colors/"
  cp './.vim/colors/monokai.vim' "${HOME}/.vim/colors/monokai.vim"
  echo '  Copied'
else
  echo '  Not Copied'
fi

echo 'Finished'
