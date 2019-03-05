#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;na/na/na created
;1/31/19 added middle mouse to toggle shift
;3/4/19 improved toggle shift functionality

;plans: add hold down to move a bunch, fix the tooltips, add gui with customizable  tooltips and delays between loops, maybe volume control

shiftHeld := 0

XButton1::
    if (shiftHeld) { 
        send {shift down}
        send {left}
        send {shift up}
    } else {
        send {left}
    }
return
    
XButton2::
    if (shiftHeld) { 
        send {shift down}
        send {right}
        send {shift up}
    } else {
        send {right}
    }
return

mbutton::
   if (shiftHeld) {
      shiftHeld := 0
      ToolTip, track seeking
      SetTimer, RemoveToolTip, -3000

   } else {
      shiftHeld := 1
      ToolTip, track skipping
      SetTimer, RemoveToolTip, -3000
   }
return


RemoveToolTip:
   ToolTip
return


f12::ExitApp
