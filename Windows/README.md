# Windows リカバリ手順


## Windows 設定

- PC 設定
- コントロールパネル
    - キーボード → 「速度」タブでカスタム
    - システムの詳細設定 → 「詳細設定」タブ → 「パフォーマンス」欄の「設定」ボタン → 「視覚効果」タブでカスタム


## 手動インストール

- Google 日本語入力
    - 次の URL よりインストーラをダウンロードしインストールする : <https://www.google.co.jp/ime/>
    - 各種設定を変更
    - 辞書登録 : エクスポートしておいたユーザ辞書をインポートする
- Google Drive バックアップと同期
    - 次の URL よりインストーラをダウンロードしインストールする : <https://www.google.com/intl/ja_ALL/drive/download/backup-and-sync/>
    - `C:\Neos21\Home\Data\Google Drive\` で同期する
- Git SDK
    - 次の URL よりインストーラをダウンロードする : <https://github.com/git-for-windows/build-extra/releases>
    - `C:\git-sdk-64\` にインストールし、1度起動する
    - `C:\git-sdk-64\.git\` ディレクトリを削除する
    - `C:\git-sdk-64\etc\profile` ファイルを次のファイルの内容に変更する
        - <https://raw.githubusercontent.com/Neos21/optimize-git-for-windows/master/Git%20SDK%20v1.0.7/profile%E3%80%80v2%20%E3%82%B3%E3%83%A1%E3%83%B3%E3%83%88%E3%82%A2%E3%82%A6%E3%83%88%E3%82%92%E9%99%A4%E5%8E%BB%E3%83%BB%E5%AE%8C%E6%88%90%E7%89%88>
- [Classic Shell](http://www.classicshell.net/)
    - 公式サイトからインストーラと日本語化 DLL をダウンロードする
    - 本体インストール後、日本語化 DLL を配置し、設定ファイルをインポートする
- [Magnet Window](https://www.vector.co.jp/soft/dl/winnt/util/se175660.html)
    - インストール後、設定ファイルをコピーする
- [QTTabBar](http://qttabbar-ja.wikidot.com/)
    - 次の URL よりインストーラをダウンロードしインストールする : <http://qttabbar-ja.wdfiles.com/local--files/qttabbar/QTTabBar_1038.zip>
    - 設定ファイルをインポートする
- Glary Utilities 5
    - 次の URL よりインストーラをダウンロードしインストールする : <https://www.glarysoft.com/glary-utilities/>
- [Windows10 フォントが汚いので一発変更!](https://forest.watch.impress.co.jp/library/software/win10fontchg/)
- [ShellExView 1.40](https://shellexview.soft32.com/old-version/47138/1.40/)
    - 最新版は `$ choco install -y shexview`
- [Universal Watermark Disabler](https://winaero.com/download.php?view.1794)
- Office
- Adobe Creative Cloud (Photoshop・Illustrator・Premiere Pro・After Effects・Audition・Lightroom)
- フォント : メイリオ改、Noto Sans CJK JP、Noto Sans Mono CJK JP
- WSL : [WSL.md](./WSL.md) を参照


## Dotfiles の配置・設定

- 初回は以下を実行して改行コードの自動変換をしないようにしておく
    - `$ git config --global core.autocrlf false`
- [dotfiles](https://github.com/Neos21/dotfiles) リポジトリをダウンロードする
    - `$ git clone https://Neos21@github.com/Neos21/dotfiles.git`
- Dotfiles をユーザホーム配下にコピーする
- `Recovery/` 配下の `Windows.sh` および `.reg` を実行していく


## Chocolatey

### Chocolatey のインストール

- `Win + X` → `A` と押下し、管理者権限で PowerShell を起動する
- 以下のコマンドで Chocolatey をインストールする
    - 参考 : <https://chocolatey.org/docs/installation>

```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

### Chocolatey ツールのインストール

- `Win + X` → `A` と押下し、管理者権限で PowerShell を起動する
- 以下のコマンドで Chocolatey を使用して各種ツールをインストールする

```ps1
# どの環境でも必須と思われるモノ
choco install -y googlechrome firefox brave microsoft-edge
choco install -y lhaplus 7zip
choco install -y notepadplusplus vscode
choco install -y git jq winaero-tweaker
choco install -y autohotkey mactype avastfreeantivirus chocolateygui
choco install -y jdk8 python2 python ruby ruby2.devkit kubernetes-cli nodist
choco install -y flashplayerplugin adobeshockwaveplayer adobereader foxitreader
choco install -y mpc-hc vlc k-litecodecpackfull
choco install -y microsoft-windows-terminal vcxsrv wsltty

# Galleria のみで良さそうなモノ
choco install -y thunderbird itunes evernote mp3gain-gui handbrake

# 必要に応じて入れれば良いモノ
choco install -y rbtray
choco install -y virtualbox sqlite sqlitebrowser sysinternals slack tor-browser

# 以下はインストールしない
# - インストールに失敗したことがあるので使わない : glaryutilities-free qttabbar google-backup-and-sync
# - 古いので使わない : googledrive googlejapaneseinput
# - もう使用しない : icloud dropbox
```

### インストール後の設定

- Google Chrome
    - Google アカウントにログインし拡張機能などを同期する
    - フォント、Stylish、AdBlock などを設定する
- Firefox
    - Sync アカウントにログインし拡張機能などを同期する
    - フォント、Stylish、AdBlock などを設定する
- Brave
    - フォント、Stylish、AdBlock などを設定する
- Chromium Edge
    - Microsoft アカウントにログインし拡張機能などを同期する
    - フォント、Stylish、AdBlock などを設定する
- Lhaplus
    - デスクトップに圧縮・解凍アイコンを生成しコンテキストメニューを設定する
- NotePad++
    - エクスポートしておいた設定ファイルを取り込む
    - Markdown にシンタックスハイライトが付いてしまった場合は削除する
- VSCode
    - Setting Sync をインストールし、同期設定をダウンロードする (GitHub Token と Gist ID が必要)
- Git
    - `C:\Program Files\Git\etc\profile` ファイルの内容を次の内容に差し替える
        - <https://github.com/Neos21/optimize-git-for-windows/blob/master/Git%20For%20Windows%20v2.20.1/profile%E3%80%80v2%20%E3%82%B3%E3%83%A1%E3%83%B3%E3%83%88%E3%82%A2%E3%82%A6%E3%83%88%E3%82%92%E9%99%A4%E5%8E%BB%E3%83%BB%E5%AE%8C%E6%88%90%E7%89%88>
- AutoHotKey
    - `C:\Neos21\Tools\NeosAutoHotKey\` 配下に `NeosAutoHotKey.ahk` 一式を用意し、スタートアップに追加する
- MacType
    - `NeosMacType.ini` をインポートし設定する
- Avast Free Anti Virus
    - 「パスワードマネージャ」以外のコンポーネントをアンインストールする
    - パスワードマネージャにログインし Chrome と Firefox に連携させる
- MPC-HC
    - `C:\Neos21\Recovery\MPC-HC\` に `toolbar.bmp` を配置し、コレをツールバーに使用させる
- Nodist
    - `$ nodist dist` でインストール可能なバージョンを確認する
    - `$ nodist global 【バージョン】` でインストールしつつグローバルに設定する
    - `$ nodist npm match` で Node.js のバージョンに合わせた npm を設定する
- Windows Terminal
    - 設定ファイルをコピーする
- WSL TTY
    - `.minttyrc` を `%APPDATA\wsltty\config` (`C:\Users\Neo\AppData\Roaming\wsltty\config`) にコピーする
- Thunderbird
    - 各メールアカウントを設定する
- iTunes
    - Apple ID アカウントにログインし、イコライザを設定する
- Evernote
    - アカウントにログインし設定する : `C:\Neos21\Home\Data\Evernote\`
