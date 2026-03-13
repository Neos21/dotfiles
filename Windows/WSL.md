# WSL2 Ubuntu 環境構築手順

Linux 環境として重複する部分は [Linux (Ubuntu) リカバリ手順](../Linux/README.md) も参照。


## 事前準備

1. Microsoft Store で Ubuntu をダウンロードする。初回は WSL がインストールされていないので、以下のページを参考にインストールする
   ```ps1
   # Microsoft Store で Ubuntu をインストールしてあれば以下は不要
   PS> wsl --install
   ```
2. Ubuntu を起動し以下のとおり初回起動の設定を済ませる。以降、初期ユーザは `neo` のテイで記載する
   ```bash
   Installing, this may take a few minutes...
   Please create a default UNIX user account. The username does not need to match your Windows username.
   For more information visit: https://aka.ms/wslusers
   Enter new UNIX username: neo  # 名前指定
   Enter new UNIX password:  # パスワードを入れる
   Retype new UNIX password:  # パスワードを入れる
   passwd: password updated successfully
   Installation successful!
   To run a command as administrator (user "root"), use "sudo <command>".
   See "man sudo_root" for details.
   
   neo@Neos-Windows:~$ exit
   ```
3. **管理者権限で起動した PowerShell** でバージョン確認しておく
   ```ps1
   PS> wsl -l -v
     NAME      STATE           VERSION
   * Ubuntu    Running         2
   ```
4. 今後、設定反映のために再起動を行う場合は、以下も実施しておくと良い
   ```ps1
   PS> wsl --shutdown
   # もしくは以下 (--terminate)
   PS> wsl -t Ubuntu
   ```


## Ubuntu の初期設定

```bash
# 7箇所くらいある「archive.ubuntu.com」を「jp.archive.ubuntu.com」に編集する
# sudo vi /etc/apt/sources.list で編集しても良い
$ sudo cp /etc/apt/sources.list /etc/apt/sources.list.BAK
$ sudo sed -i 's/archive.ubuntu.com/jp.archive.ubuntu.com/g' /etc/apt/sources.list

# 日本語に切り替える
$ sudo locale-gen ja_JP.UTF-8
$ sudo update-locale LANG=ja_JP.UTF-8
# 一度再起動する
$ sudo reboot

#  日本語 (ja_JP.UTF-8) になっているか確認する
$ locale

# アジア → 東京を選ぶ
$ sudo dpkg-reconfigure tzdata
```

- [Linux (Ubuntu) リカバリ手順](../Linux/README.md) を参照
    - 環境設定


## 各種ツールのインストール

- [Linux (Ubuntu) リカバリ手順](../Linux/README.md) を参照
    - Homebrew
    - Node.js : nvm

```bash
$ npm install -g wsl-open
```
