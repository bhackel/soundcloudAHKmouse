#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;na/na/na created
;1/31/19 added middle mouse to toggle shift

;plans: add hold down to move a bunch, fix the tooltips, add gui with customizable  tooltips and delays between loops, maybe volume control

shiftHeld := 0

XButton1::send {left}
XButton2::send {right}

mbutton::
   if (shiftHeld) {
      shiftHeld := 0
      send {shift up}
      ToolTip, track seeking
      SetTimer, RemoveToolTip, -3000

   } else {
      shiftHeld := 1
      send {shift down}
      ToolTip, track skipping
      SetTimer, RemoveToolTip, -3000
   }
return


RemoveToolTip:
   ToolTip
return


f12::ExitApp