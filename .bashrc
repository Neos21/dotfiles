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
  
  # Nodebrew
  alias nb='nodebrew'
  
  # Sudo コマンドの補完を有効化
  complete -cf sudo
  
  # Cd Aliases
  alias cdev='cdd ~/Documents/Dev/'
  alias cdgh='cdd ~/Documents/Dev/GitHub/'
  
  
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
  
  # Cd Aliases
  alias cdev='cdd '\''/p/Dev/'\'''
  alias cdgh='cdd '\''/p/Dev/GitHub/'\'''
  
  
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
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias lal='ls -la'

# Cd
alias ..='cdd ..'
alias ...='cdd ../..'
alias -- -='cd - && ls'
alias -- --='cd - && ls'

# Grep
alias grep='grep --color'

# Df
alias df='df -h'

# Edit .bash_profile
alias ebp='vi ~/.bash_profile'
alias bp='. ~/.bash_profile'

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
alias gdfnc='git diff --name-only --cached'
alias gdfw='git diff --color-words --word-diff-regex='\''\\w+|[^[:space:]]'\'''
alias gdfwc='git diff --color-words --word-diff-regex='\''\\w+|[^[:space:]]'\'' --cached'
alias gfe='git fetch'
alias gl=' git log -10 --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d"'
alias glf='git log --pretty=fuller'
alias glog='git log'
alias glr='git log -10 --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --graph'
alias gm='git merge'
alias gpl='git pull'
alias gps='git push'
alias gre='git reset'
alias greh='git reset --hard'
alias gst='git status'
alias gs='git status -s -b'

# Show Git Alias
alias galias='git config --global -l | grep alias'

# Tig
alias tiga='tig --all'


# Alias : Node
# ================================================================================

alias n='npm'

alias ni='npm install'
alias nls='npm list --depth=0'
alias nlsg='npm list --depth=0 -g'
alias nr='npm run'
alias ns='npm start'
alias nt='npm test'
alias nu='npm uninstall'


# Alias : Vagrant
# ================================================================================

alias v='vagrant'

alias vup='vagrant up'
alias vsh='vagrant ssh'
alias vha='vagrant halt'


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
