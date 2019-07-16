; ====================================================================================================
; Neo's AutoHotKey
; ====================================================================================================


; キーコード調査用 : View → Key History
; #InstallKeybdHook

; Win + Space キーによる IME 切替を無効化する
#Space:: Return

; BackSpace コンビネーションを Delete 扱いにする
^BS:: Send, {Del}  ; Ctrl
!BS:: Send, {Del}  ; Alt

; Alt コンビネーションを Mac 風に使えるようにする
!z:: Send, ^z     ; Ctrl + z
!x:: Send, ^x     ; Ctrl + x
!c:: Send, ^c     ; Ctrl + c
!v:: Send, ^v     ; Ctrl + v
!b:: Send, ^b     ; Ctrl + b
!n:: Send, ^n     ; Ctrl + n
!m:: Send, ^m     ; Ctrl + m
!a:: Send, ^a     ; Ctrl + a
!s:: Send, ^s     ; Ctrl + s
!d:: Send, ^d     ; Ctrl + d
!f:: Send, ^f     ; Ctrl + f
!g:: Send, ^g     ; Ctrl + g
!h:: Send, ^h     ; Ctrl + h
!j:: Send, ^j     ; Ctrl + j
!k:: Send, ^k     ; Ctrl + k
!l:: Send, ^l     ; Ctrl + l
!q:: Send, !{F4}  ; Alt + F4 (Cmd + q)
!w:: Send, ^w     ; Ctrl + w
!e:: Send, ^e     ; Ctrl + e
!r:: Send, ^r     ; Ctrl + r
!t:: Send, ^t     ; Ctrl + t
!y:: Send, ^y     ; Ctrl + y
!u:: Send, ^u     ; Ctrl + u
!i:: Send, ^i     ; Ctrl + i
!o:: Send, ^o     ; Ctrl + o
!p:: Send, ^p     ; Ctrl + p
<!Left:: Send, {Home}    ; 左 Alt +         ← =         Home
<!+Left:: Send, +{Home}  ; 左 Alt + Shift + ← = Shift + Home
<!Right:: Send, {End}    ; 左 Alt +         → =         End
<!+Right:: Send, +{End}  ; 左 Alt + Shift + → = Shift + End


; Alt 単独で IME を切り替える
; ====================================================================================================

#Include NeosAutoHotKey-alt-ime-ahk.ahk


; ----------------------------------------------------------------------------------------------------
