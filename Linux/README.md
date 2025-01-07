# Linux (Ubuntu) リカバリ手順


## Ubuntu Desktop v24.04.1 LTS をダウンロードする

- [Ubuntuを入手する | Ubuntu | Ubuntu](https://jp.ubuntu.com/download)
    - `ubuntu-24.04.1-desktop-amd64.iso` をダウンロードする
    - 日本語 Remix でなくても日本語環境が用意されている (Noto Sans CJK JP・Noto Sans Mono CJK JP がインストール済)
- [Rufus - 起動可能なUSBドライブを簡単に作成できます](https://rufus.ie/ja/)
    - パーティション `MBR` で全てデフォルトのままで良い
- 有線 LAN を接続して最小構成でインストールすると失敗しにくい



## 日本語入力環境を整える

- Ubuntu Desktop v24.04.1 LTS の場合、デフォルトで ibus-Mozc がインストールされてはいるが、Alt 空打ちでの切替ができないので Fcitx-Mozc をインストールする
- `$ sudo apt install fcitx5-mozc` で Fcitx-Mozc をインストールし `$ im-config -n fcitx5` で切り替えたらログアウト or 再起動する
- 「Fcitx 設定」内より「英語 (US)」と「Mozc」を選択し、Alt で「入力メソッドをオンに / オフに」設定する
- 参考
    - [Ubuntu 24.04 LTSでもUSキーボードのAlt-L/Alt-Rで入力切替をする](https://zenn.dev/suree/articles/7768f5b6b871b2)

## 環境設定

```bash
# バックアップ (これらは元ファイルのままとする)
$ cp ~/.profile ~/_RAW_profile
$ cp ~/.bashrc ~/_RAW_bashrc

# アップデートしていく
$ sudo apt update
$ sudo apt upgrade -y
$ sudo apt dist-upgrade -y
$ sudo apt autoremove -y

# VLC はアプリケーションセンタからインストールすると動作しなかったのでコチラでインストールする
$ sudo apt install -y tree jq vim tmux git tig vlc

# sudo をパスワードなしで実行できるようにする : `/usr/bin/vim.basic` を選択する
$ sudo update-alternatives --config editor

# 「neo  ALL=(ALL)  NOPASSWD:ALL」を追記する
$ sudo visudo
```

- ホームディレクトリ配下のサブディレクトリを英語表記にする
  ```bash
  # 英語表記のディレクトリを作る (既存ディレクトリをリネームしてしまう)
  $ cd ~/
  $ mv ダウンロード Downloads
  $ mv テンプレート Templates
  $ mv デスクトップ Desktop
  $ mv ドキュメント Documents
  $ mv ビデオ Videos
  $ mv ピクチャ Pictures
  $ mv ミュージック Music
  $ mv 公開 Public
  
  # 以下のファイルを開いてディレクトリ名を英語表記に書き換える
  $ sed -i 's/ダウンロード/Downloads/g' ~/.config/user-dirs.dirs
  $ sed -i 's/テンプレート/Templates/g' ~/.config/user-dirs.dirs
  $ sed -i 's/デスクトップ/Desktop/g' ~/.config/user-dirs.dirs
  $ sed -i 's/ドキュメント/Documents/g' ~/.config/user-dirs.dirs
  $ sed -i 's/ビデオ/Videos/g' ~/.config/user-dirs.dirs
  $ sed -i 's/ピクチャ/Pictures/g' ~/.config/user-dirs.dirs
  $ sed -i 's/ミュージック/Music/g' ~/.config/user-dirs.dirs
  $ sed -i 's/公開/Public/g' ~/.config/user-dirs.dirs
  ```


## 端末 (ターミナル)

- Xterm スキームをベースにカラーリングを設定する。青色は `#0088ff` あたりがオススメ
- フォントは特に指定しなくても全角文字もちゃんと見えている
- `$ visudo` 時のエディタを Vi にする
    - `$ sudo update-alternatives --config editor` で順序指定しても良い
- Tmux 使用時に罫線が表示崩れする場合は「設定」→「互換性」→「曖昧幅の文字」を「半角」にする


## Homebrew

- [macOS（またはLinux）用パッケージマネージャー — Homebrew](https://brew.sh/ja/)

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


## Node.js : nvm

- [nvm-sh/nvm: Node Version Manager - POSIX-compliant bash script to manage multiple active node.js versions](https://github.com/nvm-sh/nvm)

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# ~/.bashrc に2行書かれるのでよしなに

$ nvm install v22.12.0
$ nvm use v22.12.0
```
