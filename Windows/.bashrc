# .bashrc
# 
# エイリアスを無効にするには、バックスラッシュを含める
#   $ \エイリアスコマンド名



# 最近頻繁に使うエイリアス

# ココに書いておく



# お決まりのエイリアス

# 移動しやすくする
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# Git
alias gst='git status'
alias gs='git status -s'
alias ga='git add'
alias gc='git commit -m'
alias gpl='git pull'
alias gps='git push'

# Git Log シンプル版
alias gl=' git log -10 --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d"'
# Git Log グラフ
alias glr='git log -10 --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --graph'
# Git Log 修正ライン数が分かる
alias gll='git log -5  --date=short --pretty=format:"%C(Yellow)%h %C(Cyan)%cd %C(Reset)%s %C(Blue)[%cn]%C(Red)%d" --numstat'

# Grep : 検索対象の文字に色が付く
alias grep='grep --color'

# Df : ディスク容量を確認するコマンド。バイト表示なのを単位変換して見られる
alias df='df -h'

# その他
alias np='notepad++'
alias rc='source ~/.bashrc'
alias cls='clear'
alias quit='exit'

# mkdir したディレクトリに cd する
# http://qiita.com/0x60df/items/303666033788b937c578
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

# cd したあと ls する
# http://thehacker.jp/alias-settings/
cdls() {
  \cd "$@" && ls
}