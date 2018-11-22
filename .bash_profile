# ================================================================================
# .bash_profile
# ================================================================================


# Detect OS And Settings
#   https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
# ================================================================================

if [ "$(uname)" == "Darwin" ]; then
  echo [MacOS] .bash_profile
  # ==============================================================================
  
  
  # Nodebrew
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
  
  # VSCode
  export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
  
  # PostgreSQL
  export PATH="/Library/PostgreSQL/11/bin:$PATH"
  
  # RBEnv
  eval "$(rbenv init - 2> /dev/null)"
  
  
  # ------------------------------------------------------------------------------
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo [Windows] .bash_profile
  #   Detect 32 Bit or 64 Bit
  #     "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT"
  #     "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT"
  # ==============================================================================
  
  
  # Nodist
  NODIST_BIN_DIR__=$(echo "$NODIST_PREFIX" | sed -e 's,\\,/,g')/bin;
  test -r "$NODIST_BIN_DIR__/nodist.sh" && . "$NODIST_BIN_DIR__/nodist.sh"
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


# Git Prompt Completion
# ================================================================================

test -r ~/git-completion.bash && . ~/git-completion.bash
test -r ~/git-prompt.sh && . ~/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1='\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '


# My Commands
# ================================================================================

export PATH="~/bin:$PATH"


# Source .bashrc
# ================================================================================

test -r ~/.bashrc && . ~/.bashrc


# --------------------------------------------------------------------------------
