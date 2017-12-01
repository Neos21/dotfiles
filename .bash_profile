# ================================================================================
# .bash_profile
# ================================================================================


# Detect OS And Settings
#   https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
# ================================================================================

if [ "$(uname)" == "Darwin" ]; then
  echo [Mac OS] .bash_profile
  # ==============================================================================
  
  
  # プロンプト変更 : Git ブランチを表示させ Git コマンド補完を有効にする
  . /usr/local/etc/bash_completion.d/git-prompt.sh
  . /usr/local/etc/bash_completion.d/git-completion.bash
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
  
  # Nodebrew
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  
  # RBEnv
  eval "$(rbenv init -)"
  
  
  # ------------------------------------------------------------------------------
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo [Windows] .bash_profile
  #   Detect 32 Bit or 64 Bit
  #     "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT"
  #     "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT"
  # ==============================================================================
  
  
  # プロンプト変更 : Git ブランチを表示させる
  GIT_PS1_SHOWDIRTYSTATE=true
  
  # Nodist
  NODIST_BIN_DIR__=$(echo "$NODIST_PREFIX" | sed -e 's,\\,/,g')/bin;
  test -r "$NODIST_BIN_DIR__/nodist.sh" && . "$NODIST_BIN_DIR__/nodist.sh"
  # if [ -f "$NODIST_BIN_DIR__/nodist.sh" ]; then
  #   . "$NODIST_BIN_DIR__/nodist.sh";
  # fi;
  unset NODIST_BIN_DIR__;
  
  
  # ------------------------------------------------------------------------------
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo [Linux] .bash_profile
  # ==============================================================================
  
  
  # ------------------------------------------------------------------------------
else
  echo [Unknown OS] .bash_profile
  # ==============================================================================
  
  
  # ------------------------------------------------------------------------------
fi


# History Control : HISTCONTROL
#   - 重複履歴を無視               … ignoredups
#   - 空白から始めたコマンドを無視 … ignorespace
#   - 両方指定                     … ignoreboth
# ================================================================================

export HISTCONTROL=ignoreboth


# Git Alias Completion
# ================================================================================

test -r ~/git-completion.bash && . ~/git-completion.bash


# Source .bashrc
# ================================================================================

test -r ~/.bashrc && . ~/.bashrc


# --------------------------------------------------------------------------------
