~sc07B::Return                  ;���ϊ��P�Ƃ͂��̂܂ܑf�ʂ�
~sc079::Return                  ;�ϊ��P�Ƃ͂��̂܂ܑf�ʂ�

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
		send, {Blind}{Left}
	Return
sc07B & f::
	If GetKeyState("Ctrl", "P")
		send, {Blind}{Right}
	Return
sc07B & p::
	If GetKeyState("Ctrl", "P")
		send, {Blind}{Up}
	Return
sc07B & n::
	If GetKeyState("Ctrl", "P")
		send, {Blind}{Down}
	Return
sc07B & a::
	If GetKeyState("Ctrl", "P")
		send, {Blind}{Home}
	Return
sc07B & e::
	If GetKeyState("Ctrl", "P")
		send, {Blind}{End}
	Return
sc07B & d::
	If GetKeyState("Ctrl", "P")
		send, {Blind}{Del}
	Return
sc07B & k::
	If GetKeyState("Ctrl", "P")
		send,+{Blind}{End}{Del}
	Return
sc07B & u::
	If GetKeyState("Ctrl", "P")
		send,+{Blind}{Home}{Del}
	Return
sc07B & w::
	If GetKeyState("Ctrl", "P")
		send, ^{Blind}{BS}
	Return
sc07B & y::
	If GetKeyState("Ctrl", "P")
		send, ^{Blind}{v]
	Return
sc07B & q::
	If GetKeyState("Ctrl", "P")
		send, {ESC}
	Return
!f::
	If GetKeyState("Ctrl", "P")
		send, ^{Blind}{Right}
	Return
!b::
	If GetKeyState("Ctrl", "P")
		send, ^{Blind}{Left}
	Return
!d::
	If GetKeyState("Ctrl", "P")
		send, ^{Blind}{Del}
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
; �ϊ� + H/L = �X�N���[��
sc079 & j::WheelDown
sc079 & k::WheelUp
sc079 & h::Send,!{Left}
sc079 & l::Send,!{Right}
sc079 & u::Send,{Blind}{End}
sc079 & i::Send,{Blind}{Home}
sc079 & n::Send,#+{left}
sc079 & .::Send,#+{Right}
sc079 & o::WinMinimize,A
sc079 & y::WinMaximize,A 
sc079 & sc028::Send,{Enter}
