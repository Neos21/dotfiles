# ================================================================================
# .bashrc
# ================================================================================


# Detect OS And Settings
# ================================================================================

if [ "$(uname)" == 'Darwin' ]; then
  #echo '[MacOS] .bashrc'
  # ==============================================================================
  
  # For Catalina
  export BASH_SILENCE_DEPRECATION_WARNING='1'
  
  # RBEnv
  eval "$(rbenv init - 2> /dev/null)"
  # VSCode
  PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:${PATH}"
  # Python3
  PATH="/usr/local/opt/python/libexec/bin:${PATH}"
  
  # Java
  export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
  export _JAVA_OPTIONS='-Dfile.encoding=UTF-8'
  PATH="${JAVA_HOME}/bin:${PATH}"
  
  # Homebrew PATH
  PATH="/usr/local/bin:${PATH}"
  
  # Git Prompt
  test -r "${HOME}/.git-prompt.sh" && source "${HOME}/.git-prompt.sh"
  export PS1='\n\[\033[32m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]$(__git_ps1)\[\033[0m\]\n$ '
  
  # ls
  export CLICOLOR='1'
  export LSCOLORS='gxfxcxdxbxegedabagacad'
  alias ls='ls -G'
  
  # open = start
  alias start='open'
  
  # sed
  if type gsed > /dev/null 2>&1; then
    alias sed='gsed'
  fi
  
  # tree
  alias tree='tree -N'
  
  # Sudo コマンドの補完を有効にする
  complete -cf sudo
  
  # Finder のアクティブウィンドウのディレクトリに移動する
  function cdf() {
    local target="$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')"
    if [ "$target" != '' ]; then
      cd "$target" && pwd && ls
    else
      echo 'No Finder window found' >&2
    fi
  }
  
  # Customize --------------------------------------------------------------------
  
  # cd Aliases
  alias cdb='cd "${HOME}/Documents/Dev/BitBucket/" && pwd && ls'
  alias cdev='cd "${HOME}/Documents/Dev/" && pwd && ls'
  alias cdgh='cd "${HOME}/Documents/Dev/GitHub/" && pwd && ls'
  alias cd21='cd "${HOME}/Documents/Dev/GitHub/21" && pwd && ls'
  alias cds='cd "${HOME}/Documents/Dev/Sandboxes/" && pwd && ls'
  
  # CotEditor
  alias cot='open -a CotEditor'
  # CotEditor で開いているファイルを VSCode で開く
  alias cotvs='open -a '\''Visual Studio Code'\'' "$(osascript -e '\''tell application "CotEditor" to get path of document 1'\'')"'
  
  # ------------------------------------------------------------------------------
elif [ "$(uname)" == 'Linux' ]; then
  #echo '[Linux] .bashrc'
  # ==============================================================================
  
  # For WSL ----------------------------------------------------------------------
  
  if [[ "$(uname -r)" == *microsoft* ]]; then
    # Git Prompt
    if [ "$(whoami)" == 'root' ] ; then
      export PS1='\n\[\033[31m\][WSL] \u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]$(__git_ps1)\[\033[0m\]\n$ '
    else
      export PS1='\n\[\033[31m\][WSL] \[\033[32m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]$(__git_ps1)\[\033[0m\]\n$ '
    fi
    
    # wsl-open
    if type wsl-open > /dev/null 2>&1; then
      alias start='wsl-open'
      alias open='wsl-open'
    fi
  fi
  
  # ------------------------------------------------------------------------------
else
  #echo '[Windows] .bashrc'
  # ==============================================================================
  
  # Git Prompt : 標準の __git_ps1 が Windows 環境で遅いので簡易版を自作した
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
  #test -r "${HOME}/.git-prompt.sh" && . "${HOME}/.git-prompt.sh"
  export PS1='\n\[\033[31m\][Windows] \[\033[32m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
  
  # ls
  alias ls='ls -F --color=auto --show-control-chars --time-style=long-iso'
  # C:\Program Files\Git\etc\ や C:\git-sdk-64\etc\ 配下の DIR_COLORS が色設定を持っている
  # 「DIR 01;34」を「DIR 01;36」にするとディレクトリが水色になる
  eval "$(dircolors /etc/DIR_COLORS 2> /dev/null)"
  
  # start = open
  alias open='start'
  
  # Clipboard
  if ! type pbcopy.exe > /dev/null 2>&1; then
    alias pbcopy='cat > /dev/clipboard'
  fi
  if ! type pbpaste.exe > /dev/null 2>&1; then
    alias pbpaste='cat /dev/clipboard'
  fi
  
  # Open App
  alias npp='cmd //c start notepad++.exe'
  
  # ------------------------------------------------------------------------------
fi


# My Commands : Export PATH
# ================================================================================

export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# カレントディレクトリ配下の .DS_Store を全て消す
alias delds='find . -name '\''.DS_Store'\'' -delete'

# grep : 検索文字列を色付けする
alias grep='grep --color'
alias grepinr='grep -inR'


# Terraform
# ================================================================================

alias t='terraform'
alias ta='terraform apply'
alias td='terraform destroy'
alias ti='terraform init'
alias tp='terraform plan'
alias tpd='terraform plan -destroy'


# --------------------------------------------------------------------------------
