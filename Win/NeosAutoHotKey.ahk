; Neo's AutoHotKey
; 
; ====================================================================================================
; 
; - 参考
;   - https://so-zou.jp/software/tool/system/auto-hot-key/hotkeys/
;   - https://sites.google.com/site/autohotkeyjp/reference/KeyList
; - 特殊キー
;   - vk1Csc079 : 変換キー
;   - vkF2sc070 : ひらがな/カタカナキー
;   - vkF3sc029・vkF4sc029 : 全角/半角キー・IME の On・Off で異なる
; 
; ====================================================================================================


; キーコード調査用：View → Key History
#InstallKeybdHook

; Win + Space キーによる IME 切替を無効化する
#Space:: Return

; IME 切替 (vkF3sc029・vkF4sc029 = 全角	/ 半角。Send 側に書く時は両者を区別しなくて良い)
Pause:: vkF4sc029
Break:: vkF4sc029
sc03A:: vkF4sc029    ; sc03A : 英数キー。CapsLock キーを押すと英数キーとして反応する

; Shift + CapsLock (英数キー) で CapsLock 操作を行う
+sc03A:: Send, {CapsLock}

; BackSpace コンビネーションを Delete 扱いにする
^BS:: Send, {Del}    ; Ctrl
#BS:: Send, {Del}    ; Win
!BS:: Send, {Del}    ; Alt
+BS:: Send, {Del}    ; Shift

; ブラウザのタブ移動を左手でできるようにする
LAlt & q:: Send, ^{PgUp}    ; 左 Alt + q → Ctrl + PageUp
LAlt & e:: Send, ^{PgDn}    ; 左 Alt + e → Ctrl + PageDown

; Alt と左右矢印を Mac 風にする
LAlt & Left:: Send, {Home}
LAlt & Right:: Send, {End}

; Alt と上下矢印で PageUp・PageDown
LAlt & Up:: Send, {PgUp}
LAlt & Down:: Send, {PgDn}

; Alt コンビネーションを Mac 風に使えるようにする
!z:: Send, ^z       ; Ctrl + z
!x:: Send, ^x       ; Ctrl + x
!c:: Send, ^c       ; Ctrl + c
!v:: Send, ^v       ; Ctrl + v
!a:: Send, ^a       ; Ctrl + a
!s:: Send, ^s       ; Ctrl + s
!f:: Send, ^f       ; Ctrl + d
!g:: Send, ^g       ; Ctrl + g
!h:: Send, ^h       ; Ctrl + h
!q:: Send, !{F4}    ; Alt + F4 (Cmd + q) … LAlt は上のタブ移動の挙動になるので実質 RAlt のみ
!w:: Send, ^w       ; Ctrl + w
!r:: Send, ^r       ; Ctrl + r
!t:: Send, ^t       ; Ctrl + t
!o:: Send, ^o       ; Ctrl + o


; JIS 配列用
; ====================================================================================================


; 無変換キーを利用したショートカット
vk1Dsc07B & z:: Send, ^{PgUp}    ; 無変換 + z → Ctrl + PageUp
vk1Dsc07B & x:: Send, ^{PgDn}    ; 無変換 + x → Ctrl + PageDown
vk1Dsc07B:: Send, {Enter}        ; 無変換キー単体 → Enter


; Alt 単独で IME を切り替える
; ====================================================================================================


#Include NeosAutoHotKey-alt-ime-ahk.ahk


; ----------------------------------------------------------------------------------------------------
