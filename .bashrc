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
  
  # ------------------------------------------------------------------------------
  
  # cd Aliases
  alias cdev='cdd ~/Documents/Dev/'
  alias cdgh='cdd ~/Documents/Dev/GitHub/'
  
  
  # ------------------------------------------------------------------------------
else
  # echo '[Windows] .bashrc'
  # ==============================================================================
  
  
  # ls
  alias ls='ls -F --color=auto --show-control-chars'
  # C:\Program Files\Git\etc\ や C:\git-sdk-64\etc\ 配下の DIR_COLORS が色設定を持っている
  # 「DIR 01;34」を「DIR 01;36」にするとディレクトリが水色になる
  eval $(dircolors /etc/DIR_COLORS 2> /dev/null)
  
  # start = open
  alias open='start'
  
  # ------------------------------------------------------------------------------
  
  # cd Aliases
  alias cdev='cdd '\''/p/Dev/'\'''
  alias cdgh='cdd '\''/p/Dev/GitHub/'\'''
  
  
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
alias gst='git status'
alias gs='git status -s -b'

# Show Git Alias
alias galias='git config --global -l | grep alias'

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
alias ns='npm start || npm run dev'
alias nt='npm test'
alias nu='npm uninstall --progress=true'

# For Angular CLI
alias nn='npm run ng'


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
