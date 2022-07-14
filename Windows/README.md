# Windows リカバリ手順


## フォント

- メイリオ改、[Noto Sans CJK JP、Noto Sans Mono CJK JP、Noto Serif CJK JP](https://github.com/googlefonts/noto-cjk/tree/main/Sans) をインストールする


## OS 設定

- PC 設定
- コントロールパネル
    - キーボード → 「速度」タブでカスタムする
    - システムの詳細設定 → 「詳細設定」タブ → 「パフォーマンス」欄の「設定」ボタン → 「視覚効果」タブでカスタムする
- WSL : __[WSL.md](./WSL.md)__ を参照
- `Recovery/` 配下の `.reg` を実行していく


## Git SDK・Dotfiles のインストール

- [Git SDK](https://github.com/git-for-windows/build-extra/releases)
    - 一度起動しておく
    - `C:\git-sdk-64\etc\` 配下の `profile` を退避し、軽量版の `profile` を配置する
    - `C:\git-sdk-64.git\` を削除しておく

### Dotfiles の配置・設定

Git SDK および WSL で初回実行する。

- 初回は以下を実行して改行コードの自動変換をしないようにしておく
    - `$ git config --global core.autocrlf false`
    - もしくは次の URL より `.gitconfig` を取得しておく : <https://raw.githubusercontent.com/Neos21/dotfiles/master/.gitconfig>
- [dotfiles](https://github.com/Neos21/dotfiles) リポジトリをダウンロードする
    - Git SDK : `$ mkdir -p /c/Neos21/Dev/GitHub/ && cd $_`
    - WSL : `$ mkdir -p /home/neo/Documents/Dev/GitHub/ && cd $_`
    - `$ git clone https://Neos21@github.com/Neos21/dotfiles.git && cd $_`
- Dotfiles をユーザホーム配下にコピーする
    - `$ ./sync-dotfiles.sh`


## Chocolatey

`Win + X` → `A` と押下して管理者権限で PowerShell を起動し、[Chocolatey](https://chocolatey.org/install) をインストールする。

```ps1
# Chocolatey 本体をインストールする
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# どの環境でも必須と思われるモノ
choco install -y  googlechrome  brave          firefox  notepadplusplus  vscode
choco install -y  autohotkey    classic-shell  rbtray   winaero-tweaker
choco install -y  7zip          nodist         mpc-hc   vlc              foxitreader

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
    - Stylus、Markdown Preview Plus の設定をインポートする
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
    - Markdown にシンタックスハイライトが付いてしまった場合は削除する
- VSCode
    - Settings Sync 拡張機能をインストールし設定同期する
- AutoHotKey
    - `Tools/` を参照・`NeosAutoHotKey.ahk` をスタートアップに追加する
- Classic Shell
    - 設定ファイルをインポートし `Se7en Orb.png` を参照する
    - `C:\Program Files\Classic Shell\` に `ja-JP.dll` を配置する
- RBTray
    - スタートアップに追加する
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
    - ツール側の設定でスタートアップ起動するようにする
- Evernote
    - アカウントにログインする


## 個別にインストールする

- [Windows10 フォントが汚いので一発変更!](https://forest.watch.impress.co.jp/library/software/win10fontchg/)
    - メイリオにする
- [Google 日本語入力](https://www.google.co.jp/ime/)
    - 辞書をインポートする
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
- Adobe Creative Cloud (Photoshop・Illustrator・Premiere Pro・After Effects・Audition・Lightroom)

### 必要に応じてインストールする

- [Dropbox](https://www.dropbox.com/ja/install)
    - `C:\Neos21\Clouds\Dropbox\` で同期する


## Microsoft Store からインストールする

- Windows Terminal
    - 設定ファイルをコピーする

### 必要に応じてインストールする

- iTunes
    - Shift キーを押しながらアプリを起動し、`Music` ディレクトリの `iTunes Library.itl` を選択する。こうしないと iTunes フォルダを変更できない
    - Apple ID アカウントにログインし、イコライザを設定する
