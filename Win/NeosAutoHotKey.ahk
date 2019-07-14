; Neo's AutoHotKey
; ====================================================================================================


; キーコード調査用：View → Key History
; #InstallKeybdHook

; Win + Space キーによる IME 切替を無効化する
#Space:: Return

; BackSpace コンビネーションを Delete 扱いにする
^BS:: Send, {Del}    ; Ctrl
#BS:: Send, {Del}    ; Win
!BS:: Send, {Del}    ; Alt
+BS:: Send, {Del}    ; Shift

; CapsLock (英数キー) コンビネーションで Ctrl コンビネーションにする
; コンビネーションを定義しているため CapsLock 単独で押しても反応しなくなる
sc03A & z:: Send, ^z  ; Ctrl + z
sc03A & x:: Send, ^x  ; Ctrl + x
sc03A & c:: Send, ^c  ; Ctrl + c
sc03A & v:: Send, ^v  ; Ctrl + v
sc03A & b:: Send, ^b  ; Ctrl + b
sc03A & n:: Send, ^n  ; Ctrl + n
sc03A & m:: Send, ^m  ; Ctrl + m
sc03A & a:: Send, ^a  ; Ctrl + a
sc03A & s:: Send, ^s  ; Ctrl + s
sc03A & d:: Send, ^d  ; Ctrl + d
sc03A & f:: Send, ^f  ; Ctrl + f
sc03A & g:: Send, ^g  ; Ctrl + g
sc03A & h:: Send, ^h  ; Ctrl + h
sc03A & j:: Send, ^j  ; Ctrl + j
sc03A & k:: Send, ^k  ; Ctrl + k
sc03A & l:: Send, ^l  ; Ctrl + l
sc03A & q:: Send, ^q  ; Ctrl + q
sc03A & w:: Send, ^w  ; Ctrl + w
sc03A & e:: Send, ^e  ; Ctrl + e
sc03A & r:: Send, ^r  ; Ctrl + r
sc03A & t:: Send, ^t  ; Ctrl + t
sc03A & y:: Send, ^y  ; Ctrl + y
sc03A & u:: Send, ^u  ; Ctrl + u
sc03A & i:: Send, ^i  ; Ctrl + i
sc03A & o:: Send, ^o  ; Ctrl + o
sc03A & p:: Send, ^p  ; Ctrl + p

; Alt コンビネーションを Mac 風に使えるようにする
!z:: Send, ^z           ; Ctrl + z
!x:: Send, ^x           ; Ctrl + x
!c:: Send, ^c           ; Ctrl + c
!v:: Send, ^v           ; Ctrl + v
!b:: Send, ^b           ; Ctrl + b
!n:: Send, ^n           ; Ctrl + n
!m:: Send, ^m           ; Ctrl + m
!a:: Send, ^a           ; Ctrl + a
!s:: Send, ^s           ; Ctrl + s
!d:: Send, ^d           ; Ctrl + d
!f:: Send, ^f           ; Ctrl + f
!g:: Send, ^g           ; Ctrl + g
!h:: Send, ^h           ; Ctrl + h
!j:: Send, ^j           ; Ctrl + j
!k:: Send, ^k           ; Ctrl + k
!l:: Send, ^l           ; Ctrl + l
!q:: Send, !{F4}        ; Alt + F4 (Cmd + q)
!w:: Send, ^w           ; Ctrl + w
!e:: Send, ^e           ; Ctrl + e
!r:: Send, ^r           ; Ctrl + r
!t:: Send, ^t           ; Ctrl + t
!y:: Send, ^y           ; Ctrl + y
!u:: Send, ^u           ; Ctrl + u
!i:: Send, ^i           ; Ctrl + i
!o:: Send, ^o           ; Ctrl + o
!p:: Send, ^p           ; Ctrl + p
!Left:: Send, {Home}    ; Home
!+Left:: Send, +{Home}  ; Shift + Home
!Right:: Send, {End}    ; End
!+Right:: Send, +{End}  ; Shift + End


; Alt 単独で IME を切り替える
; ====================================================================================================


#Include NeosAutoHotKey-alt-ime-ahk.ahk


; ----------------------------------------------------------------------------------------------------
