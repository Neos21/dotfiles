# ================================================================================
# .bash_aliases
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
  test -r "${HOME}/.git-prompt.bash" && source "${HOME}/.git-prompt.bash"
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
  
  # ------------------------------------------------------------------------------
elif [ "$(uname)" == 'Linux' ]; then
  #echo '[Linux] .bashrc'
  # ==============================================================================
  
  test -r "${HOME}/.git-prompt.bash" && source "${HOME}/.git-prompt.bash"
  if [ "$(whoami)" == 'root' ] ; then
    export PS1='\n\[\033[31m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]$(__git_ps1)\[\033[0m\]\n$ '
  else
    export PS1='\n\[\033[32m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]$(__git_ps1)\[\033[0m\]\n$ '
    
    # Linuxbrew
    test -d '/home/linuxbrew/.linuxbrew/' && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
  
  # start・open = xdg-open
  alias start='xdg-open'
  alias open='xdg-open'
  
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
  #test -r "${HOME}/.git-prompt.bash" && . "${HOME}/.git-prompt.bash"
  export PS1='\n\[\033[31m\][Windows] \[\033[32m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
  
  # ls
  alias ls='ls -F --color=auto --show-control-chars --time-style=long-iso'
  # C:\Program Files\Git\etc\ や C:\git-sdk-64\etc\ 配下の DIR_COLORS が色設定を持っている
  # 「DIR 01;34」を「DIR 01;36」にするとディレクトリが水色になる
  eval "$(dircolors /etc/DIR_COLORS 2> /dev/null)"
  
  # start = open
  alias open='start'
  
  # ------------------------------------------------------------------------------
fi


# System
# ================================================================================

# History
export HISTCONTROL='ignoreboth'
export HISTTIMEFORMAT='%F %T '

# Editor
export EDITOR='vim'
export VISUAL='vim'

# Git Prompt
export GIT_PS1_SHOWDIRTYSTATE='true'
export GIT_PS1_SHOWUNTRACKEDFILES='true'

# apt
alias apt='sudo apt'
alias apt-get='sudo apt-get'
alias aptlist='sudo dpkg -l'
alias aptup='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y'


# General
# ================================================================================

alias quit='exit'
alias cls='reset'
alias sudo='sudo '
alias r='sudo su -'

# 事故防止
alias chmod='chmod --preserve-root'  # ルートディレクトリからの再帰的実行を回避する
alias dd='echo '\''No dd command available.'\'''  # ファイルコピーを行う dd コマンドを無効化しておく

# ls
alias ls='ls -F --color=auto --show-control-chars --time-style=long-iso'
alias la='ls -A'
alias ll='ls -l'
alias lal='ls -lA'
alias lla='ls -lA'
alias la1='ls -A -1'
alias ls1='ls -1'

# cd
alias ..='cd .. && pwd && ls'
alias ...='cd ../.. && pwd && ls'
alias ....='cd ../../.. && pwd && ls'
alias .....='cd ../../../.. && pwd && ls'
alias -- -='cd - && ls'
alias -- --='cd - && ls'

# cd Aliases
alias cdb='cd "${HOME}/Documents/Dev/BitBucket/" && pwd && ls'
alias cdev='cd "${HOME}/Documents/Dev/" && pwd && ls'
alias cdgh='cd "${HOME}/Documents/Dev/GitHub/" && pwd && ls'
alias cd21='cd "${HOME}/Documents/Dev/GitHub/21" && pwd && ls'
alias cds='cd "${HOME}/Documents/Dev/Sandboxes/" && pwd && ls'

function mkcd() {
  mkdir -p "$@" && cd $_;
}

# grep : 検索文字列を色付けする
alias grep='grep --color'
alias grepinr='grep -inR'

# df : バイト表示を単位変換する
alias df='df -h'

# vi = vim
alias vi='vim'

# Edit And Reload Setting Files
alias ebp='vi     "${HOME}/.bash_profile"'
alias rbp='source "${HOME}/.bash_profile"'
alias erc='vi     "${HOME}/.bashrc"'
alias rrc='source "${HOME}/.bashrc"'

# SSH Config のリストを表示する
alias sshls='grep -rh '\''^Host '\'' "${HOME}/.ssh/" | grep -v '\''*'\'' | sed '\''s/Host /ssh /'\'' | sort'
# SSH 接続先や root で使いたい PS1 プロンプトをコピペ用に出力する
alias echops1='echo '\''export PS1="\n\[\033[31m\]\u@\h \[\033[35m\]\D{%F %T} \[\033[33m\]\w\[\033[0m\]\n$ "'\'''
# カレントディレクトリ配下の .DS_Store を全て消す
alias delds='find . -name '\''.DS_Store'\'' -delete'


# Git
# ================================================================================

# Git Completion
test -r "${HOME}/.git-completion.bash" && source "${HOME}/.git-completion.bash"
if type __git_complete 1>/dev/null 2>/dev/null; then
  __git_complete gbd _git_branch
  __git_complete gco _git_checkout
  __git_complete gdf _git_diff
  __git_complete gdfc _git_diff
  __git_complete gdfn _git_diff
  __git_complete gdfnc _git_diff
  __git_complete gdfw _git_diff
  __git_complete gdfwc _git_diff
  __git_complete gdfwo _git_diff
  __git_complete gdfwoc _git_diff
  __git_complete gm _git_merge
fi

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

function opug() {
  open "$(git config remote.origin.url | sed 's!//.*@!//!')"
}

# tig
alias tiga='tig --all'


# Node.js
# ================================================================================

export NVM_DIR="${HOME}/.nvm"
test -r "${NVM_DIR}/nvm.sh" && source "${NVM_DIR}/nvm.sh"  # Load nvm
test -r "${NVM_DIR}/bash_completion" && source "${NVM_DIR}/bash_completion"  # Load nvm Bash Completion

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


# VSCode
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


# Docker
# ================================================================================

alias d='docker'
alias da='docker attach'
alias db='docker build --no-cache --tag'
alias di='docker images'
alias dit='docker image tag'
alias dlog='docker logs'
alias dlf='docker logs -f'
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


# Kubernetes
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

# ex. `$ kubectl get secret example-secret -o json | kdecode | jq -r '.["tls.crt"]'`
function kdecode() {
  jq '.data | to_entries | map({ (.key|tostring): (.value|@base64d) }) | add'
}


# Export PATH
# ================================================================================

export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# --------------------------------------------------------------------------------
