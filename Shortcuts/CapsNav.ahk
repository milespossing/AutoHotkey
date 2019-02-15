;;;;; CapsNav ;;;;;;;

^+CapsLock::CapsLock

CapsLock & h::
	If GetKeyState("lctrl")
		CapsNav("Left","^")
	Else
		CapsNav("Left")
Return

CapsLock & j::
	If GetKeyState("lctrl")
		CapsNav("Down","^")
	Else
		CapsNav("Down")
Return

CapsLock & k::
	If GetKeyState("lctrl")
		CapsNav("Up","^")
	Else
		CapsNav("Up")
Return

CapsLock & l::
	If GetKeyState("lctrl")
		CapsNav("Right","^")
	Else
		CapsNav("Right")
Return


CapsLock & n::CapsNav("Home")
CapsLock & p::CapsNav("End")

CapsLock & .::
CapsLock & o::CapsNav("Right", "^")
CapsLock & m::CapsNav("Left", "^")

CapsLock & u::CapsNav("PgDn")
CapsLock & i::CapsNav("PgUp")

CapsLock & BackSpace::
	If GetKeyState("alt")
		Send, ^{Delete}
	Else
		Send, {Delete}
Return

; CapsLock & `;::
; CapsLock & ,::
; Return

CapsNav(action, initmod = "", mod = "+")
{
	If ! GetKeyState("alt")
		Send % initmod "{" action "}"
	Else
		Send % mod . initmod "{" action "}"
	SetCapsLockState, AlwaysOff
}

KPSplashOff:
   SplashImage, off
Return
