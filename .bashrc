# ================================================================================
# .bashrc
# ================================================================================


# Detect OS And Settings
# ================================================================================

if [ "$(uname)" == "Darwin" ]; then
  echo [Mac OS] .bashrc
  # ==============================================================================
  
  
  # Ls
  export CLICOLOR=1
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -G'
  
  # Open = Start
  alias start='open'
  
  # Sudo コマンドの補完を有効化
  complete -cf sudo
  
  # Tig
  alias tiga='tig --all'
  
  # Source .bashrc_recent_mac
  test -r ~/.bashrc_recent_mac && . ~/.bashrc_recent_mac
  alias ercr='vi ~/.bashrc_recent_mac'
  alias rcr='. ~/.bashrc_recent_mac'
  
  
  # ------------------------------------------------------------------------------
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
  echo [Windows] .bashrc
  # ==============================================================================
  
  
  # Ls
  # C:\Program Files\Git\etc\DIR_COLORS が色設定を持っている
  # 「DIR 01;34」を「DIR 01;36」にするとディレクトリが水色になる
  alias ls='ls -F --color=auto --show-control-chars'
  eval $(dircolors /etc/DIR_COLORS)
  
  # Start = Open
  alias open='start'
  
  # Notepad++
  alias np='"/c/Program Files/Notepad++/notepad++.exe"'
  
  # Source .bashrc_recent_win
  test -r ~/.bashrc_recent_win && . ~/.bashrc_recent_win
  alias ercr='vi ~/.bashrc_recent_win'
  alias rcr='. ~/.bashrc_recent_win'
  
  
  # ------------------------------------------------------------------------------
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo [Linux] .bashrc
  # ==============================================================================
  
  
  # ------------------------------------------------------------------------------
else
  echo [Unknown OS] .bashrc
  # ==============================================================================
  
  
  # ------------------------------------------------------------------------------
fi


# --------------------------------------------------------------------------------
# Alias
# --------------------------------------------------------------------------------


# Alias : General
# ================================================================================

alias quit='exit'
alias cls='reset'

# Ls
alias ll='ls -l'

# Cd
alias ..='cdd ..'
alias ...='cdd ../..'
alias -- -='cd - && ls'
alias -- --='cd - && ls'

# Grep
alias grep='grep --color'

# Df
alias df='df -h'

# Ps
alias ps='ps --sort=start_time'

# Edit .bashrc
alias erc='vi ~/.bashrc'
alias rc='. ~/.bashrc'


# Alias : Git
# ================================================================================

alias g='git'

alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -D'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gc='git commit'
alias gce='git commit --allow-empty'
alias gcem='git commit --allow-empty -m'
alias gcm='git commit -m'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gdfn='git diff --name-only'
alias gfe='git fetch'
alias gl=' git log -10 --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d"'
alias glf='git log --pretty=fuller'
alias glog='git log'
alias glr='git log -10 --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --graph'
alias gm='git merge'
alias gpl='git pull'
alias gps='git push'
alias gst='git status'
alias gs='git status -s -b'

# Show Git Alias
alias galias='git config --global -l | grep alias'


# Alias : Node
# ================================================================================

alias npmls='npm list --depth=0'
alias npmlsg='npmls -g'


# --------------------------------------------------------------------------------
# Function
# --------------------------------------------------------------------------------


# Function : mkdir したディレクトリに cd する
#   http://qiita.com/0x60df/items/303666033788b937c578
# ================================================================================

mkcd () {
  exec 3>&1
  cd "`
  if mkdir "$@" 1>&3; then
    while [ $# -gt 0 ]
    do
      case "$1" in
        -- ) printf '%s' "$2"; exit 0;;
        -* ) shift;;
        * ) printf '%s' "$1"; exit 0;;
      esac
    done
    printf '.'
    exit 0
  else
    printf '.'
    exit 1
  fi
  `"
  exec 3>&-
}


# Function : cd したあと ls する
#   http://thehacker.jp/alias-settings/
# ================================================================================

cdd() {
  \cd "$@" && pwd && ls
}


# --------------------------------------------------------------------------------
