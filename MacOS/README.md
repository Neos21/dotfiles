# MacOS リカバリ手順


## MacOS 設定

- システム環境設定
    - Dock : よしなに
    - Mission Control : ショートカット全てなし・ホットコーナー左上で「ディスプレイをスリープ」
    - キーボード : キーリピートを最速・リピート入力認識を最短・修飾キーで CapsLock を Control にする
    - トラックパッド : 「スクロールの方向：ナチュラル」のチェックを外す


## インストールするソフト

- App Store
    - Xcode : Xcode Command Line Tools (`$ xcode-select --install`)
    - CotEditor
    - Office (Word・Excel・PowerPoint)
    - Slack
- 個別
    - [英かな](https://ei-kana.appspot.com/) … Cmd に英かなの動作をさせる
    - [Karabiner-Elements](https://pqrs.org/osx/karabiner/) … 日本語キーボードで英かなに Cmd の動作をさせる
    - [HyperSwitch](https://bahoom.com/hyperswitch)
    - [Day-O 2](https://shauninman.com/archive/2016/10/20/day_o_2_mac_menu_bar_clock)
    - [Google 日本語入力](https://www.google.co.jp/ime/)
    - [Google Backup And Sync](https://www.google.com/intl/ja_ALL/drive/download/)
    - [VSCode](https://code.visualstudio.com/download)
    - [Docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac/)
    - [Chrome](https://www.google.com/intl/ja_jp/chrome/)
    - [Firefox](https://www.mozilla.org/ja/firefox/new/)
    - [Chromium Edge](https://www.microsoft.com/en-us/edge)
    - [Nodebrew](https://github.com/hokaccha/nodebrew)
        - `$ curl -L git.io/nodebrew | perl - setup`


## Homebrew

- <https://brew.sh/index_ja>

```bash
# インストール
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
$ brew doctor

# どの環境でも必要そう
$ brew install python rbenv ruby-build
$ brew install git tig ghi
$ brew install vim tmux reattach-to-user-namespace
$ brew install gnu-sed moreutils dateutils binutils
$ brew install bat colordiff exa iproute2mac jq kubernetes-cli nkf nmap ripgrep shellcheck tree w3m watch wget ydiff
$ brew cask install rectangle mounty

# 必要に応じて入れる
$ brew install go locust mecab thefuck tldr htop mysql postgresql

# k9s
$ brew tap derailed/k9s
$ brew install k9s

# Trivy
$ brew tap knqyf263/trivy
$ brew install knqyf263/trivy/trivy
```

### rbenv

```bash
# rbenv を読み込むよう設定する
$ echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# 必要なツールがインストールできていることを確認する
$ rbenv -v
$ ruby-build --version

# インストール可能なバージョンを確認する
$ rbenv install -l

# 適当なバージョンを選択しインストールする (時間がかかる)
$ ruby install 2.2.3

# インストール済の Ruby 一覧を確認し再読み込みする
$ rbenv versions
$ rbenv rehash

# グローバルで使用する Ruby のバージョンを指定する
$ rbenv global 2.2.3

# バージョンを確認する
$ ruby -v
```
