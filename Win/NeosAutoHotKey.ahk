; Neo's AutoHotKey
; 
; ====================================================================================================
; 
; = 参考
;   - https://so-zou.jp/software/tool/system/auto-hot-key/hotkeys/
;   - https://sites.google.com/site/autohotkeyjp/reference/KeyList
; - 特殊キー
;   - vk1Csc079 : 変換キー
;   - vkF2sc070 : ひらがな/カタカナキー
;   - vkF3sc029・vkF4sc029 : 全角/半角キー・IME の On・Off で異なる
; 
; ====================================================================================================


; キーコード調査用：View → Key History
; #InstallKeybdHook

; Win + Space キーによる IME 切替を無効化する
#Space::Return

; IME 切替 (Ctrl + Space を再現する・Ctrl + Space 自体の操作は Google 日本語入力で設定しておく)
CapsLock::^Space
Pause::^Space
Break::^Space

; BackSpace コンビネーションを Delete 扱いにする
^BS::Send, {Del}    ; Ctrl
#BS::Send, {Del}    ; Win
!BS::Send, {Del}    ; Alt
+BS::Send, {Del}    ; Shift

; JIS 配列用：無変換キーを利用したショートカット
vk1Dsc07B & z:: Send, ^{PgUp}    ; 無変換 + z → Ctrl + PageUp
vk1Dsc07B & x:: Send, ^{PgDn}    ; 無変換 + x → Ctrl + PageDown
vk1Dsc07B:: Send, {Enter}        ; 無変換キー単体 → Enter


; Alt 単独で IME を切り替える
; ====================================================================================================


#Include NeosAutoHotKey-alt-ime-ahk.ahk


; ----------------------------------------------------------------------------------------------------
