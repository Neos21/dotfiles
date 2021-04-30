# Windows リカバリ手順


## Windows 設定

- PC 設定
- コントロールパネル
    - キーボード → 「速度」タブでカスタムする
    - システムの詳細設定 → 「詳細設定」タブ → 「パフォーマンス」欄の「設定」ボタン → 「視覚効果」タブでカスタムする


## 手動インストール

- Google 日本語入力
    - 次の URL よりインストーラをダウンロードしインストールする : <https://www.google.co.jp/ime/>
- Google Drive バックアップと同期
    - 次の URL よりインストーラをダウンロードしインストールする : <https://www.google.com/intl/ja_ALL/drive/download/backup-and-sync/>
- [Git SDK](https://github.com/git-for-windows/build-extra/releases)
    - 次の URL よりインストーラをダウンロードしインストールする : <https://github.com/git-for-windows/build-extra/releases/tag/git-sdk-1.0.8>
- Glary Utilities
    - 次の URL よりインストーラをダウンロードしインストールする : <https://www.glarysoft.com/glary-utilities/>
- Dropbox
    - 次の URL よりインストーラをダウンロードしインストールする : <https://www.dropbox.com/ja/install>
- Lhaplus v1.74
    - 次の URL よりインストーラをダウンロードしインストールする : <https://forest.watch.impress.co.jp/library/software/lhaplus/>
- [Docker For Windows](https://docs.docker.com/docker-for-windows/install/)
- Office
- Adobe Creative Cloud (Photoshop・Illustrator・Premiere Pro・After Effects・Audition・Lightroom)


## バックアップディレクトリから復元

- [Windows10 フォントが汚いので一発変更!](https://forest.watch.impress.co.jp/library/software/win10fontchg/)
    - メイリオにする
- [Magnet Window](https://www.vector.co.jp/soft/dl/winnt/util/se175660.html)
- [T-Clock Redux](https://github.com/White-Tiger/T-Clock/releases)
- フォント : メイリオ改、[Noto Sans CJK JP](https://www.google.com/get/noto/#sans-jpan)、[Noto Sans Mono CJK JP](https://www.google.com/get/noto/#serif-jpan)
- WSL : __[WSL.md](./WSL.md)__ を参照


## Dotfiles の配置・設定

- Git SDK および WSL で初回実行する
- 初回は以下を実行して改行コードの自動変換をしないようにしておく
    - `$ git config --global core.autocrlf false`
    - もしくは次の URL より `.gitconfig` を取得しておく : <https://raw.githubusercontent.com/Neos21/dotfiles/master/.gitconfig>
- [dotfiles](https://github.com/Neos21/dotfiles) リポジトリをダウンロードする
    - Git SDK : `$ mkdir -p /c/Neos21/Dev/GitHub/ && cd $_`
    - WSL : `$ mkdir -p /home/neo/Documents/Dev/GitHub/ && cd $_`
    - `$ git clone https://Neos21@github.com/Neos21/dotfiles.git && cd $_`
- Dotfiles をユーザホーム配下にコピーする
    - `$ ./sync-dotfiles.sh`
- `Recovery/` 配下の `.reg` を実行していく


## Chocolatey

### Chocolatey のインストール

- `Win + X` → `A` と押下し、管理者権限で PowerShell を起動する
- 以下のコマンドで Chocolatey をインストールする
    - 参考 : <https://chocolatey.org/install>

```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

### Chocolatey ツールのインストール

- `Win + X` → `A` と押下し、管理者権限で PowerShell を起動する
- 以下のコマンドで Chocolatey を使用して各種ツールをインストールする

```ps1
# どの環境でも必須と思われるモノ
choco install -y  googlechrome  firefox      brave          notepadplusplus  vscode
choco install -y  autohotkey    mactype      classic-shell  winaero-tweaker  chocolateygui
choco install -y  7zip          foxitreader  evernote       shexview         nodist
choco install -y  mpc-hc        vlc          mp3gain-gui    handbrake        avastfreeantivirus

# 必要に応じて入れれば良いモノ
# jdk8 python2 python ruby ruby2.devkit
# virtualbox vagrant sqlite sqlitebrowser sysinternals slack tor-browser
# rbtray kubernetes-cli gradle terraform

# 以下はインストールしない
# - インストールに失敗したことがあるので使わない or 別途インストールする : glaryutilities-free google-backup-and-sync dropbox
# - Microstore Store からインストールする : microsoft-edge icloud itunes microsoft-windows-terminal
# - もう使用しない : qttabbar thunderbird flashplayerplugin adobeshockwaveplayer adobereader k-litecodecpackfull vcxsrv
# - バージョンが古いので使わない : googledrive googlejapaneseinput lhaplus
```

### インストール後の設定

- Google Chrome
    - Google アカウントにログインし拡張機能などを同期する
    - フォント、Stylish、AdBlock などを設定する
- Firefox
    - Sync アカウントにログインし拡張機能などを同期する
    - フォント、Stylish、AdBlock などを設定する
- Brave
    - Brave Sync アカウントにログインし拡張機能などを同期する
    - フォント、Stylish、AdBlock などを設定する
- Chromium Edge
    - Microsoft アカウントにログインし拡張機能などを同期する
    - フォント、Stylish、AdBlock などを設定する
- Lhaplus
    - デスクトップに圧縮・解凍アイコンを生成しコンテキストメニューを設定する
- NotePad++
    - Markdown にシンタックスハイライトが付いてしまった場合は削除する
- VSCode
    - Setting Sync をインストールし、同期設定をダウンロードする (GitHub Token と Gist ID が必要)
- Google Drive バックアップと同期
    - `C:\Neos21\Clouds\Google Drive\` で同期する
- Dropbox
    - `C:\Neos21\Clouds\Dropbox\` で同期する
- Evernote
    - アカウントにログインする
- Magnet Window
    - スタートアップに追加する
- T-Clock Redux
    - フォントを「Noto Sans Mono CJK JP」にする
    - 書式を `yyyy-mm-dd (ddd) hh:nn:ss` にする
    - スタートアップに追加する (アプリ内からスタートアップ起動を選択すると「スタートアップ」ディレクトリにショートカットが追加される)
- Avast Free Anti Virus
    - 「パスワードマネージャ」コンポーネントをインストールしてログインしブラウザに連携させる

### `Recovery/` を参照する

- MacType
    - `NeosMacType.ini` をインポートし設定する
    - ツール側の設定でスタートアップ起動するようにする
- Git SDK
    - 一度起動しておく
    - `C:\git-sdk-64\etc\` 配下の `profile` を退避し、軽量版の `profile` を配置する
    - `C:\git-sdk-64.git\` を削除しておく
- iTunes
    - Shift を押しながらアプリを起動し、`Music` ディレクトリの `iTunes Library.itl` を選択する。こうしないと iTunes フォルダを変更できない
    - Apple ID アカウントにログインし、イコライザを設定する
- MPC-HC
    - `C:\Program Files\MPC-HC\` に `toolbar.bmp` を配置し、コレをツールバーに使用させる
- Windows Terminal
    - 設定ファイルをコピーする

### `Tools/` を参照する

- Classic Shell
    - 設定ファイルをインポートし `Se7en Orb.png` を参照する
    - `C:\Program Files\Classic Shell\` に `ja-JP.dll` を配置する
- AutoHotKey
    - `NeosAutoHotKey.ahk` をスタートアップに追加する
