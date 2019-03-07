# ================================================================================
# .bashrc
# ================================================================================


# Detect OS And Settings
# ================================================================================

if [ "$(uname)" == "Darwin" ]; then
  # echo '[MacOS] .bashrc'
  # ==============================================================================
  
  
  # ls
  export CLICOLOR=1
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -G'
  
  # open = start
  alias start='open'
  
  # sed
  alias sed='gsed'
  
  # tree
  alias tree='tree -N'
  
  # Open App
  alias chrome='open -a "Google Chrome"'
  alias firefox='open -a Firefox'
  alias cot='open -a CotEditor'
  
  # Nodebrew
  alias nb='nodebrew'
  
  # Sudo コマンドの補完を有効にする
  complete -cf sudo
  
  # カレントディレクトリ配下の .DS_Store を全て消す
  alias delds='find . -name ".DS_Store" -delete'
  
  # Finder のアクティブウィンドウのディレクトリに移動する
  function cdf() {
    local target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
      cd "$target" && pwd && ls
    else
      echo 'No Finder window found' >&2
    fi
  }
  
  # CotEditor で開いているファイルを VSCode で開く
  alias cotvs='open -a '\''Visual Studio Code'\'' "$(osascript -e '\''tell application "CotEditor" to get path of document 1'\'')"'
  # CotEditor で開いているファイルを Chrome で開く
  alias cotchrome='open -a '\''Google Chrome'\'' "$(osascript -e '\''tell application "CotEditor" to get path of document 1'\'')"'
  
  # CotEditor で開く
  alias cotbp='open -a CotEditor ~/.bash_profile'
  alias cotrc='open -a CotEditor ~/.bashrc'
  
  # ------------------------------------------------------------------------------
  
  # cd Aliases
  alias cdev='cdd ~/Documents/Dev/'
  alias cdgh='cdd ~/Documents/Dev/GitHub/'
  alias cds='cdd ~/Documents/Dev/Sandboxes/'
  
  
  # ------------------------------------------------------------------------------
else
  # echo '[Windows] .bashrc'
  # ==============================================================================
  
  
  # ls
  alias ls='ls -F --color=auto --show-control-chars --time-style=long-iso'
  # C:\Program Files\Git\etc\ や C:\git-sdk-64\etc\ 配下の DIR_COLORS が色設定を持っている
  # 「DIR 01;34」を「DIR 01;36」にするとディレクトリが水色になる
  eval $(dircolors /etc/DIR_COLORS 2> /dev/null)
  
  # start = open
  alias open='start'
  
  # Open App
  alias chrome='cmd //c start chrome.exe'
  alias firefox='cmd //c start firefox.exe'
  alias npp=' cmd //c start notepad++.exe'
  
  # ------------------------------------------------------------------------------
  
  # cd Aliases
  alias cdev='cdd '\''/c/Neos21/Dev/'\'''
  alias cdgh='cdd '\''/c/Neos21/Dev/GitHub/'\'''
  alias cds='cdd '\''/c/Neos21/Dev/Sandboxes/'\'''
  
  
  # ------------------------------------------------------------------------------
fi


# --------------------------------------------------------------------------------
# Alias
# --------------------------------------------------------------------------------


# Alias : General
# ================================================================================

alias quit='exit'
alias cls='reset'

# ls
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias lal='ls -la'
alias la1='ls -a -1'
alias ls1='ls -1'

# cd
alias ..='cdd ..'
alias ...='cdd ../..'
alias -- -='cd - && ls'
alias -- --='cd - && ls'

# grep : 検索文字列を色付けする
alias grep='grep --color'
alias grepinr='grep -inR'

# df : バイト表示を単位変換する
alias df='df -h'

# PostgreSQL : パスワードは ~/.pgpass (pgpass.conf) で設定
alias mpsql='psql -U postgres --dbname=my_local_db'

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
alias gremo='git remote'
alias gremov='git remote -v'
alias gremos='git remote set-url origin'
alias gst='git status'
alias gs='git status -s -b'

# tig
alias tiga='tig --all'


# Alias : Node
# ================================================================================

alias n='npm'

alias ni='npm install --progress=true'
alias nl='npm list --depth=0'
alias nls='npm list --depth=0'
alias nlg='npm list --depth=0 -g'
alias nlsg='npm list --depth=0 -g'
alias nr='npm run'
alias np='npm publish --access=public'
alias ns='npm start || npm run dev'
alias nt='npm test'
alias nu='npm uninstall --progress=true'
alias nunp='npm unpublish'

# For Angular CLI
alias nn='npm run ng'


# Alias : Vagrant
# ================================================================================

alias v='vagrant'

alias vup='vagrant up'
alias vsh='vagrant ssh'
alias vha='vagrant halt'


# Alias : Docker
# ================================================================================

alias d='docker'
alias dbuild='docker build --no-cache --tag'
alias dexec='docker exec -it'  # ex. docker exec -it 【Container ID】 bash
alias di='docker images'
alias ditag='docker image tag'
alias dps='docker ps -a'
alias dpush='docker push'
alias drm='docker rm'
alias drmi='docker rmi'
alias drun='docker run -it'  # ex. docker run -v `pwd`:/tmp/shared -p 8080:8080 【Image】 bash


# Alias : Kubernetes
# ================================================================================

alias k='kubectl'
alias kaf='kubectl apply -f'
alias kd='kubectl describe'
alias kdn='kubectl describe node'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdsc='kubectl describe secret'
alias ke='kubectl edit'
alias kes='kubectl edit service'
alias kesh='kubectl exec -ti'
alias kg='kubectl get'
alias kgn='kubectl get node'
alias kgp='kubectl get pod'
alias kgs='kubectl get service'
alias kgsc='kubectl get secret'
alias kl='kubectl logs'
alias kp='kubectl proxy'


# --------------------------------------------------------------------------------
# Function
# --------------------------------------------------------------------------------


# Function : mkdir したディレクトリに cd する
#   http://qiita.com/0x60df/items/303666033788b937c578
# ================================================================================

function mkcd() {
  exec 3>&1
  cd "`
    if mkdir "$@" 1>&3; then
      while [ $# -gt 0 ]; do
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

function cdd() {
  \cd "$@" && pwd && ls
}


# Function : 複数の Git ブランチをまとめて削除する
#   https://github.com/takutoarao/shellutils/blob/master/git-rmbranch
# ================================================================================

function gbds() {
  if [ -z "$1" ]; then
    echo 'ブランチ名を指定してください'
    return 1
  fi
  
  local branch_name="$1";
  local list=`git branch | grep -i "$branch_name" | grep -v '*'`
  
  if [ -z "$list" ]; then
    echo '該当するブランチはありません'
    return 1
  fi
  
  echo "$list"
  read -p 'これらのブランチを削除してもよろしいですか？ [Y/n] ' yn
  case "$yn" in
    [yY]) git branch | grep -i "$branch_name" | grep -v '*' | xargs git branch -D
          echo 'Deleted.'
          ;;
       *) echo '中止'
          return 1
          ;;
  esac
}


# --------------------------------------------------------------------------------
