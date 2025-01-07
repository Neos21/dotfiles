# ChromeOS Linux (Debian Buster) リカバリ手順

```bash
# apt を最新化する
$ sudo apt update
$ sudo apt upgrade -y
$ sudo apt dist-upgrade -y
$ sudo apt autoremove -y

# よく使うツールを入れる
$ sudo apt install -y git tig tmux jq tree

# 必要なファイル・ディレクトリを準備する
$ mv ~/.profile ~/_RAW_profile
$ mv ~/.bashrc ~/_RAW_bashrc
$ mkdir -p ~/Documents/Dev/GitHub ~/Documents/Dev/BitBucket ~/Documents/Dev/Sandboxes

# Dotfiles を配備する
$ cd ~/Documents/Dev/GitHub
$ git clone https://Neos21@github.com/Neos21/dotfiles.git
$ cd ./dotfiles/
$ ./sync-dotfiles.sh
$ cp ./.git-completion.bash ~/
$ cp ./.git-prompt.sh ~/

# Fcitx-Mozc を入れる
$ sudo apt install -y fcitx fcitx-mozc
# シェルフに Fcitx が追加されているので選ぶ・コレだけでは何も表示されないが、次のコマンドを叩くと設定画面が開く
$ fcitx-configtool
# Input Method タブで「+ (追加)」を選び、リストから「Mozc (右端に Japanese)」を選ぶ。あとは適宜設定…

# Fcitx を起動するには以下
$ fcitx-autostart

# nvm をインストールする
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# ターミナルを再起動する
$ nvm install v22.12.0
$ nvm use v22.12.0
# コレだけで Node.js・npm が使えるようになる
```

## VSCode

- <https://code.visualstudio.com/#alt-downloads>
    - `arm64.deb` をダウンロード・インストールする
