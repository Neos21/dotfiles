# WSL2 Ubuntu 18.04 環境構築手順


## 事前準備

1. Microsoft Store で Ubuntu をダウンロードする。初回は WSL がインストールされていないので、以下のページを参考にインストールする
    - <https://aka.ms/wsl2-install>
        - <https://docs.microsoft.com/ja-jp/windows/wsl/install-win10>
    - `PS> dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
    - `PS> dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
    - 再起動する
2. Ubuntu を起動し以下のとおり初回起動の設定を済ませる。以降、初期ユーザは `neo` のテイで記載する
   ```bash
   Installing, this may take a few minutes...
   Please create a default UNIX user account. The username does not need to match your Windows username.
   For more information visit: https://aka.ms/wslusers
   Enter new UNIX username: neo
   Enter new UNIX password:
   Retype new UNIX password:
   passwd: password updated successfully
   Installation successful!
   To run a command as administrator (user "root"), use "sudo <command>".
   See "man sudo_root" for details.
   
   neo@Neos-Windows:~$ exit
   ```
3. __管理者権限で起動した PowerShell__ で WSL のバージョンを上げる
    - ```ps1
      PS> wsl -l -v
        NAME      STATE           VERSION
      * Ubuntu    Running         1
      
      PS C:\WINDOWS\system32> wsl --set-version Ubuntu 2
      変換中です。この処理には数分かかることがあります...
      WSL 2 との主な違いについては、https://aka.ms/wsl2 を参照してください
      WSL 2 を実行するには、カーネル コンポーネントの更新が必要です。詳細については https://aka.ms/wsl2kernel を参照してください
      ```
    - <https://aka.ms/wsl2kernel>
        - https://docs.microsoft.com/ja-jp/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package
        - 「x64 マシン用 WSL2 Linux カーネル更新プログラム パッケージ」(`wsl_update_x64.msi`) をダウンロードしインストールする
    - ```ps1
      PS> wsl --set-version Ubuntu 2
      変換中です。この処理には数分かかることがあります...
      WSL 2 との主な違いについては、https://aka.ms/wsl2 を参照してください
      変換が完了しました。
      
      PS> wsl -l -v
        NAME      STATE           VERSION
      * Ubuntu    Stopped         2
      ```
4. 今後、設定反映のために再起動を行う場合は、以下も実施しておくと良い。
   ```ps1
   PS> wsl --shutdown
   # もしくは以下 (--terminate)
   PS> wsl -t Ubuntu
   ```


## Ubuntu 18.04 の初期設定

```bash
# sudo をパスワードなしで実行できるようにする
# sudo update-alternatives --config editor で設定しても良い
sudo update-alternatives --set editor /usr/bin/vim.basic

# 「neo  ALL=(ALL)  NOPASSWD:ALL」を追記する
sudo visudo

# 7箇所くらいある「archive.ubuntu.com」を「jp.archive.ubuntu.com」に編集する
# sudo vi /etc/apt/sources.list で編集しても良い
sudo cp /etc/apt/sources.list /etc/apt/sources.list.BAK
sudo sed -i 's/archive.ubuntu.com/jp.archive.ubuntu.com/g' /etc/apt/sources.list

# 日本語 Remix のリポジトリを追加する
wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
sudo wget https://www.ubuntulinux.jp/sources.list.d/bionic.list -O /etc/apt/sources.list.d/ubuntu-ja.list

# アップデートしていく
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y

# 日本語環境にするため必要なパッケージを確認する
# fonts-noto-cjk fonts-noto-cjk-extra ibus language-pack-ja あたりが出るだろうか
check-language-support -l ja

# 日本語化パッケージを入れる
sudo apt install -y $(check-language-support -l ja) language-pack-ja

# 日本語 Remix のパッケージを入れる
sudo apt install -y ubuntu-defaults-ja

# 日本語に切り替える
sudo update-locale LANG=ja_JP.UTF-8

# 一度再起動する
exit

# 再起動後、日本語 (ja_JP.UTF-8) になっているか確認する
locale

# アジア → 東京を選ぶ
sudo dpkg-reconfigure tzdata

# 日本語 man を入れる
sudo apt install -y manpages-ja manpages-ja-dev
```

### VcXsrv で接続する GNOME デスクトップ環境の構築手順

```bash
# 日本語フォントを入れる : MS 英文フォントは EURA の同意を求められる
sudo apt install -y fonts-noto fonts-ipafont fonts-ipaexfont fonts-vlgothic fonts-takao ttf-mscorefonts-installer

# GNOME を入れる
sudo apt install -y ubuntu-desktop gnome-tweak-tool

# Ibus を削除する
sudo apt purge -y ibus ibus-mozc

# Fcitx と Mozc をインストールする
sudo apt install -y fcitx fcitx-mozc fcitx-config-gtk fcitx-frontend-gtk2 fcitx-frontend-gtk3 fcitx-frontend-qt4 fcitx-frontend-qt5 fcitx-ui-classic kde-config-fcitx mozc-utils-gui dbus-x11

# 入力メソッドを更新する
im-config -n fcitx

# 起動スクリプトを作成する
sudo sh -c 'echo "fcitx-autostart &>/dev/null" > /etc/profile.d/fcitx'

# 環境変数を設定する
sudo sh -c 'cat <<EOL > /etc/profile.d/fcitx.sh
#!/bin/bash

export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx
EOL'

# 権限設定をしておく
sudo chmod -R 777 ~/.cache/

# PolicyKit 関連のエラーを回避するため、全てのユーザに全ての許可を与える設定ファイルを作成する
sudo sh -c 'cat <<EOL > /etc/polkit-1/localauthority/50-local.d/99-all.pkla
[Allow all]
Identity=unix-user:*
Action=*
ResultAny=yes
ResultInactive=yes
ResultActive=yes
EOL'

# gnome-software (Ubuntu ソフトウェア) のカテゴリが表示されないのは以下で対応する
sudo gpasswd -a neo root
sudo gpasswd -a neo admin
sudo gpasswd -a neo lpadmin

# 「自動起動するアプリケーション」として fcitx-autostart を登録する (GNOME の初回起動後、GUI 上で設定しても良い)
cat <<EOL > ~/.config/autostart/fcitx-autostart.desktop
[Desktop Entry]
Type=Application
Exec=fcitx-autostart
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[ja_JP]=fcitx-autostart
Name=fcitx-autostart
Comment[ja_JP]=fcitx-autostart
Comment=fcitx-autostart
EOL

# 起動スクリプトを作成する
cat <<EOL > ~/bin/startu
#!/bin/bash

# Prepare
sudo sh -c 'dbus-uuidgen > /var/lib/dbus/machine-id'
sudo service dbus restart
export DISPLAY="$(cat /etc/resolv.conf|grep nameserver|awk '{print $2}'):0"

# Launch VcXsrv
/mnt/c/Program\ Files/VcXsrv/vcxsrv.exe :0 -ac -keyhook &

# Start GNOME Session
XDG_CURRENT_DESKTOP=ubuntu:GNOME XDG_SESSION_TYPE=x11 gnome-session

# After End GNOME, Kill VcXsrv
/mnt/c/Windows/System32/taskkill.exe /IM vcxsrv.exe /T /F
EOL

# 起動スクリプトに権限を付与する。コレで以降は `$ startu` で VcXsrv と GNOME を同時起動できるようになる
sudo chmod 777 ~/bin/startu
```


## 各種ツールのインストール

```bash
$ sudo apt install -y tree jq tmux git tig

# Homebrew Linuxbrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
$ vi ~/.bashrc
  # General Users Only
  test -d '/home/linuxbrew/.linuxbrew' && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Nodebrew
$ curl -L git.io/nodebrew | perl - setup
$ vi ~/.bashrc
  # nodebrew
  export PATH="${HOME}/.nodebrew/current/bin:${PATH}"
$ nodebrew ls-remote
$ nodebrew install v14.16.1
$ nodebrew use v14.16.1

# wsl-open
$ npm install -g wsl-open
```
