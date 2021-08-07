# Linux (Ubuntu) リカバリ手順


## 日本語入力環境

- `$ sudo apt install -y fcitx fcitx-configtool fcitx-mozc` で Fcitx-Mozc をインストールする
    - `fcitx-configtool` がうまくインストールできないようであれば「Ubuntu ソフトウェア」からインストールする
- 再起動する
- 入力メソッド `im-config` で Fcitx を選択する (`$ im-config -n fcitx`)
- 再起動する
- Fcitx 設定 (`fcitx-configtool`) で「英語 (US)」と「Mozc」を選択、Alt で「入力メソッドをオンに / オフに」設定する
- 設定 → 地域と言語 → 入力ソース (`gnome-control-center region`) は「英語 (US)」のみにしておくと「en」「ja」などの余計なアプリインジケータが表示されなくなる


## その他のキー設定

- キーリピートの調整
    - 設定 → ユニバーサルアクセス → リピートキー
    - 時間を 250ms くらい、速度をその目盛りの倍くらいにするとちょうど良い
- 設定 → デバイス → キーボード
    - Switch windows : `Alt+Tab` (デフォルトだとアプリケーション単位で切り替わるのをコレで直せる)
    - Switch windows of an application : `Ctrl+Tab`
    - Restore the keyboard shortcuts : 無効
    - Show all applications : `Print` (PrintScreen キー。ThinkPad X250 では 右 Alt と右 Ctrl キーの間にあるため)
    - Hide window : `Alt+H`
    - ウィンドウのスクリーンショットをクリップボードにコピーする : `Alt+Print`
    - ウィンドウのスクリーンショットをピクチャフォルダーに保存する : 無効
    - スクリーンショットをピクチャフォルダーに保存する : 無効
    - 選択領域のスクリーンショットをピクチャフォルダーに保存する : 無効
- 左 Super キー単独押しで「アクティビティ画面」が開くのを無効化する
    - Ubuntu ソフトウェア : GNOME Tweaks (`gnome-tweaks`)
    - キーボード → アクティビティ画面のショートカット : 右 Super (ThinkPad X250 で左 Win キーの空打ちを無効化するため)
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
  ```bash
  # 英語表記のディレクトリを作る (既存ディレクトリをリネームしたりしても良い)
  cd ~/
  mkdir Desktop Downloads Templates Public Documents Music Pictures Videos
  # 以下のファイルを開いてディレクトリ名を英語表記に書き換える
  vi ~/.config/user-dirs.dirs
  # 不要な日本語ディレクトリを削除する
  rmdir ダウンロード テンプレート デスクトップ ドキュメント ビデオ ピクチャ ミュージック 公開
  # 以下のようにしても良い
  mv ダウンロード Downloads
  mv テンプレート Templates
  mv デスクトップ Desktop
  mv ドキュメント Documents
  mv ビデオ Videos
  mv ピクチャ Pictures
  mv ミュージック Music
  mv 公開 Public
  sed -i 's/ダウンロード/Downloads/g' ~/.config/user-dirs.dirs
  sed -i 's/テンプレート/Templates/g' ~/.config/user-dirs.dirs
  sed -i 's/デスクトップ/Desktop/g' ~/.config/user-dirs.dirs
  sed -i 's/ドキュメント/Documents/g' ~/.config/user-dirs.dirs
  sed -i 's/ビデオ/Videos/g' ~/.config/user-dirs.dirs
  sed -i 's/ピクチャ/Pictures/g' ~/.config/user-dirs.dirs
  sed -i 's/ミュージック/Music/g' ~/.config/user-dirs.dirs
  sed -i 's/公開/Public/g' ~/.config/user-dirs.dirs
  ```


## テキストエディタ

- 標準搭載の Gedit で十分
- フォントを Noto Sans Mono CJK JP にし、カラーテーマを設定する


## 端末 (ターミナル)

- Xterm スキームをベースにカラーリングを設定する。青色は `#0088ff` あたりがオススメ
- フォントは特に指定しなくても全角文字もちゃんと見えている
- `$ visudo` 時のエディタを Vi にする
    - `$ sudo update-alternatives --set editor /usr/bin/vim.basic`
    - `$ sudo update-alternatives --config editor` で順序指定しても良い
- Tmux 使用時に罫線が表示崩れする場合は「設定」→「互換性」→「曖昧幅の文字」を「半角」にする


## Ubuntu ソフトウェアからインストールする

- Fcitx (`fcitx`)
- Fcitx 設定 (`fcitx-configtool`)
- Seahorse (`seahorse`)
- Menu Editor (`menulibre`)
- GNOME Tweaks (`gnome-tweaks`)
- Files (`nemo`)
- Chromium (`chromium-browser`)
- Font Manager (`font-manager`)
- GIMP (`gimp`)
- VLC (`vlc`)

```bash
# コマンドラインでインストールする
sudo apt install -y fcitx fcitx-configtool seahorse menulibre gnome-tweaks nemo chromium-browser font-manager gimp vlc

# Nemo をデフォルトのファイラに置き換える
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
```


## コマンドラインでインストールする

```bash
sudo apt install -y tree jq vim-gnome tmux git tig
```


## GNOME Shell 拡張機能

- セットアップ
    - Chrome に GNOME Shell 拡張機能をインストールする
    - `$ sudo apt install -y chrome-gnome-shell` でアダプタをインストールする (もしくは `Alt + F2` から `apturl apt:chrome-gnome-shell` と入力してもよい)
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


### Print キーで「全てのアプリケーション」をトグル表示し、Activities Overview 画面を封じる

[ESC to close overview from applications list](https://extensions.gnome.org/extension/1122/esc-to-close-overview-from-applications-list/) のソースコードを以下のように修正する。

- `~/.local/share/gnome-shell/extensions/ESC_to_close_overview@daniel.badawi.me/extension.js`

```javascript
const Clutter = imports.gi.Clutter;
const Main = imports.ui.main;
const Lang = imports.lang;

// 以下2行を追加
const { Gio, Meta, Shell } = imports.gi;
const SHELL_KEYBINDINGS_SCHEMA = 'org.gnome.shell.keybindings';

let _this;
let escAction;

//based on https://github.com/GNOME/gnome-shell/blob/gnome-3-20/js/ui/viewSelector.js
function esc(actor, event) {
		_this = this;
        if (Main.modalCount > 1)
            return Clutter.EVENT_PROPAGATE;

        let modifiers = event.get_state();
        let symbol = event.get_key_symbol();

        // 以下条件を追加
        if (symbol == Clutter.Escape || symbol == Clutter.Print || symbol == Clutter.KEY_3270_PrintScreen || symbol == Clutter.Super_L || symbol == Clutter.Super_R) {
            return escAction();
        } else if (this._shouldTriggerSearch(symbol)) {
            this.startSearch(event);
        } else if (!this._searchActive && !global.stage.key_focus) {
            if (symbol == Clutter.Tab || symbol == Clutter.Down) {
                this._activePage.navigate_focus(null, Gtk.DirectionType.TAB_FORWARD, false);
                return Clutter.EVENT_STOP;
            } else if (symbol == Clutter.ISO_Left_Tab) {
                this._activePage.navigate_focus(null, Gtk.DirectionType.TAB_BACKWARD, false);
                return Clutter.EVENT_STOP;
            }
        }
        return Clutter.EVENT_PROPAGATE;
}

function init() {
  // ↓ 追加ココカラ
  Main.wm.removeKeybinding('toggle-application-view');
  Main.overview.viewSelector._toggleAppsPage = function() {
    Main.overview.viewSelector._showAppsButton.checked = true;
    if(Main.modalCount >= 1) {
      Main.overview.hide();
    }
    else {
      Main.overview.show();
    }
  };
  Main.wm.addKeybinding('toggle-application-view',
                        new Gio.Settings({ schema_id: SHELL_KEYBINDINGS_SCHEMA }),
                        Meta.KeyBindingFlags.NONE,
                        Shell.ActionMode.NORMAL |
                        Shell.ActionMode.OVERVIEW,
                        Main.overview.viewSelector._toggleAppsPage.bind(Main.overview.viewSelector));
  // ↑ 追加ココマデ
  
	Main.overview.viewSelector._onStageKeyPress = esc;
}

function originalEscAction() {
	if (_this._searchActive)
        _this.reset();
    else if (_this._showAppsButton.checked)
        _this._showAppsButton.checked = false;
    else
        Main.overview.hide();
    return Clutter.EVENT_STOP;
}

function modifiedEscAction() {
	if (_this._searchActive)
        _this.reset();
    else
        Main.overview.hide();
    return Clutter.EVENT_STOP;
}

function enable() {
	escAction = modifiedEscAction;
}

function disable() {
	escAction = originalEscAction;
}
```

`Alt + F2` → `r` で GNOME Shell を再起動すると、`extension.js` の内容が再読込される。

デバッグしたくなったら `print()` 関数を仕込み `$ journalctl /usr/bin/gnome-shell` で確認できる。


## 個別にインストールする


### Brave

- <https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux>

```bash
sudo apt install -y apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo 'deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main' | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser
```


### Chrome

- 公式サイトより追加パッケージをダウンロードできる。Ubuntu ソフトウェアで読み込んでインストールできる

```bash
# Chrome
curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable
```

- キーリング : Chrome にログインすると初回に表示される。空文字で登録可能。「Seahorse」で確認・設定できる


### Chrome Remote Desktop

- 公式サイトよりホストをダウンロード・インストールする。旧アプリ版とは異なる
- `$ touch ~/.chrome-remote-desktop-session` でとりあえず動作するようになる ([参考](https://qiita.com/Boiling_Water/items/75ef825d6c73be6a5370))
- コレだとホストと異なるセッションに接続してしまうので、以下のとおり起動スクリプトを修正する ([参考](https://qiita.com/k_ikasumipowder/items/c173fb92cf12c75b2375))

```bash
# リモートデスクトップを停止する
sudo systemctl stop chrome-remote-desktop.service

# これから編集するファイルのバックアップを取っておく
sudo cp /opt/google/chrome-remote-desktop/chrome-remote-desktop /opt/google/chrome-remote-desktop/chrome-remote-desktop.BAK

# 環境変数を確認する : おそらく「:0」と表示されるはず
echo $DISPLAY

# 起動スクリプトを編集する
sudo vi /opt/google/chrome-remote-desktop/chrome-remote-desktop
```

起動スクリプトの元の行と、編集点を書いていく。

```python
FIRST_X_DISPLAY_NUMBER = 20

# ↓ 次のように変更する

FIRST_X_DISPLAY_NUMBER = 0  # 先ほどメモした値
```

```python
  @staticmethod
  def get_unused_display_number():
    """Return a candidate display number for which there is currently no
    X Server lock file"""
    display = FIRST_X_DISPLAY_NUMBER
    while os.path.exists(X_LOCK_FILE_TEMPLATE % display):
      display += 1
    return display

# ↓ 次のように while 部分をコメントアウトする

  @staticmethod
  def get_unused_display_number():
    """Return a candidate display number for which there is currently no
    X Server lock file"""
    display = FIRST_X_DISPLAY_NUMBER
    #while os.path.exists(X_LOCK_FILE_TEMPLATE % display):
    #  display += 1
    return display
```

```python
  def launch_session(self, x_args):
    self._init_child_env()
    self._setup_pulseaudio()
    self._setup_gnubby()
    self._launch_x_server(x_args)
    self._launch_x_session()

# ↓ 以下のように既存行を一部コメントアウトし、新たに追記する

  def launch_session(self, x_args):
    self._init_child_env()
    self._setup_pulseaudio()
    self._setup_gnubby()
    #self._launch_x_server(x_args)
    #self._launch_x_session()
    display = self.get_unused_display_number()
    self.child_env["DISPLAY"] = ":%d" % display
```

ココまで編集が終わったら保存し、Chrome リモートデスクトップを再起動する。

```bash
sudo systemctl restart chrome-remote-desktop.service
```


### google-drive-ocamlfuse

```bash
sudo add-apt-repository -y ppa:alessandro-strada/ppa
sudo apt update
sudo apt install -y google-drive-ocamlfuse

google-drive-ocamlfuse
# ブラウザが開くのでサインインし認証する
Access token retrieved correctly.
# しばらく待ち、このメッセージが出てプロンプトに戻ったら OK

# 同期用ディレクトリを作成し同期を開始する
mkdir -p ~/Documents/Home/GoogleDrive
google-drive-ocamlfuse ~/Documents/Home/GoogleDrive
```

「自動起動するアプリケーションの設定」にて、最後の同期コマンド `google-drive-ocamlfuse ~/Documents/Home/GoogleDrive` を登録しておく。


### VSCode

公式サイトから `.deb` パッケージを落としてインストールできる。


### Node.js : Nodebrew

```bash
curl -L git.io/nodebrew | perl - setup

vi ~/.bashrc
  # nodebrew
  export PATH="${HOME}/.nodebrew/current/bin:${PATH}"

source ~/.bashrc

nodebrew install 12.16.0
nodebrew use 12.16.0
node -v  # → 12.16.0
npm -v   # → 6.13.4
```
