# Linux (Ubuntu) リカバリ手順


## 日本語入力環境

- Ubuntu ソフトウェア : Fcitx・Fcitx 設定
- `$ sudo apt install -y fcitx-mozc`
- 再起動する
- 入力メソッド `im-config` で Fcitx を選択する
- 再起動する
- Fcitx 設定で「英語 (US)」と「Mozc」を選択、Alt で「入力メソッドをオンに / オフに」設定する
- 設定 → 地域と言語 → 入力ソース も念のため「英語 (US)」→「mozc-jp」にしておく


## その他のキー設定

- キーリピートの調整
    - 設定 → ユニバーサルアクセス → リピートキー
    - 時間を 250ms くらい、速度をその目盛りの倍くらいにするとちょうど良い
- 設定 → デバイス → キーボード
    - Switch windows : `Alt+Tab` (デフォルトだとアプリケーション単位で切り替わるのをコレで直せる)
    - Switch windows of an application : `Ctrl+Tab`
    - Restore the keyboard shortcuts : 無効
    - Show all applications : `Print` (PrintScreen キー)
    - Hide window : `Alt+H`
    - ウィンドウのスクリーンショットをクリップボードにコピーする : `Alt+Print`
    - ウィンドウのスクリーンショットをピクチャフォルダーに保存する : 無効
    - スクリーンショットをピクチャフォルダーに保存する : 無効
    - 選択領域のスクリーンショットをピクチャフォルダーに保存する : 無効
- 左 Super キー単独押しで「アクティビティ画面」が開くのを無効化する
    - Ubuntu ソフトウェア : GNOME Tweaks (`gnome-tweaks`)
    - キーボード → アクティビティ画面のショートカット : 右 Super
- CapsLock を Ctrl キーにする
    - GNOME Tweaks → キーボード → 「追加のレイアウトオプション」→ 「Ctrl position」 → 「CapsLock を Ctrl として扱う」


## 環境設定

- 設定 → デバイス → マウスとタッチパッド
    - ナチュラルスクロール : オフ (マウスもタッチパッドも)
- 電源管理
    - 設定 → プライバシー → 画面ロック
        - 自動画面ロック : オフ
    - 設定 → 電源管理 → 自動サスペンド
        - バッテリー作動時 : オン
        - 電源接続時 : オフ
- ワークスペース要らない
    - GNOME Tweaks → ワークスペース → 静的ワークスペース
    - ワークスペース数 : 1
- 体感速度向上 : アニメーションを無効化する
    - `$ gsettings set org.gnome.desktop.interface enable-animations false`
- ホームディレクトリ配下のサブディレクトリを英語表記にする
  ```sh
  # 英語表記のディレクトリを作る (既存ディレクトリをリネームしたりしても良い)
  $ cd ~/
  $ mkdir Desktop Downloads Templates Public Documents Music Pictures Videos
  # 以下のファイルを開いてディレクトリ名を英語表記に書き換える
  $ gedit ~/.config/user-dirs.dirs
  ```


## Ubuntu ソフトウェアからインストールする

- Fcitx
- Fcitx 設定
- Seahorse
- Menu Editor
- GNOME Tweaks
- Files (Nemo)
    - ```sh
      # デフォルトのファイラに置き換える
      $ xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search 
      $ gsettings set org.gnome.desktop.background show-desktop-icons false 
      $ gsettings set org.nemo.desktop show-desktop-icons true
      ```
- Chromium
- Font Manager
- GIMP
- VLC


## テキストエディタ

- 標準搭載の Gedit で十分


## 端末 (ターミナル)

- Xterm スキームをベースにカラーリングを設定する。青色は `#0080ff` あたりがオススメ
- フォントは特に指定しなくても全角文字もちゃんと見えている
- `$ visudo` 時のエディタを Vi にする
    - `$ sudo update-alternatives --set editor /usr/bin/vim.basic`
    - `$ sudo update-alternatives --config editor` で順序指定しても良い


## GNOME Shell 拡張機能

- セットアップ
    - `$ apturl apt:chrome-gnome-shell` → インストール
    - Chrome に GNOME Shell 拡張機能をインストールする
    - `$ sudo apt-get install chrome-gnome-shell`
    - <https://extensions.gnome.org/> にアクセスすると拡張機能の管理ができるようになる
- [Appfolders Management extension](https://extensions.gnome.org/extension/1217/appfolders-manager/)
    - アプリケーション一覧を自由にフォルダ分けする
- [Applications Overview Tooltip](https://extensions.gnome.org/extension/1071/applications-overview-tooltip/)
    - アプリケーション一覧でツールチップによりアプリ名全文と説明文を表示する
- [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
    - Dash を Panel に移行し、Windows のタスクバー風 UI にできる
  - コレにより「アクティビティ」ボタンの非表示化もできる
- [ESC to close overview from applications list](https://extensions.gnome.org/extension/1122/esc-to-close-overview-from-applications-list/)
    - アプリケーション一覧で Esc を押すことで抜けられるようになる
- [More columns in applications view](https://extensions.gnome.org/extension/1305/more-columns-in-applications-view/)
    - アプリケーション一覧の列数を増やせる。10列くらいが良い。反映するには一度拡張機能をオフ → オンにする
- [No Topleft Hot Corner](https://extensions.gnome.org/extension/118/no-topleft-hot-corner/)
    - 左上にカーソルを置いたときアクティビティを開かないようにする
- [NoAnnoyance](https://extensions.gnome.org/extension/1236/noannoyance/)
    - `Window is ready` の通知を非表示にする
- [Panel Date Format](https://extensions.gnome.org/extension/1462/panel-date-format/)
    - パネルの時刻表示の形式を変更できるようにする
    - `$ dconf write /org/gnome/shell/extensions/panel-date-format/format "'%Y-%m-%d (%a) %H:%M:%S'"`
- [Remove Alt+Tab Delay](https://extensions.gnome.org/extension/1403/remove-alttab-delay/)
    - `Alt + Tab` のアイコン表示遅延をなくす
- [Show Applications instead of Overview](https://extensions.gnome.org/extension/1337/show-applications-instead-of-overview/)
    - 「アクティビティ」押下時、Activities Overview の代わりに All Applications を表示する
- [Suspend Button](https://extensions.gnome.org/extension/826/suspend-button/)
    - ステータスメニューに Suspend アイコンを追加する (通常は Alt キー押下によって電源ボタンと切り替えて表示される)
- [Tweaks in System Menu](https://extensions.gnome.org/extension/1653/tweaks-in-system-menu/)
    - ステータスメニューに GNOME Tweaks アイコンを追加する


## Brave

- <https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux>

```sh
$ sudo apt install apt-transport-https curl
$ curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
$ echo 'deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main' | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
$ sudo apt update
$ sudo apt install brave-browser
```


## Chrome

- 公式サイトより追加パッケージをダウンロードできる。Ubuntu ソフトウェアで読み込んでインストールできる。
- キーリング : 空文字で登録可能。「Seahorse」で確認・設定できる


## Chrome Remote Desktop

- 公式サイトよりホストをダウンロード・インストールする。旧アプリ版とは異なる
- `$ touch ~/.chrome-remote-desktop-session` でとりあえず動作するようになる ([参考](https://qiita.com/Boiling_Water/items/75ef825d6c73be6a5370))
- コレだとホストと異なるセッションに接続してしまうので、起動スクリプトを修正する ([参考](https://qiita.com/k_ikasumipowder/items/c173fb92cf12c75b2375))


## VSCode

公式サイトから `.deb` パッケージを落としてインストールできる。


## Node.js : Nodebrew

```sh
$ curl -L git.io/nodebrew | perl - setup

$ vi ~/.bash_profile
  # nodebrew
  export PATH="${HOME}/.nodebrew/current/bin:${PATH}"

$ source ~/.bash_profile

$ nodebrew install 12.16.0
$ nodebrew use 12.16.0
$ node -v
$ npm -v  # → 6.13.4
```
