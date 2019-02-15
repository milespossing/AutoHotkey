#IfWinActive ahk_class CabinetWClass
	F6::
		;RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState, FullPath, 1
		title := Explorer_GetPath()
		Run, C:\Program Files (x86)\Everything\Everything.exe -path "%title%"
		WinWaitActive, Everything,, 3
		If Errorlevel
			Return
		Send {End}
	Return

	F7::
		title := Explorer_GetPath()
		Run, C:\Program Files\grepWin\grepWin.exe /searchpath:"%title%"
		WinActivate, grepWin,, 3
		If ErrorLevel
			Return
	Return

	Esc::
		If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
			WinClose
		Else
			Send, {Esc}
		Return

	+Backspace::Send !{Up}

	^k::
		clipboard := Explorer_GetSelected()
		ClipWait
		Notify("File Dir Copied",clipboard,-1,"Style=Win10")
		return

	^l::
		dir := Explorer_GetPath()
		clipboard := dir
		ClipWait
		Notify("File Dir Copied",clipboard,-1,"Style=Win10")
		return

	CapsLock::
		If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
		{
			FullFileName := Explorer_GetSelected()
			SplitPath, FullFileName, name, dir, ext, name_no_ext, drive
			clipboard := name
			ClipWait
			Notify("Filename Copied",clipboard,-1,"Style=Win10")
		}
	Return

	^+P::
		dir := Explorer_GetPath()
		Run powershell -NoExit -command "cd '%dir%'"
		Return

	^e::
	+Enter::
		sel := Explorer_GetSelected() Run %Editor% "%sel%"
		Return

	^+e::
		sel := Explorer_GetSelected()
		Run vim "%sel%"
		Return

	^+Enter::
		sel := Explorer_GetSelected()
		Run %Editor% --add "%FullFileName%"
		Return
#IfWinActive

#IfWinActive ahk_class SearchPane
	Tab::Send {Tab}{Down}{Enter}
#IfWinActive

#IfWinActive, ahk_class #32770 Run
	Tab::Down
#IfWinActive
