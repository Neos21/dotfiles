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
; #InstallKeybdHook

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


; Alt 単独で IME を切り替える
; ====================================================================================================


#Include NeosAutoHotKey-alt-ime-ahk.ahk


; ----------------------------------------------------------------------------------------------------
