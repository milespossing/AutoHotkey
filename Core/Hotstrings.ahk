;#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; Hotstrings ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:ahkskel::{#}NoEnv`n{#}WinActivateForce`n{#}SingleInstance force`nSendMode Input`nSetWorkingDir %A_ScriptDir%`nSetTitleMatchMode, 2`n
:*:ahk;::AutoHotkey
:*:st;::Sublime Text
:*:js;::javascript
::currdate::
	FormatTime, today, A_Now, M/d/yyyy
	Sleep, 100 ; Needed for VS Code
	SendInput, %today%
	Return
::currtime::
	FormatTime, now, A_Now, h:mmtt
	Sleep, 100 ; Needed for VS Code
	Send % now
	Return

:*:lmk..::let me know

:*:comspec;::RunWait, `%comspec`% /c "",, Hide{Ctrl Down}{Left 2}{Ctrl Up}{Right}

#If

#IfWinActive, Windows Security
	:*:adm;::Administrator{Tab}
#IfWinActive

:*:+la;::(?=){Left}
:*:-la;::(?{!}){Left}
:*:+lb;::(?<=){Left}
:*:-lb;::(?<{!}){Left}



:*:header;::
	linelen := strlen(clipboard) + 20

	Send, {`; %linelen%}`n
	Send, {`; 9}{Space}
	Send, % clipboard
	Send, {Space}{`; 9}`n
	Send, {`; %linelen%}`n
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; File Paths ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:*:pd;::`%ProgramData`%
:*:ad;::`%AppData`%


;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; URLS ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
