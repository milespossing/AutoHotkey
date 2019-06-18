#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#WinActivateForce
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, RegEx
SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
CoordMode, Mouse, Screen
DetectHiddenWindows, On

Menu, Tray, Tip, Work Script

If (FileExist(A_ScriptDir "\lib\images\testing.ico"))
	Menu, Tray, Icon, % A_ScriptDir "\lib\images\testing.ico"

; Globals
SysGet, MonitorCount, MonitorCount
SysGet, MonitorWorkArea, MonitorWorkArea
EnvGet, Domain, USERDOMAIN
UserDir := "C:\Users\" A_UserName
Editor := "C:\Users\miles.possing\AppData\Local\Programs\Microsoft VS Code\Code.exe"
kbdIndex := 17 ; GMMK

Notify(A_ScriptName " Started!","",-3,"Style=Win10")

CheckAdmin()

RunIfExist(A_ScriptDir "\Utilities\VolumeScroll\VolumeScroll.ahk")

IfWinNotExist, ahk_exe clipx.exe
	RunProgFiles("ClipX\clipx.exe")

CreateStartupShortcut()
Return ; End Auto-Execute



#Include %A_ScriptDir%\Core\Functions.ahk
#Include %A_ScriptDir%\Core\Shortcuts.ahk
#Include %A_ScriptDir%\Core\AppSpecific.ahk
#Include %A_ScriptDir%\Core\Hotstrings.ahk

#Include *i %A_ScriptDir%\Utilities\FormatAHK.ahk
; #Include *i %A_ScriptDir%\Core\WinControl.ahk

^!r::	Reload
^!e::	Edit(".", Editor)
^!F9::	Edit("test.ahk", Editor)
^!F10::	Edit("Core\Hotstrings.ahk", Editor)
^!F11::	Edit("Core\Shortcuts.ahk", Editor)
^!F12::	Edit("Core\Functions.ahk", Editor)
^!PrintScreen:: Edit("Work.ahk",Editor)

!t::	Run, Test.ahk

^NumpadEnter::Edit("Core\Shortcuts.ahk", Editor)

+Pause::Suspend

^!x::AHKPanic(1,0,0,1)

#Include %A_ScriptDir%\lib\VA.ahk
#Include %A_ScriptDir%\lib\TF.ahk
#Include %A_ScriptDir%\lib\Notify.ahk
#Include %A_ScriptDir%\lib\Explorer.ahk