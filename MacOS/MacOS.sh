#!/bin/bash

# ================================================================================
# 【For MacOS】MacOS.sh : Setup MacOS
# ================================================================================


if [ "$(uname)" != 'Darwin' ] ; then
  echo 'Not MacOS'
  exit 1
fi

echo 'Setup MacOS'

sudo nvram SystemAudioVolume=" "    # ブート時のサウンドを無効化する
sudo chflags nohidden /Volumes    # /Volumes ディレクトリを可視化する

chflags nohidden ~/Library    # ~/Library ディレクトリを可視化する

sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName    # 時計アイコンクリック時に OS やホスト名 IP を表示する

defaults -currentHost write -globalDomain AppleFontSmoothing -int 2    # 外部ディスプレイでアンチエイリアスを有効にする (サブピクセルレンダリングを「中」レベルで設定する)

defaults write -g NSAutomaticWindowAnimationsEnabled -bool false    # ファイルを開くときのアニメーションを無効にする
defaults write -g NSInitialToolTipDelay -int 0    # ツールチップ表示までのタイムラグをなくす
defaults write -g NSWindowResizeTime 0.1    # ダイアログ表示やウィンドウリサイズ速度を高速化する

defaults write NSGlobalDomain AppleKeyboardUIMode -int 3    # フルキーボードアクセスを有効にする
defaults write NSGlobalDomain AppleShowAllExtensions -bool true    # 全ての拡張子のファイルを表示する
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"    # スクロールバーを常時表示する
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true    # Fn キーを標準のファンクションキーとして使用する
defaults write NSGlobalDomain com.apple.springing.delay -float 0.4    # スプリングロード遅延 (Finder でディレクトリへの DnD 時にディレクトリ移動する時間) を短くする
defaults write NSGlobalDomain com.apple.springing.enabled -bool true    # ディレクトリのスプリングロードを有効にする
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false    # トラックパッドのスクロール方向を非ナチュラルにする
defaults write NSGlobalDomain KeyRepeat -int 2    # キーリピートの速度を最速にする
defaults write NSGlobalDomain InitialKeyRepeat -int 15    # キーリピート開始までのタイミングを最速にする
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true    # 保存ダイアログを詳細設定で表示する
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001    # コンソールアプリケーションの画面サイズ変更を高速にする
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true    # Safari のコンテキストメニューに Web インスペクタを追加する

defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40    # Bluetooth ヘッドフォン・ヘッドセットの音質を向上させる

defaults write com.apple.CrashReporter DialogType -string "none"    # クラッシュレポートを無効化する

defaults write com.apple.dashboard mcx-disabled -bool true    # Dashboard を無効化する

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true    # ネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true    # USB ストレージに .DS_Store ファイルを作成しない

# Dock : 設定反映は $ killall Dock
defaults write com.apple.dock autohide-delay -float 0    # Dock が表示されるまでの待ち時間を無効にする
defaults write com.apple.dock largesize -int 80    # Dock の拡大時のサイズを指定する
defaults write com.apple.dock magnification -bool true    # Dock の拡大を有効にする
defaults write com.apple.dock mcx-expose-disabled -bool true    # Mission Control を使用不可にする
defaults write com.apple.dock tilesize -int 25    # Dock の通常サイズを指定する
defaults write com.apple.dock wvous-tl-corner -int 10    # ディスプレイ左上でディスプレイをスリープする

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true    # トラックパッドのタップでクリックにする

# Finder : 設定反映は killall Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true    # Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder _FXSortFoldersFirst -bool true    # 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder AnimateWindowZoom -bool false    # フォルダを開くときのアニメーションを無効にする
defaults write com.apple.finder AppleShowAllFiles YES    # 不可視ファイルを表示する
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"    # 検索時にデフォルトでカレントディレクトリを検索する
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false    # 拡張子変更時の警告を無効化する
defaults write com.apple.Finder FXPreferredViewStyle Nlsv    # 常にリストビューにする
defaults write com.apple.finder QLEnableTextSelection -bool true    # クイックルックでテキストを選択可能にする
defaults write com.apple.Finder QuitMenuItem -bool true    # Finder を終了させる項目を追加する
defaults write com.apple.finder ShowPathbar -bool true    # パスバーを表示する
defaults write com.apple.finder ShowStatusBar -bool true    # ステータスバーを表示する
defaults write com.apple.finder ShowTabView -bool true    # タブバーを表示する
defaults write com.apple.finder WarnOnEmptyTrash -bool false    # ゴミ箱を空にする前の警告を無効化する

defaults write com.apple.LaunchServices LSQuarantine -bool false    # 未確認のアプリケーションを実行する際のダイアログを無効にする

defaults write com.apple.menuextra.battery ShowPercent -string "YES"    # バッテリー表示を % 表記にする

defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"    # 日付と時刻のフォーマットを設定する (24時間表示、秒表示あり、日付・曜日を表示する)

defaults write com.apple.NetworkBrowser ShowThisComputer -bool true    # ファイル共有を有効にした時、共有先に自分の Mac を表示させる

defaults write com.apple.Safari AutoOpenSafeDownloads -bool false    # ファイルのダウンロード後に自動でファイルを開くのを無効化する
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true    # バックスペースで戻れるようにする
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true    # Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari IncludeDevelopMenu -bool true    # Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true    # Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true    # アドレスバーに完全な URL を表示する
defaults write com.apple.Safari ShowStatusBar -bool true    # ステータスバーを表示する
defaults write com.apple.Safari SuppressSearchSuggestions -bool true    # 検索クエリを Apple へ送信しない
defaults write com.apple.Safari UniversalSearchEnabled -bool false    # 検索クエリを Apple へ送信しない
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true    # Safari の開発・デバッグメニューを有効にする

# Screen Capture : 設定反映は $ killall SystemUIServer
defaults write com.apple.screencapture disable-shadow -bool true    # スクリーンキャプチャの影をなくす
defaults write com.apple.screencapture type -string "png"    # スクリーンショットの保存形式を PNG にする

defaults write com.apple.terminal StringEncodings -array 4    # UTF-8 のみを使用する

killall Dock
killall Finder
killall SystemUIServer

echo 'Finished'


# --------------------------------------------------------------------------------
