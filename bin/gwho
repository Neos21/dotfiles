#!/bin/bash

# Git のコミッタを確認する
# 
# - カレントディレクトリのローカル設定があればそのコミッタ情報を表示する
# - そうでなければグローバル設定のコミッタ情報を表示する

local_config_list="$(git config --local --list 2>/dev/null)"
local_user_name="$(echo "${local_config_list}" | grep -e 'user.name')"
local_user_email="$(echo "${local_config_list}" | grep -e 'user.email')"
if [ -n "${local_user_name}" -a -n "${local_user_email}" ]; then
  echo "Git User : [Local] ... $(echo "${local_user_name}" | cut -d '=' -f 2) - $(echo "${local_user_email}" | cut -d '=' -f 2)"
  exit 0
fi

global_config_list="$(git config --global --list 2>/dev/null)"
global_user_name="$(echo "${global_config_list}" | grep -e 'user.name')"
global_user_email="$(echo "${global_config_list}" | grep -e 'user.email')"
if [ -n "${global_user_name}" -a -n "${global_user_email}" ]; then
  echo "Git User : [Global] ... $(echo "${global_user_name}" | cut -d '=' -f 2) - $(echo "${global_user_email}" | cut -d '=' -f 2)"
  exit 0
fi

echo 'Git User : Unknown'
