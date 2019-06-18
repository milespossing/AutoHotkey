exe=%1%
title=%2%
SetTitleMatchMode 2
if(WinExist(title))
    WinActivate
else
    Run %exe%
return