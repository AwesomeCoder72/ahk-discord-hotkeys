#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

Enter::
if winactive("ahk_exe Discord.exe")
{
    ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, reply_on2.png
    newX:= x+3
    newY:= y+3
    if (errorlevel = 1)
    {
        ; msgBox, not_found
        send {Enter}
    }
    else if (errorlevel = 0)
    {
        MouseGetPos, startX, startY 
        MouseMove, %newX%, %newY%
        MouseGetPos, xpos, ypos 
        MouseClick, Left, %xpos%, %ypos%
        send {Enter}{Enter}
        MouseMove, %startX%, %startY%
        ; MouseMove, xpos-50, ypos+20
    }
}
else
{
    send {Enter}
}