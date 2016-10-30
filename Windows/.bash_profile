# .bash_profile
# 
# - ログイン時に一回だけ読み込まれる。
# - ~/.bash_profile がなかったら ~/.bash_login、これもなかったら ~/.profile を読み込もうとする。
# - .bash_profile は export する環境変数を設定するために使うと良い。
#   (環境変数はプロセス間で引き継がれるため、ログイン時に設定するだけで良いということ)
# - ~/.bashrc は再ログインせずとも bash シェルの起動ごとに読み込まれる。
#   (Linux デスクトップ環境だとデスクトップ上でターミナルを開いた時は .bashrc のみ実行される)

# - GitBash のデフォルトファイルで以下のエイリアスが定義される。
# - C:/Program Files/Git/etc/profile.d/aliases.sh
#   - alias ls='ls -F --color=auto --show-control-chars'
#   - alias ll='ls -l'
# - その他、$TERM が xterm だと winpty 系のエイリアスも登録される。
#   - export TERM=xterm



# History 関係
# 
# - 重複履歴を無視
#   export HISTCONTROL=ignoredups 
# - 空白から始めたコマンドを無視
#   export HISTCONTROL=ignorespace
# - 両方指定 ignorespace + ignoredups = ignoreboth

export HISTCONTROL=ignoreboth



# PATH の追加
# 
# export PATH=$PATH:追加したいフォルダのパス



# .bashrc を読み込む
# 
# - source と . (ピリオド) は同じコマンド。カレントシェルで実行する。
# - 別の書き方
#   if [ -f ~/.bashrc ]; then
#     source ~/.bashrc
#   fi

test -r ~/.bashrc && . ~/.bashrc