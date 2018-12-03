#!/bin/bash

# ================================================================================
# 【For Mac】MacOS.sh : Setup MacOS
# ================================================================================


if [ "$(uname)" != "Darwin" ] ; then
  echo 'Not macOS!'
  exit 1
fi

echo 'Setup MacOS'

chflags nohidden ~/Library    # ~/Library ディレクトリを見えるようにする
sudo chflags nohidden /Volumes    # /Volumes ディレクトリを見えるようにする
sudo nvram SystemAudioVolume=" "    # ブート時のサウンドを無効化する

sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName    # 時計アイコンクリック時に OS やホスト名 IP を表示する

defaults write -g NSAutomaticWindowAnimationsEnabled -bool false    # ファイルを開くときのアニメーションを無効にする
defaults write -g NSInitialToolTipDelay -integer 0    # ツールチップ表示までのタイムラグをなくす
defaults write -g NSWindowResizeTime 0.1    # ダイアログ表示やウィンドウリサイズ速度を高速化する

defaults write NSGlobalDomain AppleShowAllExtensions -bool true    # 全ての拡張子のファイルを表示する
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"    # スクロールバーを常時表示する
defaults write NSGlobalDomain com.apple.springing.delay -float 0    # スプリングロード遅延を除去する
defaults write NSGlobalDomain com.apple.springing.enabled -bool true    # ディレクトリのスプリングロードを有効にする
defaults write NSGlobalDomain KeyRepeat -int 2    # キーリピートの速度
defaults write NSGlobalDomain InitialKeyRepeat -int 15    # キーリピート開始までのタイミング
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001    # コンソールアプリケーションの画面サイズ変更を高速にする
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true    # Safari のコンテキストメニューに Web インスペクタを追加する

defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40    # Bluetooth ヘッドフォン・ヘッドセットの音質を向上させる

defaults write com.apple.CrashReporter DialogType -string "none"    # クラッシュレポートを無効化する

defaults write com.apple.dashboard mcx-disabled -bool true    # Dashboard を無効化する

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true    # USB やネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.dock autohide-delay -float 0    # Dock が表示されるまでの待ち時間を無効にする
defaults write com.apple.dock mcx-expose-disabled -bool true    # Mission Control を使用不可にする

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true    # Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder _FXSortFoldersFirst -bool true    # 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder AnimateWindowZoom -bool false    # フォルダを開くときのアニメーションを無効にする
defaults write com.apple.finder AppleShowAllFiles YES    # 不可視ファイルを表示する
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"    # 検索時にデフォルトでカレントディレクトリを検索する
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false    # 拡張子変更時の警告を無効化する
defaults write com.apple.finder QLEnableTextSelection -bool true    # クイックルックでテキストを選択可能にする
defaults write com.apple.Finder QuitMenuItem -bool true    # Finder を終了させる項目を追加する
defaults write com.apple.finder ShowPathbar -bool true    # パスバーを表示する
defaults write com.apple.finder ShowStatusBar -bool true    # ステータスバーを表示する
defaults write com.apple.finder ShowTabView -bool true    # タブバーを表示する
defaults write com.apple.finder WarnOnEmptyTrash -bool false    # ゴミ箱を空にする前の警告を無効化する

defaults write com.apple.LaunchServices LSQuarantine -bool false    # 未確認のアプリケーションを実行する際のダイアログを無効にする

defaults write com.apple.NetworkBrowser ShowThisComputer -bool true    # ファイル共有を有効にした時、共有先に自分の Mac を表示させる

defaults write com.apple.Safari AutoOpenSafeDownloads -bool false    # ファイルのダウンロード後に自動でファイルを開くのを無効化する
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true    # Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari IncludeDevelopMenu -bool true    # Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true    # Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true    # アドレスバーに完全な URL を表示する
defaults write com.apple.Safari ShowStatusBar -bool true    # ステータスバーを表示する
defaults write com.apple.Safari SuppressSearchSuggestions -bool true    # 検索クエリを Apple へ送信しない
defaults write com.apple.Safari UniversalSearchEnabled -bool false    # 検索クエリを Apple へ送信しない
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true    # Safari の開発・デバッグメニューを有効にする

defaults write com.apple.screencapture disable-shadow -bool true    # スクリーンキャプチャの影をなくす
defaults write com.apple.screencapture type -string "png"    # スクリーンショットの保存形式を PNG にする

defaults write com.apple.terminal StringEncodings -array 4    # UTF-8 のみを使用する

echo 'Finished'


# --------------------------------------------------------------------------------
