# MacOS リカバリ手順


## フォント

- メイリオ改、[Noto Sans CJK JP、Noto Sans Mono CJK JP、Noto Serif CJK JP](https://github.com/googlefonts/noto-cjk/tree/main/Sans) をインストールする
    - (メイリオは Office によりインストールされる)


## OS 設定

- ターミナル
    1. `$ chsh -s /bin/bash` で Zsh から Bash に切り替える
    2. テーマをインポートしデフォルトに設定する
        - フォント : MeiryoKe_Gothic
        - サイズ   : 15
        - 文字間隔 : 1
        - 行間隔   : 0.75
    3. `Recovery/setup-mac-os.bash` を実行する
    4. Dotfiles を配置する
    5. `$ touch ~/.hushlogin` を配置することで Last Login 表示を出さないようにする
- システム環境設定
    - Apple ID でログインする
        - キーチェーン、iCloud Drive、カレンダー を同期対象にする
    - Dock とメニューバー : サイズ感などよしなに
    - Mission Control : ショートカット全てなし・ホットコーナー左上で「ディスプレイをスリープ」
    - Spotlight : 検索結果全てなし・プライバシータブで除外する場所に「Macintosh HD」を追加する
    - 言語と地域 : 「詳細」で月日や時分秒などをゼロパディング形式にする
    - ユーザとグループ : 「ログイン項目」で以下を指定する
        - Google Chrome、Google Drive、Karabiner-Elements、Rectangle、英かな、Slack、HyperSwitch
    - キーボード
        - キーリピートを最速・リピート入力認識を最短
        - 修飾キー : CapsLock を Control にする
        - Control Strip : スペース、液晶輝度、スペース、キーボード輝度、スペース、音量、スペース の順に並べる
        - 入力ソース : Google 日本語入力をインストールし「ひらがな」「英数」を追加する → OS 標準の「日本語 かな入力」中の「英字」にチェックを入れる → 「US (ABC)」が削除できるようになるので削除する → 「日本語 かな入力」を削除する
    - トラックパッド
        - 「副ボタンのクリック (2本指でクリックまたはタップ)」、「タップでクリック」、「強めのクリックと触覚フィードバック」にチェックを入れる
        - 「スクロールの方向：ナチュラル」のチェックを外す
        - その他はチェックを外す


## App Store よりインストールする

- Xcode : Xcode Command Line Tools (`$ xcode-select --install`)
- CotEditor
    - テーマをインポートする
    - フォント : Noto Sans Mono CJK JP
    - サイズ   : 15
    - 行の高さ : 1.1 倍
    - 「リガチャ」のチェックを外す
- Office (Word・Excel・PowerPoint)
    - Microsoft アカウントでログインする
- Slack
    - ログインする
- QaLL
- Stuffit Expander


## 個別にインストールする

- [英かな](https://ei-kana.appspot.com/)
    - 左右の Cmd キーに「英数キー」「かなキー」の動作をさせる (画像参照)
    - 日本語配列の Mac の場合 : PC 本体の日本語キーボードの右上にある `￥` キーでチルダ `~` を入力できるようにするため、US キーボードを接続して設定する (画像参照)
- [Karabiner-Elements](https://pqrs.org/osx/karabiner/)
    - 日本語配列の Mac の場合のみインストールする
    - PC 本体の日本語キーボードを US キー配列で認識させ、「英数キー」「かなキー」に Cmd の動作をさせる (画像参照)
- [HyperSwitch](https://bahoom.com/hyperswitch)
    - 画像参照
- [Google 日本語入力](https://www.google.co.jp/ime/)
    - 辞書をインポートする
- [Google Backup And Sync](https://www.google.com/intl/ja_ALL/drive/download/)
- [VSCode](https://code.visualstudio.com/download)
    - Settings Sync 拡張機能をインストールし設定同期する
- [Docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac/)
    - DockerHub アカウントでログインする
- [Chrome](https://www.google.com/intl/ja_jp/chrome/)
    - Gmail アカウントで設定同期する
    - Advanced Font Settings で Noto Sans 系を選択する
    - Stylus、Markdown Preview Plus の設定をインポートする
- [Brave](https://brave.com/ja/)
    - 同期コードで設定同期する
    - 主な拡張機能の設定は Chrome と同様にする
- [Edge](https://www.microsoft.com/en-us/edge)
    - Microsoft アカウントで設定同期する
    - 主な拡張機能の設定は Chrome と同様にする
- [Firefox](https://www.mozilla.org/ja/firefox/new/)
    - Firefox アカウントで設定同期する
    - 主な拡張機能の設定は Chrome と同様にする
- [JDK 1.8](https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html)
    - ダウンロード時に Oracle アカウントでログインが必要となる

### 要検討

- [Day-O 2](https://shauninman.com/archive/2016/10/20/day_o_2_mac_menu_bar_clock) … 動かなくなってるかも


## Homebrew

- <https://brew.sh/index_ja>

```bash
# Homebrew 本体をインストールする
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
$ brew doctor

# 各種インストール物
$ brew install python
$ brew install go locust mecab mysql postgresql
$ brew install git tig
$ brew install vim tmux reattach-to-user-namespace
$ brew install gnu-sed moreutils dateutils binutils
$ brew install bat colordiff exa iproute2mac nkf nmap ripgrep shellcheck tree w3m watch wget htop ydiff
$ brew install jq kubernetes-cli

# 必要に応じて入れる
$ brew install ghi thefuck tldr

# rbenv の設定は後述
$ brew install rbenv ruby-build
# Terraform のバージョンを切り替えてインストールできるように tfenv を使う (後述)
$ brew install tfenv

# Rectangle の設定は画像参照・設定ファイルのインポートでも良い
$ brew install rectangle --cask
$ brew install mounty --cask

# k9s
$ brew tap derailed/k9s
$ brew install k9s
# Trivy
$ brew tap knqyf263/trivy
$ brew install knqyf263/trivy/trivy
```

### Nodebrew

- <https://github.com/hokaccha/nodebrew>

```bash
# Nodebrew をインストールする
$ curl -L git.io/nodebrew | perl - setup
# Nodebrew を読み込むよう設定する (.bashrc には記載済)
$ echo 'PATH="${HOME}/.nodebrew/current/bin:${PATH}"' >> ~/.bashrc

# インストール可能なバージョン一覧を確認する
$ nodebrew ls-remote

# 適当なバージョンを選択しインストールする
$ nodebrew install v18.0.0
# インストールしたバージョンを指定して利用可能にする
$ nodebrew use v18.0.0

# バージョンを確認する
$ node -v
$ npm -v
```

### rbenv

```bash
# rbenv を読み込むよう設定する (.bashrc には記載済)
$ echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# 必要なツールがインストールできていることを確認する
$ rbenv -v
$ ruby-build --version

# インストール可能なバージョンを確認する
$ rbenv install -l

# 適当なバージョンを選択しインストールする (時間がかかる)
$ ruby install 2.7.6
# インストールに失敗する場合は次のようにしてみる
$ brew reinstall openssl@1.1
$ export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml) --with-zlib-dir=$(brew --prefix zlib)"

# インストール済の Ruby 一覧を確認し再読み込みする
$ rbenv versions
$ rbenv rehash

# インストールしたバージョンを指定して利用可能にする
$ rbenv global 2.7.6

# バージョンを確認する
$ ruby -v
```

### tfenv (Terraform)

```bash
# インストール可能なバージョンを確認する
$ tfenv list-remote

# 適当なバージョンを選択しインストールする
$ tfenv install 1.2.4
# インストールしたバージョンを指定して利用可能にする
$ tfenv use 1.2.4

# バージョンを確認する
$ terraform -v
```


## Git より取得する

```bash
# 各種リポジトリを取得する
$ mkdir -p ~/Documents/Dev/GitHub/
$ mkdir -p ~/Documents/Dev/BitBucket/
$ mkdir -p ~/Documents/Dev/Sandboxes/

# 必要なモノだけ ~/.ssh/ に配置する
$ mkdir -p ~/.ssh/
```
