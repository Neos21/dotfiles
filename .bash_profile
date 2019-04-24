# ================================================================================
# .bash_profile
# ================================================================================


# Detect OS And Settings
# ================================================================================

if [ "$(uname)" == 'Darwin' ]; then
  # echo '[MacOS] .bash_profile'
  # ==============================================================================
  
  # Git Prompt
  test -r ~/.git-prompt.sh && . ~/.git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  export PS1='\n\[\033[32m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
  
  # Nodebrew
  PATH="${HOME}/.nodebrew/current/bin:${PATH}"
  
  # VSCode
  PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"
  
  # PostgreSQL
  PATH="/Library/PostgreSQL/11/bin:${PATH}"
  
  # RBEnv
  eval "$(rbenv init - 2> /dev/null)"
  
  # Python3
  PATH="/usr/local/opt/python/libexec/bin:${PATH}"
  
  # OCI CLI Tab Completion
  test -r "${HOME}/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh" && . "${HOME}/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh"
  
  # Rust
  PATH="${HOME}/.cargo/bin:${PATH}"
  
  # Customize --------------------------------------------------------------------
  
  
  # ------------------------------------------------------------------------------
else
  # echo '[Windows] .bash_profile'
  # ==============================================================================
  
  # Git Prompt
  # test -r "${HOME}/.git-prompt.sh" && . "${HOME}/.git-prompt.sh"
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  # Git Prompt : Neo's __git_ps1 (標準の __git_ps1 が Windows 環境で遅いので簡易版を自作した)
  function __git_ps1() {
    # ブランチ名 : symbolic-ref はブランチ名しか出せないが、タグなどにも対応している describe よりは若干高速
    local branch_name="$(git symbolic-ref --short HEAD 2> /dev/null)"  # "$(git describe --all 2> /dev/null | sed 's/heads\///' 2> /dev/null)"
    # ブランチ名がなければ Git リポジトリ配下ではないと見なす・何も出力せず中断する
    if [ -z "$branch_name" ]; then
      exit 0
    fi
    # どうしてもパフォーマンスが出ないのでブランチ名だけ出すことにする
    echo " [$branch_name]"
  }
  export PS1='\n\[\033[32m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
  
  # Node.js
  alias node='winpty node.exe'
  
  # Docker For Windows
  alias docker='winpty docker'
  
  # Customize --------------------------------------------------------------------
  
  
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

# test -r "${HOME}/.git-completion.bash" &&
. "${HOME}/.git-completion.bash"

# My Aliases
# if type __git_complete 1>/dev/null 2>/dev/null; then
  # Branch
  __git_complete gbd _git_branch
  # Checkout
  __git_complete gco _git_checkout
  # Diff
  __git_complete gdf _git_diff
  __git_complete gdfc _git_diff
  __git_complete gdfn _git_diff
  __git_complete gdfnc _git_diff
  __git_complete gdfw _git_diff
  __git_complete gdfwc _git_diff
  __git_complete gdfwo _git_diff
  __git_complete gdfwoc _git_diff
  # Merge
  __git_complete gm _git_merge
# fi


# My Commands : Export PATH
# ================================================================================

export PATH="${HOME}/bin:${PATH}"


# Source .bashrc
# ================================================================================

# test -r "${HOME}/.bashrc" &&
. "${HOME}/.bashrc"


# --------------------------------------------------------------------------------
