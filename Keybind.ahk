^!r::Reload
^!e::Edit

~sc07B::Return                  ;���ϊ��P�Ƃ͂��̂܂ܑf�ʂ�
~sc079::Return                  ;�ϊ��P�Ƃ͂��̂܂ܑf�ʂ�
sc070::Shift

Alt::
	Send, {ESC}
Return

^m::Send,{Enter}
+^m::Send,+{Enter}
^j::Send,{Enter}
+^j::Send,+{Enter}
^h::Send,{BS}
^+h::Send,!{Right}
!4::Send,!{F4}

captureOrActive(ByRef id)
{
  if GetKeyState("ctrl", "P") {
    WinGet, id, ID, A
  } else {
    WinActivate, ahk_id %id%
  }     
  return
}

; ���ϊ�(sc07B)
sc07B & 1:: captureOrActive(id1)
sc07B & 2:: captureOrActive(id2)
sc07B & 3:: captureOrActive(id3)
sc07B & 4:: captureOrActive(id4)
sc07B & 5:: captureOrActive(id5)
sc07B & 6:: captureOrActive(id6)
sc07B & 7:: captureOrActive(id7)
sc07B & 8:: captureOrActive(id8)
sc07B & 9:: captureOrActive(id9)
sc07B & 0:: captureOrActive(id10)


sc079 & 1:: #1
sc079 & 2:: #2
sc079 & 3:: #3
sc079 & 4:: #4
sc079 & 5:: #5
sc079 & 6:: #6
sc079 & 7:: #7
sc079 & 8:: #8
sc079 & 9:: #9
sc079 & 0:: #0

^1::send,{F1}
^2::send,{F2}
^3::send,{F3}
^4::send,{F4}
^5::send,{F5}
^6::send,{F6}
^7::send,{F7}
^8::send,{F8}
^9::send,{F9}
^0::send,{F10}
^-::send,{F11}
^^::send,{F12}

+^1::send,+{F1}
+^2::send,+{F2}
+^3::send,+{F3}
+^4::send,+{F4}
+^5::send,+{F5}
+^6::send,+{F6}
+^7::send,+{F7}
+^8::send,+{F8}
+^9::send,+{F9}
+^0::send,+{F10}
+^-::send,+{F11}
+^^::send,+{F12}


sc07B & Tab::AltTabMenu
sc07B & sc027::
	If GetKeyState("Ctrl", "P")
		FormatTime,TimeString,,yyyyMMdd
		Send,%TimeString%_
	Return
sc07B & sc028::
	If GetKeyState("Ctrl", "P")
		FormatTime,TimeString,,Time
		Send,%TimeString%
	Return
sc07B & m::
	If GetKeyState("Ctrl", "P")
		If GetKeyState("Shift", "P")
			send, +{Enter}
		Else
			send, {Enter}	
	Return
sc07B & j::
	If GetKeyState("Ctrl", "P")
		If GetKeyState("Shift", "P")
			send, +{Enter}
		Else
			send, {Enter}	
	Return
sc07B & h::
	If GetKeyState("Ctrl", "P")
		send, {BS}
	Return
sc07B & b::
	If GetKeyState("Ctrl", "P")
		If GetKeyState("Shift", "P")
			send, +{Left}
		Else
			send, {Left}
	Else If GetKeyState("Shift", "P")
		send, +^{Left}
	Else
		send, ^{Left}
	Return
sc07B & f::
	If GetKeyState("Ctrl", "P")
		If GetKeyState("Shift", "P")
			send, +{Right}
		Else
			send, {Right}
	Else If GetKeyState("Shift", "P")
		send, +^{Right}
	Else
		send, ^{Right}
	Return
sc07B & p::
	If GetKeyState("Ctrl", "P")
		If GetKeyState("Shift", "P")
			send, +{Up}
		Else
			send, {Up}
	Return
sc07B & n::
	If GetKeyState("Ctrl", "P")
		If GetKeyState("Shift", "P")
			send, +{Down}
		Else
			send, {Down}
	Return
sc07B & a::
	If GetKeyState("Ctrl", "P")
		If GetKeyState("Shift", "P")
			send, +{Home}
		Else
			send, {Home}
	Return
sc07B & e::
	If GetKeyState("Ctrl", "P")
		If GetKeyState("Shift", "P")
			send, +{End}
		Else
			send, {End}
	Return
sc07B & d::
	If GetKeyState("Ctrl", "P")
		send, {Delete}
	Else
		send, ^{Delete}
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
sc07B & l::
	If GetKeyState("Ctrl", "P")
		send, ^{a}{BS}
	Return

; FPS�ł悭�g��WASD�L�[���}�E�X�J�[�\���̈ړ��Ɏg��
; �ϊ� + WASD = �}�E�X�J�[�\����, ��, ��, �E
sc079 & W::
sc079 & A::
sc079 & S::
sc079 & D::
    While (GetKeyState("sc079", "P"))           ;����]���������ʂ��^�ł���ԁA��A�̏������J��Ԃ����s����
    {
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("W", "P") ? -11 : 0    ;GetKeyState() �� ?:���Z�q(����) (�O�����Z�q) �̑g�ݍ��킹
        MoveX += GetKeyState("A", "P") ? -11 : 0
        MoveY += GetKeyState("S", "P") ? 11 : 0
        MoveX += GetKeyState("D", "P") ? 11 : 0
        MouseMove, %MoveX%, %MoveY%, 1, R           ;�}�E�X�J�[�\�����ړ�����
        Sleep, 0                                    ;���ׂ������ꍇ�͐ݒ��ύX �ݒ�ł���l��-1�A0�A10�`m�b �ڍׂ�Sleep
    }
    Return

; �ϊ� + M = ���N���b�N�i����������ƃh���b�O�j
sc079 & M::MouseClick,left,,,,,D
sc079 & M Up::MouseClick,left,,,,,U
; �ϊ� + , = �E�N���b�N�i����������ƃh���b�O�j
sc079 & ,::MouseClick,Right,,,,,D
sc079 & , Up::MouseClick,Right,,,,,U
; �ϊ� + J/K = �X�N���[��
sc079 & j::WheelDown
sc079 & k::WheelUp
sc079 & h::Send,!{Left}
sc079 & l::Send,!{Right}
sc079 & sc027::Send,{Enter}
sc079 & sc028::MouseMove,800,500,0
sc079 & u::Send,{Blind}{End}
sc079 & i::Send,{Blind}{Home}
sc079 & o::
	If GetKeyState("sc07B", "P")
		Send,#{Home}
	Else
		WinMaximize,A
	Return
sc079 & y::
	If GetKeyState("sc07B", "P")
		Send,#d
	Else
		WinMinimize,A
	Return
sc079 & n::
	If GetKeyState("sc07B", "P")
		Send,#{left}
	Else
		Send,#+{left}
	Return
sc079 & .::
	If GetKeyState("sc07B", "P")
		Send,#{Right}
	Else
		Send,#+{Right}
	Return
