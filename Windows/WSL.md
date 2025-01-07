# WSL2 Ubuntu 環境構築手順

基本は「Linux (Ubuntu) リカバリ手順」を参照。


## 事前準備

1. Microsoft Store で Ubuntu をダウンロードする。初回は WSL がインストールされていないので、以下のページを参考にインストールする
    - <https://aka.ms/wsl2-install>
        - <https://docs.microsoft.com/ja-jp/windows/wsl/install-win10>
    - ```ps1
      # 現在は以下で何とかなるかも
      PS> wsl --install
      
      # 以前はこんなコマンドだった
      PS> dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
      PS> dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
      ```
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


## Ubuntu の初期設定

```bash
# 7箇所くらいある「archive.ubuntu.com」を「jp.archive.ubuntu.com」に編集する
# sudo vi /etc/apt/sources.list で編集しても良い
$ sudo cp /etc/apt/sources.list /etc/apt/sources.list.BAK
$ sudo sed -i 's/archive.ubuntu.com/jp.archive.ubuntu.com/g' /etc/apt/sources.list

# 日本語に切り替える
$ sudo update-locale LANG=ja_JP.UTF-8

# 一度再起動して、日本語 (ja_JP.UTF-8) になっているか確認する
$ locale

# アジア → 東京を選ぶ
$ sudo dpkg-reconfigure tzdata

# 各種ディレクトリを作る・必要に応じて Git より取得する
$ mkdir -p ~/Documents/Dev/GitHub/ ~/Documents/Dev/BitBucket/ ~/Documents/Dev/Sandboxes/
$ mkdir -p ~/.ssh/
```


## 各種ツールのインストール

```bash
$ npm install -g wsl-open
```
