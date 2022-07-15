# Windows リカバリ手順


## フォント

- メイリオ改、[Noto Sans CJK JP、Noto Sans Mono CJK JP、Noto Serif CJK JP](https://github.com/googlefonts/noto-cjk/tree/main/Sans) をインストールする


## OS 設定

- PC 設定
- コントロールパネル
    - キーボード → 「速度」タブでカスタムする
    - システムの詳細設定 → 「詳細設定」タブ → 「パフォーマンス」欄の「設定」ボタン → 「視覚効果」タブでカスタムする
- `Recovery/` 配下の `.reg` を実行していく
- WSL : __[WSL.md](./WSL.md)__ を参照


## Git SDK・Dotfiles のインストール

- [Git SDK](https://github.com/git-for-windows/build-extra/releases) を `C:\git-sdk-64\` にインストールする
    - 一度起動しておく
    - `C:\git-sdk-64\etc\` 配下の `profile` を退避し、`Recovery/` 配下にある軽量版の `profile` を配置する
    - `C:\git-sdk-64.git\` を削除しておく

```bash
# 初回は以下を実行して改行コードの自動変換をしないようにしておく
# もしくは次の URL より `.gitconfig` だけ導入しておく : <https://raw.githubusercontent.com/Neos21/dotfiles/master/.gitconfig>
$ git config --global core.autocrlf false

# 必要なディレクトリを作成しておく
$ mkdir -p /c/Neos21/0/
$ mkdir -p /c/Neos21/Clouds/
$ mkdir -p /c/Neos21/Home/

# 各種リポジトリを取得する
$ mkdir -p /c/Neos21/Dev/GitHub/
$ mkdir -p /c/Neos21/Dev/BitBucket/
$ mkdir -p /c/Neos21/Dev/Sandboxes/

# Dotfiles リポジトリを取得する
$ cd /c/Neos21/Dev/GitHub/
$ git clone https://Neos21@github.com/Neos21/dotfiles.git
$ cd ./dotfiles/
# Dotfiles をユーザホーム配下にコピーする
$ ./sync-dotfiles.bash
```


## Chocolatey

`Win + X` → `A` と押下して管理者権限で PowerShell を起動し、[Chocolatey](https://chocolatey.org/install) をインストールする。

```ps1
# Chocolatey 本体をインストールする
PS> Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# どの環境でも必須と思われるモノ
PS> choco install -y  googlechrome  brave          firefox  notepadplusplus  vscode
PS> choco install -y  autohotkey    classic-shell  rbtray   winaero-tweaker
PS> choco install -y  7zip          nodist         mpc-hc   vlc              foxitreader

# 必要に応じて入れるモノ
# mactype evernote mp3gain-gui handbrake shexview sysinternals
# kubernetes-cli terraform
# jdk8 python2 python ruby ruby2.devkit gradle
# virtualbox vagrant sqlite sqlitebrowser
# slack tor-browser chocolateygui

# 以下はインストールしない
# - インストールに失敗したことがあるので使わない or 別途インストールする : glaryutilities-free google-backup-and-sync dropbox
# - Microstore Store からインストールする : microsoft-edge icloud itunes microsoft-windows-terminal
# - バージョンが古いので使わない : googledrive googlejapaneseinput lhaplus
# - もう使用しない : k-litecodecpackfull vcxsrv
```

- Chrome
    - Gmail アカウントで設定同期する
    - Advanced Font Settings で Noto Sans 系を選択する
    - Stylus、Markdown Preview Plus の設定をインポートする (別リポジトリ参照)
- Brave
    - 同期コードで設定同期する
    - 主な拡張機能の設定は Chrome と同様にする
- Edge (プリインストール)
    - Microsoft アカウントで設定同期する
    - 主な拡張機能の設定は Chrome と同様にする
- Firefox
    - Firefox アカウントで設定同期する
    - 主な拡張機能の設定は Chrome と同様にする
- NotePad++
    - 設定ファイルを配置する (別リポジトリ参照)
    - Markdown にシンタックスハイライトが付いてしまった場合は削除する
- VSCode
    - Settings Sync 拡張機能をインストールし設定同期する
- AutoHotKey
    - `Tools/` を参照・`NeosAutoHotKey.ahk` をスタートアップに追加する
- Classic Shell
    - `Recovery/` 配下の設定ファイルをインポートし `Se7en Orb.png` を参照する
- RBTray
    - スタートアップに追加する
- Winaero Tweaker
    - よしなに
- Nodist
    ```bash
    $ nodist dist
    $ nodist add v14.16.1
    $ nodist global v14.16.1
    $ nodist npm match
    ```
- MPC-HC
    - `C:\Program Files\MPC-HC\` に `Recovery/` 配下の `toolbar.bmp` を配置し、コレをツールバーに使用させる

### 必要に応じてインストールしたモノ

- MacType
    - `Recovery/` を参照・`NeosMacType.ini` をインポートし設定する
- Evernote
    - アカウントにログインする


## 個別にインストールする

- [Windows10 フォントが汚いので一発変更!](https://forest.watch.impress.co.jp/library/software/win10fontchg/)
    - メイリオにする
- [Google 日本語入力](https://www.google.co.jp/ime/)
    - 辞書をインポートする
    - キー操作を ATOK にする
- [Google Backup And Sync](https://www.google.com/intl/ja_ALL/drive/download/)
    - `C:\Neos21\Clouds\Google Drive\` で同期する
- [Magnet Window](https://www.vector.co.jp/soft/dl/winnt/util/se175660.html)
    - スタートアップに追加する
- [Glary Utilities](https://www.glarysoft.com/glary-utilities/)
- [Lhaplus v1.74](https://forest.watch.impress.co.jp/library/software/lhaplus/)
    - デスクトップに圧縮・解凍アイコンを生成しコンテキストメニューを設定する
- [T-Clock Redux](https://github.com/White-Tiger/T-Clock/releases)
    - フォントを「Noto Sans Mono CJK JP」にする
    - 書式を `yyyy-mm-dd (ddd) HH:nn:ss` にする
    - スタートアップに追加する (アプリ内からスタートアップ起動を選択すると「スタートアップ」ディレクトリにショートカットが追加される)
- [Docker](https://docs.docker.com/docker-for-windows/install/)
    - WSL のセットアップ完了後にインストールする
    - DockerHub アカウントでログインする
- Office

### 必要に応じてインストールする

- [Dropbox](https://www.dropbox.com/ja/install)
    - `C:\Neos21\Clouds\Dropbox\` で同期する
- Adobe Creative Cloud (Photoshop・Illustrator・Premiere Pro・After Effects・Audition・Lightroom)


## Microsoft Store からインストールする

- Windows Terminal
    - 設定ファイルをコピーする

### 必要に応じてインストールする

- iTunes
    - Shift キーを押しながらアプリを起動し、`Music` ディレクトリの `iTunes Library.itl` を選択する。こうしないと iTunes フォルダを変更できない
    - Apple ID アカウントにログインする
    - イコライザを設定する


## Git より取得する

```bash
# Git SDK にて

# 必要なモノだけ ~/.ssh/ に配置する
$ mkdir -p /c/Users/Neo/.ssh/
```
