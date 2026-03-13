# Windows リカバリ手順


## フォント

以下をインストールする。

- [メイリオ改](http://141.147.164.133/fonts/)
- [Noto Sans CJK JP・Noto Sans Mono CJK JP・Noto Serif CJK JP](https://github.com/googlefonts/noto-cjk/tree/main/Sans)
- [M Plus 1 Code](https://fonts.google.com/specimen/M+PLUS+1+Code)
- お好みで
    - [源柔ゴシック](http://jikasei.me/font/genjyuu/)
    - [Rounded Mgen+](http://jikasei.me/font/rounded-mgenplus/)


## OS 設定

- PC 設定
- コントロールパネル
    - キーボード → 「速度」タブでカスタムする
    - システムの詳細設定 → 「詳細設定」タブ → 「パフォーマンス」欄の「設定」ボタン → 「視覚効果」タブでカスタムする
- OneDrive をアンインストールする
- WSL : **[WSL.md](./WSL.md)** を参照


## Git SDK・Dotfiles のインストール

- [Git SDK](https://github.com/git-for-windows/build-extra/releases) を `C:\git-sdk-64\` にインストールする
    - 一度起動しておく
    - `C:\git-sdk-64\etc\` 配下の `profile` を退避し、`Recovery/` 配下にある軽量版の `profile` を配置する
    - `C:\git-sdk-64\.git\` を削除しておく

```bash
# 初回は以下を実行して改行コードの自動変換をしないようにしておく
# もしくは次の URL より `.gitconfig` だけ導入しておく : <https://raw.githubusercontent.com/Neos21/dotfiles/master/.gitconfig>
$ git config --global core.autocrlf false

# 必要なディレクトリを作成しておく
$ mkdir -p /c/Neos21/0/ '/c/Neos21/Clouds/Google Drive/' /c/Neos21/Tools/ /c/Neos21/Dev/GitHub/ /c/Neos21/Dev/BitBucket/ /c/Neos21/Dev/Sandboxes/

# Dotfiles リポジトリを取得する
$ cd /c/Neos21/Dev/GitHub/
$ git clone https://Neos21@github.com/Neos21/dotfiles.git
$ cd ./dotfiles/
# Dotfiles をユーザホーム配下にコピーする
$ ./sync-dotfiles.bash

# Private Backups リポジトリを取得する : 必要な資材を取り出す
$ cd /c/Neos21/Dev/BitBucket/
$ git clone https://Neos21@bitbucket.org/Neos21/private-backups.git

# その他 Git より取得する
# 必要なモノだけ ~/.ssh/ に配置する
$ mkdir -p "${HOME}/.ssh/"
```


## Chocolatey

`Win + X` → `A` と押下して管理者権限で PowerShell を起動し、[Chocolatey](https://chocolatey.org/install) をインストールする。

```ps1
# Chocolatey 本体をインストールする
PS> Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# どの環境でも必須と思われるモノ
PS> choco install -y 7zip autohotkey bitcomet chocolateygui crystaldiskinfo.portable ffftp.portable foxitreader mp3gain-gui vlc

# Windows10 のみ・Windows11 では Open-Shell を入れること
PS> choco install -y classic-shell
```

- AutoHotKey
    - `Tools/` を参照・`NeosAutoHotKey.ahk` をスタートアップに追加する
- BitComet
- Chocolatey GUI
- CrystalDiskInfo
- FFFTP
- Foxit Reader
- MP3Gain
    - 音量 : 99.0 dB
- Classic Shell
    - `Recovery/` 配下の設定ファイルをインポートし PNG 画像を参照する


## `Tools/` にポータブル版を置く

別 PC から持ってくればいい。

- [Magnet Window v5.80.02](https://www.vector.co.jp/soft/dl/winnt/util/se175660.html)
    - スタートアップに追加する
- [RBTray v4.3](https://forest.watch.impress.co.jp/library/software/rbtray/)
    - スタートアップに追加する


## 個別にインストールする

### 早めに入れる

- [Google 日本語入力](https://www.google.co.jp/ime/)
    - 辞書をインポートする (別リポジトリ参照)
    - キー操作を ATOK にする
- [Lhaplus v1.74](https://forest.watch.impress.co.jp/library/software/lhaplus/)
    - デスクトップに圧縮・解凍アイコンを生成しコンテキストメニューを設定する
- [Brave](https://brave.com/ja/download/)
    - 同期コードで設定同期する
    - Advanced Font Settings で Noto Sans CJK JP 系を選択する
    - Stylus 等の設定をインポートする (別リポジトリ参照)
- [Chrome](https://www.google.com/intl/ja_jp/chrome/)
    - Gmail アカウントで設定同期する
    - Advanced Font Settings で Noto Sans CJK JP 系を選択する
    - Stylus 等の設定をインポートする (別リポジトリ参照)
    - Google Chrome Remote Desktop Host が動作するようにしておく
- Edge (プリインストール)
    - Microsoft アカウントで設定同期する
    - Advanced Font Settings で Noto Sans CJK JP 系を選択する

### 順番に入れていく

- [Amazon Photos](https://www.amazon.co.jp/b?ie=UTF8&node=5262648051)
- [ASIO4ALL 2](https://ja.asio4all.org/)
    - v2.17
- [Docker](https://docs.docker.com/docker-for-windows/install/)
    - WSL のセットアップ完了後にインストールする
    - DockerHub アカウントでログインする
- [FFmpeg](https://www.gyan.dev/ffmpeg/builds/)
    - ビルド済みのモノを利用する
- [Glary Utilities](https://www.glarysoft.com/glary-utilities/)
- [Google Drive](https://support.google.com/a/users/answer/13022292?hl=ja)
    - 同期設定する
    - 設定 → Google Drive 「ファイルをミラーリングする」を選択する
- [HandBrake](https://handbrake.fr/downloads.php)
- [ImageMagick v7.1.2 Q16-HDRI](https://imagemagick.org/script/download.php#gsc.tab=0)
- [Java 8](https://www.java.com/ja/download/)
    - Java v1.8.0_471-b09 以降あたり
- [NotePad++](https://notepad-plus-plus.org/)
- [OBS Studio](https://obsproject.com/ja/download)
- [Open-Shell](https://github.com/Open-Shell/Open-Shell-Menu/releases)
    - Windows11 のみ
    - [日本語化パッチ](https://www.japan-secure.com/entry/blog-entry-264.html)
    - `Recovery/` 配下の画像を参照して設定する
    - ファイルダイアログが開かず XML 設定ファイルが保存・参照できないので、`.reg` で代用する (別リポジトリ参照)
- [Tartube](https://tartube.sourceforge.io/)
- [VSCode](https://code.visualstudio.com/)
    - GitHub アカウントでログインして設定同期する
- [Winaero Tweaker](https://winaero.com/)
- [MPC-HC (clsid2 Fork 版)](https://github.com/clsid2/mpc-hc/releases)
- [nvm For Windows](https://github.com/coreybutler/nvm-windows/releases)
    ```bash
    # Git SDK で良い
    $ nvm list available
    $ nvm install v24.14.0
    $ nvm use v24.14.0
    ```
- [PowerToys](https://github.com/microsoft/PowerToys/releases)
- その他
    - Adobe Creative Cloud
        - Photoshop
        - Lightroom Classic
        - Illustrator
        - Premiere Pro
        - After Effects
    - Office
    - Cubase Artist 13
- その他リカバリ用インストーラを持っているモノなどを順に入れていく
    - Daemon Tools Lite
    - SyncToy 2.1


## Microsoft Store からインストールする

- 画像・動画拡張機能系 (大半は自動インストールされる)
    - AV1 ビデオ拡張機能
    - AVC Encoder Video Extension
    - HEIF 画像表示オプション
    - MPEG-2 ビデオ拡張機能
    - Raw 画像拡張機能
    - VP9 ビデオ拡張機能
    - Web メディア拡張機能
    - WebP 画像表示オプション
    - デバイス製造元からの HEVC ビデオ拡張機能
- EarTrumpet
- iTunes
    - Shift キーを押しながらアプリを起動し、`Music/` ディレクトリの `iTunes Library.itl` を選択する。こうしないと iTunes フォルダを変更できない
    - Apple ID アカウントにログインする
    - イコライザを設定する (`Recovery/` 配下の画像参照)
- Twinkle Tray
- Ubuntu
    - WSL
- Windows Subsystem for Linux
    - WSL
- Windows Terminal
    - `Recovery/` 配下の設定ファイルをコピーする
- 映画 & テレビ
