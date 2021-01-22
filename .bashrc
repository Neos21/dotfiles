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
  #test -r "${HOME}/.git-prompt.sh" &&
  . "${HOME}/.git-prompt.sh"
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
  
  # Open App
  alias chrome='open -a "Google Chrome"'
  alias firefox='open -a Firefox'
  
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
  
  alias cbp='code --add "${HOME}/.bash_profile"'
  alias crc='code --add "${HOME}/.bashrc"'
  
  # ghi : GitHub Issues CLI
  alias hl='ghi list -- Neos21'
  function ho()  { ghi open    "$@" -- Neos21 ; }
  function hs()  { ghi show    "$@" -- Neos21 ; }
  function he()  { ghi edit    "$@" -- Neos21 ; }
  function hcl() { ghi close   "$@" -- Neos21 ; }
  function hc()  { ghi comment "$@" -- Neos21 ; }
  
  # Customize --------------------------------------------------------------------
  
  # cd Aliases
  alias cdb='cd "${HOME}/Documents/Dev/BitBucket/" && pwd && ls'
  alias cdev='cd "${HOME}/Documents/Dev/" && pwd && ls'
  alias cdgh='cd "${HOME}/Documents/Dev/GitHub/" && pwd && ls'
  alias cds='cd "${HOME}/Documents/Dev/Sandboxes/" && pwd && ls'
  
  # CotEditor
  alias cot='open -a CotEditor'
  # CotEditor で開いているファイルを VSCode で開く
  alias cotvs='open -a '\''Visual Studio Code'\'' "$(osascript -e '\''tell application "CotEditor" to get path of document 1'\'')"'
  # CotEditor で開いているファイルを Chrome で開く
  alias cotchrome='open -a '\''Google Chrome'\'' "$(osascript -e '\''tell application "CotEditor" to get path of document 1'\'')"'
  # CotEditor で開く
  alias cotbp='open -a CotEditor "${HOME}/.bash_profile"'
  alias cotrc='open -a CotEditor "${HOME}/.bashrc"'
  
  # ------------------------------------------------------------------------------
elif [ "$(uname)" == 'Linux' ]; then
  #echo '[Linux] .bashrc'
  # ==============================================================================
  
  # Ubuntu 18.04 Original .bashrc ------------------------------------------------
  
  # append to the history file, don't overwrite it
  shopt -s histappend
  
  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
  HISTSIZE=1000
  HISTFILESIZE=2000
  
  # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
  shopt -s checkwinsize
  
  # make less more friendly for non-text input files, see lesspipe(1)
  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
  
  # enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto --show-control-chars --time-style=long-iso'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  fi
  
  # Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
  alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
  
  # enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
  if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
  fi
  
  # ------------------------------------------------------------------------------
  
  # Git Prompt
  #test -r "${HOME}/.git-prompt.sh" &&
  . "${HOME}/.git-prompt.sh"
  export PS1='\n\[\033[32m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]$(__git_ps1)\[\033[0m\]\n$ '
  
  # start・open = xdg-open
  alias start='xdg-open'
  alias open='xdg-open'
  
  # apt
  alias apt='sudo apt'
  alias apt-get='sudo apt-get'
  alias aptlist='sudo dpkg -l'
  alias aptup='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y'
  
  # For ThinkPad TrackPad Not Working
  alias rt='sudo modprobe -r psmouse && sudo modprobe psmouse'
  
  # Python3
  alias python='/usr/bin/python3.7'
  alias pip='/usr/bin/pip3'
  
  # Clipboard
  if type xclip > /dev/null 2>&1; then
    alias pbcopy='xclip -selection c'
    alias pbpaste='xclip -selection c -o'
  fi
  
  # 事故防止
  alias chmod='chmod --preserve-root'  # ルートディレクトリからの再帰的実行を回避する
  
  if [ "$(whoami)" == 'root' ] ; then
    # For root User --------------------------------------------------------------
    
    # Git Prompt
    export PS1='\n\[\033[31m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]$(__git_ps1)\[\033[0m\]\n$ '
  else
    # For General Users Only -----------------------------------------------------
    
    # Homebrew Linuxbrew
    test -d '/home/linuxbrew/.linuxbrew' && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
  
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
    
    # Clipboard
    if type pbcopy > /dev/null 2>&1; then
      unalias pbcopy
    fi
    if type pbpaste > /dev/null 2>&1; then
      unalias pbpaste
    fi
    function pbcopy() {
      # /mnt/c/Windows/System32/clip.exe
      tee <&0 | clip.exe
    }
    function pbpaste() {
      # /mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/powershell.exe
      powershell.exe Get-Clipboard | sed 's/\r$//' | sed -z '$ s/\n$//'
    }
  fi
  
  # Customize --------------------------------------------------------------------
  
  # cd Aliases
  alias cdb='cd "${HOME}/Documents/Dev/BitBucket/" && pwd && ls'
  alias cdev='cd "${HOME}/Documents/Dev/" && pwd && ls'
  alias cdgh='cd "${HOME}/Documents/Dev/GitHub/" && pwd && ls'
  alias cds='cd "${HOME}/Documents/Dev/Sandboxes/" && pwd && ls'
  
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
  
  # 事故防止
  alias chmod='chmod --preserve-root'  # ルートディレクトリからの再帰的実行を回避する
  
  # Open App
  alias chrome='cmd //c start chrome.exe'
  alias firefox='cmd //c start firefox.exe'
  alias npp='cmd //c start notepad++.exe'
  
  # Customize --------------------------------------------------------------------
  
  # cd Aliases
  alias cdb='cd '\''/c/Neos21/Dev/BitBucket/'\'' && pwd && ls'
  alias cdev='cd '\''/c/Neos21/Dev/'\'' && pwd && ls'
  alias cdgh='cd '\''/c/Neos21/Dev/GitHub/'\'' && pwd && ls'
  alias cds='cd '\''/c/Neos21/Dev/Sandboxes/'\'' && pwd && ls'
  
  # ------------------------------------------------------------------------------
fi


# --------------------------------------------------------------------------------
# Environment Variables
# --------------------------------------------------------------------------------


# History
# ================================================================================

export HISTCONTROL='ignoreboth'
export HISTTIMEFORMAT='%F %T '


# Visual Editor
# ================================================================================

export EDITOR='vim'
export VISUAL='vim'


# Git Completion
# ================================================================================

#test -r "${HOME}/.git-completion.bash" &&
. "${HOME}/.git-completion.bash"

# My Aliases
#if type __git_complete 1>/dev/null 2>/dev/null; then
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
#fi

# Git Prompt
export GIT_PS1_SHOWDIRTYSTATE='true'
export GIT_PS1_SHOWUNTRACKEDFILES='true'


# Language Specific
# ================================================================================

# Node.js : Nodebrew
PATH="${HOME}/.nodebrew/current/bin:${PATH}"

# Python : pipenv
export PIPENV_VENV_IN_PROJECT='true'


# My Commands : Export PATH
# ================================================================================

export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"


# --------------------------------------------------------------------------------
# Alias
# --------------------------------------------------------------------------------


# Alias : General
# ================================================================================

alias quit='exit'
alias cls='reset'
alias sudo='sudo '
alias r='sudo su -'

# ls
alias la='ls -A'
alias ll='ls -l'
alias lal='ls -lA'
alias lla='ls -lA'
alias la1='ls -A -1'
alias ls1='ls -1'

# exa
if type exa > /dev/null 2>&1; then
  alias lla='ls -A'
  alias lll='ls -l'
  alias llal='ls -lA'
  alias lla1='ls -A -1'
  alias lls1='ls -1'
  alias la='exa -la'
  alias ll='exa -ll'
  alias lal='exa -la'
  alias la1='exa -la1'
  alias ls1='exa -1'
fi

# cd
alias ..='cd .. && pwd && ls'
alias ...='cd ../.. && pwd && ls'
alias -- -='cd - && ls'
alias -- --='cd - && ls'

# mkdir && cd
function mkcd() { mkdir -p "$@" && cd $_; }

# カレントディレクトリ配下の .DS_Store を全て消す
alias delds='find . -name '\''.DS_Store'\'' -delete'

# grep : 検索文字列を色付けする
alias grep='grep --color'
alias grepinr='grep -inR'

# df : バイト表示を単位変換する
alias df='df -h'

# vi = vim
alias vi='vim'

# Edit And Reload Setting Files
alias ebp='vi "${HOME}/.bash_profile"'
alias rbp='.  "${HOME}/.bash_profile"'
alias erc='vi "${HOME}/.bashrc"'
alias rrc='.  "${HOME}/.bashrc"'

# SSH Config のリストを表示する
alias sshls='grep -rh '\''^Host '\'' "${HOME}/.ssh/" | grep -v '\''*'\'' | sed '\''s/Host /ssh /'\'' | sort'
# SSH 接続先や root で使いたい PS1 プロンプトをコピペ用に出力する
alias echops1='echo '\''export PS1="\n\[\033[31m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[0m\]\n$ "'\'''

# 事故防止
alias dd='echo '\''No dd command available.'\'''  # ファイルコピーを行う dd コマンドを無効化しておく

# Tmux
alias tc='clear && tmux clear-history'
alias tq='tmux kill-session'


# Alias : Git
# ================================================================================

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -D'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcl='git clone'
alias gc='git commit'
alias gce='git commit --allow-empty'
alias gcem='git commit --allow-empty -m'
alias gcm='git commit -m'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gdfcw='git diff --color-words --word-diff-regex='\''\\w+|[^[:space:]]'\'' --cached'
alias gdfn='git diff --name-only'
alias gdfnc='git diff --name-only --cached'
alias gdfw='git diff --color-words --word-diff-regex='\''\\w+|[^[:space:]]'\'''
alias gdfwc='git diff --color-words --word-diff-regex='\''\\w+|[^[:space:]]'\'' --cached'
alias gdfwo='git diff --word-diff'
alias gdfwoc='git diff --word-diff --cached'
alias gfe='git fetch'
alias gl=' git log -10 --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d"'
alias glf='git log --pretty=fuller'
alias glo='git log'
alias glr='git log -10 --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --graph'
alias gm='git merge'
alias gpl='git pull'
alias gps='git push'
alias gre='git reset'
alias greh='git reset --hard'
alias gr='git remote'
alias grv='git remote -v'
alias grs='git remote set-url origin'
alias gst='git status'
alias gs='git status -s -b'
alias gt='git tag'

function gclcd() {
  git clone "$1" && cd "$(basename "$1" .git)" || return
}

function gplf() {
  local current_branch_name="$(git branch | grep -e '^* ' | sed 's/^* //g')"
  git branch --set-upstream-to="origin/${current_branch_name}" "${current_branch_name}"
  git pull
}

# tig
alias tiga='tig --all'


# Alias : Node.js
# ================================================================================

alias n='npm'
alias ni='npm install --progress=true'
alias nl='npm list --depth=0'
alias nls='npm list --depth=0'
alias nlg='npm list --depth=0 -g'
alias nlsg='npm list --depth=0 -g'
alias nout='npm outdated'
alias nr='npm run'
alias np='npm publish --access=public'
alias ns='npm start'
alias nt='npm test'
alias nu='npm uninstall --progress=true'
alias nunp='npm unpublish'

# For Angular CLI
alias nn='npm run ng'

# Nodebrew
alias nb='nodebrew'


# Alias : Python
# ================================================================================

alias p='pipenv'
alias pi='pipenv install'
alias pr='pipenv run'
alias prs='pipenv run start'
alias psh='pipenv shell'
alias pu='pipenv uninstall'


# Alias : VSCode
# ================================================================================

function c() {
  if [ "$#" -eq 0 ]; then
    code .
  else 
    code "$@"
  fi
}

function ca() {
  if [ "$#" -eq 0 ]; then
    code --add .
  else 
    code --add "$@"
  fi
}

function cr() {
  if [ "$#" -eq 0 ]; then
    code --reuse-window .
  else 
    code --reuse-window "$@"
  fi
}


# Alias : Docker
# ================================================================================

alias d='docker'
alias da='docker attach'
alias db='docker build --no-cache --tag'
alias di='docker images'
alias dit='docker image tag'
alias dpl='docker pull'
alias dps='docker ps -a'
alias dpush='docker push'
alias dr='docker run -it'  # ex. docker run -it -v "$(pwd):/tmp/shared" -p 8080:8080 【Image Name】 bash
alias drm='docker rm -f'
alias drma='docker rm -f $(docker ps -aq)'
alias drmi='docker rmi'
alias drun='docker run -it'
alias ds='docker start'
alias dsta='docker start'
alias dsto='docker stop'

# 対象コンテナが止まっていても強制的に docker exec する
function de() {
  if [ "$#" -eq 0 ]; then
    echo '[de : docker exec function] Requires at least 1 argument.'
    return 1
  fi
  docker start "$1" > /dev/null
  if [ "$#" -eq 1 ]; then
    docker exec -it "$1" 'bash' || docker exec -it "$1" 'ash' || docker exec -it "$1" 'sh'
  else
    docker exec -it "$@"  # ex. 【Container ID or Container Name】 bash
  fi
}

alias dc='docker-compose'
alias dcb='docker-compose build --no-cache'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'
alias dcr='docker-compose run --rm'
alias dcrm='docker-compose rm -sf'
alias dcrun='docker-compose run --rm'
alias dcsta='docker-compose start'
alias dcsto='docker-compose stop'


# Alias : Kubernetes
# ================================================================================

alias k='kubectl'
alias kaf='kubectl apply -f'
alias kd='kubectl describe'
alias kdd='kubectl describe deployment'
alias kdn='kubectl describe node'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdse='kubectl describe secret'
alias ke='kubectl edit'
alias kes='kubectl edit service'
alias kg='kubectl get -o wide'
alias kgj='kubectl get -o json'
alias kgy='kubectl get -o yaml'
alias kgd='kubectl get deployment -o wide'
alias kgdj='kubectl get deployment -o json'
alias kgdy='kubectl get deployment -o yaml'
alias kgn='kubectl get node -o wide'
alias kgnj='kubectl get node -o json'
alias kgny='kubectl get node -o yaml'
alias kgp='kubectl get pod -o wide'
alias kgpc='kubectl get pod -o wide --sort-by=.metadata.creationTimestamp'
alias kgpj='kubectl get pod -o json'
alias kgpy='kubectl get pod -o yaml'
alias kgs='kubectl get service -o wide'
alias kgsj='kubectl get service -o json'
alias kgsy='kubectl get service -o yaml'
alias kgse='kubectl get secret'
alias kgsej='kubectl get secret -o json'
alias kgsey='kubectl get secret -o yaml'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kp='kubectl proxy'

function kesh() {
  if [ "$#" -eq 0 ]; then
    echo '[kesh : kubectl exec function] Requires at least 1 argument.'
    return 1
  fi
  if [ "$#" -eq 1 ]; then
    kubectl exec -it "$1" -- 'bash' || kubectl exec -it "$1" -- 'ash' || kubectl exec -it "$1" 'sh'
  else
    kubectl exec -it "$@"  # ex. 【Pod Name】 -- bash
  fi
}

function kgsed() {
  if [ "$#" -eq 0 ]; then
    echo '[kgsed : kubectl get secret decode function] Requires at least 1 argument.'
    return 1
  fi
  kubectl get secret "$1" -o json | jq -r '.data | to_entries | map({ (.key|tostring): (.value|@base64d) }) | add'
}


# Alias : Terraform
# ================================================================================

alias t='terraform'
alias ta='terraform apply'
alias td='terraform destroy'
alias ti='terraform init'
alias tp='terraform plan'
alias tpd='terraform plan -destroy'


# --------------------------------------------------------------------------------
