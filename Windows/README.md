# Windows リカバリ手順


## Windows 設定

- PC 設定
- コントロールパネル
    - キーボード → 「速度」タブでカスタム
    - システムの詳細設定 → 「詳細設定」タブ → 「パフォーマンス」欄の「設定」ボタン → 「視覚効果」タブでカスタム


## ホームディレクトリ整備

- `C:\Neos21\`
    - `0\` : 一時データ置き場
    - `Home\`
        - `About\` : 任意データを格納する場所
        - `Data\` : Google Drive、Dropbox、Evernote の同期ディレクトリを配置する
        - `Recovery\` : リカバリ関連データ
    - `Dev\`
        - `GitHub\`
        - `SandBoxes\`
        - `【PC 名】\` : その PC に何かインストールするなどして作業した記録の置き場
    - `Tools\`


## フォントのインストール

- メイリオ改をダウンロード・インストールする
    - MeiryoKe Gothic : <https://github.com/Neos21/japanese-monospaced-fonts/raw/master/meiryo-ke-gothic/MeiryoKeGothic.ttf>
        - <https://unpkg.com/@japanese-monospaced-fonts/meiryo-ke-gothic@1.0.0/MeiryoKeGothic.ttf>
    - MeiryoKe Gothic Bold : <https://github.com/Neos21/japanese-monospaced-fonts/raw/master/meiryo-ke-gothic/MeiryoKeGothic-Bold.ttf>
        - <https://unpkg.com/@japanese-monospaced-fonts/meiryo-ke-gothic@1.0.0/MeiryoKeGothic-Bold.ttf>
    - MeiryoKe Console : <https://github.com/Neos21/japanese-monospaced-fonts/raw/master/meiryo-ke-console/MeiryoKeConsole.ttf>
        - <https://unpkg.com/@japanese-monospaced-fonts/meiryo-ke-console@1.0.0/MeiryoKeConsole.ttf>


## Dotfiles の配置・設定

- [dotfiles](https://github.com/Neos21/dotfiles) リポジトリをダウンロードする
    - `$ git clone https://github.com/Neos21/dotfiles.git`
    - Zip : <https://github.com/Neos21/dotfiles/archive/master.zip>
- Dotfiles をユーザホーム (`C:\Users\Neo\`) に配置する
- `Enable Photo Viewer.reg`、`Remove Explorer Menu.reg`、`Caps Lock To Ctrl.reg` を実行する
    - CapsLock は Ctrl キーの動作をするようになる
- コマンドプロンプトのエイリアス設定 : `Win + R` から `regedit` を起動し、`HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\` キーに移動する。文字列 `AutoRun` を作成し、値に `doskey /macrofile=%USERPROFILE%\Macros.txt` と設定する


## 手動インストール

- Google 日本語入力
    - 次の URL よりインストーラをダウンロードしインストールする : <https://www.google.co.jp/ime/>
    - 各種設定を変更
    - 辞書登録 : エクスポートしておいたユーザ辞書をインポートする
- [QTTabBar](http://qttabbar-ja.wikidot.com/)
    - 次の URL よりインストーラをダウンロードしインストールする : <http://qttabbar-ja.wdfiles.com/local--files/qttabbar/QTTabBar_1038.zip>
    - エクスポートしておいた設定ファイルをインポートする
- Glary Utilities 5
    - 次の URL よりインストーラをダウンロードしインストールする : <https://www.glarysoft.com/glary-utilities/>
- Git SDK
    - 次の URL よりインストーラをダウンロードする : <https://github.com/git-for-windows/build-extra/releases>
    - `C:\git-sdk-64\` にインストールし、1度起動する
    - `C:\git-sdk-64\.git\` ディレクトリを削除する
    - `C:\git-sdk-64\etc\profile` ファイルを次のファイルの内容に変更する
        - <https://raw.githubusercontent.com/Neos21/optimize-git-for-windows/master/Git%20SDK%20v1.0.7/profile%E3%80%80v2%20%E3%82%B3%E3%83%A1%E3%83%B3%E3%83%88%E3%82%A2%E3%82%A6%E3%83%88%E3%82%92%E9%99%A4%E5%8E%BB%E3%83%BB%E5%AE%8C%E6%88%90%E7%89%88>
- [Magnet Window](https://www.vector.co.jp/soft/dl/winnt/util/se175660.html)
- Office
- Adobe Creative Cloud (Photoshop・Illustrator・Premiere Pro・After Effects・Audition・Lightroom)


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
choco install googlechrome firefox thunderbird tor-browser -y
choco install google-backup-and-sync -y
choco install lhaplus 7zip -y
choco install notepadplusplus vscode -y
choco install git cmder jq -y
choco install jdk8 python2 python ruby ruby2.devkit kubernetes-cli -y
choco install autohotkey mactype avastfreeantivirus chocolateygui -y
choco install flashplayerplugin adobeshockwaveplayer adobereader foxitreader -y
choco install mpc-hc vlc k-litecodecpackfull -y
choco install vcxsrv -y

# Galleria のみで良さそうなモノ
choco install itunes dropbox evernote mp3gain-gui handbrake -y

# 必要に応じて入れれば良いモノ
choco install virtualbox sqlite sqlitebrowser sysinternals slack -y

# 以下はインストールしない
# - インストールに失敗したことがあるので使わない : glaryutilities-free qttabbar
# - 古いので使わない : googledrive googlejapaneseinput
# - もう使用しない : icloud
```

### インストール後の設定

- Google Chrome
    - Google アカウントにログインし拡張機能などを同期する
    - フォント、Stylish、AdBlock などを設定する
- Firefox
    - Sync アカウントにログインし拡張機能などを同期する
    - フォント、Stylish、AdBlock などを設定する
- Thunderbird
    - 各メールアカウントを設定する
- Tor Browser
    - 正常に起動するか確認する
- Google Backup And Sync
    - Google アカウントにログインし設定する : `C:\Neos21\Home\Data\Google Drive\`
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
    - Cmder と Excel のプロセスは除外する
- Avast Free Anti Virus
    - 「パスワードマネージャ」以外のコンポーネントをアンインストールする
    - パスワードマネージャにログインし Chrome と Firefox に連携させる
- MPC-HC
    - `C:\Neos21\Recovery\MPC-HC\` に `toolbar.bmp` を配置し、コレをツールバーに使用させる
- iTunes
    - Apple ID アカウントにログインし、イコライザを設定する
- Dropbox
    - アカウントにログインし設定する : `C:\Neos21\Home\Data\Dropbox\`
- Evernote
    - アカウントにログインし設定する : `C:\Neos21\Home\Data\Evernote\`


## WSL の設定

[WSL.md](./WSL.md) を参照。
