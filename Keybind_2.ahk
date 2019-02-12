~sc07B::Return                  ;無変換単独はそのまま素通し
~sc079::Return                  ;変換単独はそのまま素通し

^m::Send,{Enter}
^h::Send,{BS}
^+h::Send,!{Right}
!4::Send,!{F4}

sc07B & m::
	If GetKeyState("Ctrl", "P")
		send, {Enter}
	Return
sc07B & h::
	If GetKeyState("Ctrl", "P")
		send, {BS}
	Return
sc07B & b::
	If GetKeyState("Ctrl", "P")
		send, {Left}
	Return
	If GetKeyState("Alt", "P")
		send, ^{Left}
	Return
sc07B & f::
	If GetKeyState("Ctrl", "P")
		send, {Right}
	Return
	If GetKeyState("Alt", "P")
		send, ^{Right}
	Return
sc07B & p::
	If GetKeyState("Ctrl", "P")
		send, {Up}
	Return
sc07B & n::
	If GetKeyState("Ctrl", "P")
		send, {Down}
	Return
sc07B & a::
	If GetKeyState("Ctrl", "P")
		send, {Home}
	Return
sc07B & e::
	If GetKeyState("Ctrl", "P")
		send, {End}
	Return
sc07B & d::
	If GetKeyState("Ctrl", "P")
		send, {Del}
	else GetKeyState("Alt", "P")
		send, ^{Del}
	Return
sc07B & k::
	If GetKeyState("Ctrl", "P")
		send,+{End}{Del}
	Return
sc07B & u::
	If GetKeyState("Ctrl", "P")
		send,+{Home}{Del}
	Return
sc07B & w::
	If GetKeyState("Ctrl", "P")
		send, ^{BS}
	Return
sc07B & y::
	If GetKeyState("Ctrl", "P")
		send, ^{v]
	Return
sc07B & q::
	If GetKeyState("Ctrl", "P")
		send, {ESC}
	Return
; FPSでよく使うWASDキーをマウスカーソルの移動に使う
; 変換 + WASD = マウスカーソル上, 左, 下, 右
sc079 & W::
sc079 & A::
sc079 & S::
sc079 & D::
    While (GetKeyState("sc079", "P"))           ;式を評価した結果が真である間、一連の処理を繰り返し実行する
    {
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("W", "P") ? -11 : 0    ;GetKeyState() と ?:演算子(条件) (三項演算子) の組み合わせ
        MoveX += GetKeyState("A", "P") ? -11 : 0
        MoveY += GetKeyState("S", "P") ? 11 : 0
        MoveX += GetKeyState("D", "P") ? 11 : 0
        MouseMove, %MoveX%, %MoveY%, 1, R           ;マウスカーソルを移動する
        Sleep, 0                                    ;負荷が高い場合は設定を変更 設定できる値は-1、0、10～m秒 詳細はSleep
    }
    Return

; 変換 + M = 左クリック（押し続けるとドラッグ）
sc079 & M::MouseClick,left,,,,,D
sc079 & M Up::MouseClick,left,,,,,U
; 変換 + , = 右クリック（押し続けるとドラッグ）
sc079 & ,::MouseClick,Right,,,,,D
sc079 & , Up::MouseClick,Right,,,,,U
; 変換 + J/KS = スクロール
sc079 & j::WheelDown
sc079 & k::WheelUp
sc079 & h::Send,!{Left}
sc079 & l::Send,!{Right}
sc079 & u::Send,{Blind}{End}
sc079 & i::Send,{Blind}{Home}
sc079 & n::Send,#+{left}
sc079 & .::Send,#+{Right}
sc079 & o::WinMaximize,A
sc079 & y::WinMinimize,A
sc079 & sc027::Send,{Enter}
