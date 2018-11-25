# ================================================================================
# .bash_profile
# ================================================================================


# Detect OS And Settings
#   https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
# ================================================================================

if [ "$(uname)" == "Darwin" ]; then
  echo '[MacOS] .bash_profile'
  # ==============================================================================
  
  # Git Prompt
  test -r ~/.git-prompt.sh && . ~/.git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  export PS1='\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
  
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
  echo '[Windows] .bash_profile'
  #   Detect 32 Bit or 64 Bit
  #     "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT"
  #     "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT"
  # ==============================================================================
  
  # Git Prompt
  # test -r ~/.git-prompt.sh && . ~/.git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  # Neo's __git_ps1 (標準の __git_ps1 が Windows 環境で遅いので簡易版を自作してみた)
  function __git_ps1() {
    # ブランチ名 : symbolic-ref はブランチ名しか出せないが、タグなどにも対応している describe よりは若干高速
    local branch_name="$(git symbolic-ref --short HEAD 2> /dev/null)"  # "$(git describe --all 2> /dev/null | sed 's/heads\///' 2> /dev/null)"
    
    # ブランチ名がなければ Git リポジトリ配下ではないと見なす・何も出力せず中断する
    if [ -z "$branch_name" ]; then
      exit 0
    fi
    
    # どうしてもパフォーマンスが出ないのでブランチ名だけ出すことにする
    echo " [$branch_name]"
    exit 0
  }
  export PS1='\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
  
  # Nodist
  NODIST_BIN_DIR__=$(echo "$NODIST_PREFIX" | sed -e 's,\\,/,g')/bin;
  test -r "$NODIST_BIN_DIR__/nodist.sh" && . "$NODIST_BIN_DIR__/nodist.sh"
  unset NODIST_BIN_DIR__;
  
  
  # ------------------------------------------------------------------------------
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo '[Linux] .bash_profile'
  # ==============================================================================
  
  
  # ------------------------------------------------------------------------------
else
  echo '[Unknown OS] .bash_profile'
  # ==============================================================================
  
  
  # ------------------------------------------------------------------------------
fi


# History Control : HISTCONTROL
#   - 重複履歴を無視               … ignoredups
#   - 空白から始めたコマンドを無視 … ignorespace
#   - 両方指定                     … ignoreboth
# ================================================================================

export HISTCONTROL=ignoreboth


# Git Completion
# ================================================================================

test -r ~/.git-completion.bash && . ~/.git-completion.bash

# My Aliases
if type __git_complete 1>/dev/null 2>/dev/null; then
  # Git
  __git_complete g __git_main
  # Add
  __git_complete ga _git_add
  # Branch
  __git_complete gb _git_branch
  __git_complete gba _git_branch
  __git_complete gbd _git_branch
  # Checkout
  __git_complete gco _git_checkout
  __git_complete gcob _git_checkout
  # Commit
  __git_complete gc _git_commit
  __git_complete gce _git_commit
  __git_complete gcem _git_commit
  __git_complete gcm _git_commit
  # Diff
  __git_complete gdf _git_diff
  __git_complete gdfc _git_diff
  __git_complete gdfn _git_diff
  __git_complete gdfnc _git_diff
  __git_complete gdfw _git_diff
  __git_complete gdfwc _git_diff
  __git_complete gdfwo _git_diff
  __git_complete gdfwoc _git_diff
  # Fetch
  __git_complete gfe _git_fetch
  # Log
  __git_complete gl _git_log
  __git_complete glf _git_log
  __git_complete glo _git_log
  __git_complete glr _git_log
  # Merge
  __git_complete gm _git_merge
  # Pull
  __git_complete gpl _git_pull
  # Push
  __git_complete gps _git_push
  # Reset
  __git_complete gre _git_reset
  __git_complete greh _git_reset
  # Status
  __git_complete gst _git_statusstatus
  __git_complete gs _git_statusstatus
fi


# My Commands
# ================================================================================

export PATH="~/bin:$PATH"


# Source .bashrc
# ================================================================================

test -r ~/.bashrc && . ~/.bashrc


# --------------------------------------------------------------------------------
