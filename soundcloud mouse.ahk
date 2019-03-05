#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; na/na/na created
; 1/31/19 added middle mouse to toggle shift
; 3/4/19 improved toggle shift functionality, added plans

/* plans: add hold down to move a bunch, fix the tooltips, add gui with customizable  tooltips and delays between loops
          , move mouse to inside soundcloud window: get mouse pos, tp mouse, perform action, then tp mouse back to original location
          , volume control: shift up to increase, shift down to decrease. attach to scrolling? no because scrolling is necessary, maybe
            it could be put on like held right click and forward/backward buttons
          , looping: could do settimer with label and getkeystate - probably this, 
            or use getkeystate with while loop and sleep - sleeping is bad, or use button up - unreliable
          , disable when not in sc tab: ??? theres some activewindow thing, maybe that
          , improve tooltips: maybe not use tooltips, but what else? also they currently do not follow the mouse
          , gui with customizable controls/tooltips: lots of work and variables but pretty easy. maybe window summon with f11?
*/

trackSkipping := 0

XButton1::
    if (trackSkipping) { 
        send {shift down}
        send {left}
        send {shift up}
    } else {
        send {left}
    }
return
    
XButton2::
    if (trackSkipping) { 
        send {shift down}
        send {right}
        send {shift up}
    } else {
        send {right}
    }
return

; toggle shift being held or not, this allow for toggle between track seeking and track skipping
mbutton::
   if (trackSkipping) {
      trackSkipping := 0
      ToolTip, track seeking
      SetTimer, RemoveToolTip, -3000

   } else {
      trackSkipping := 1
      ToolTip, track skipping
      SetTimer, RemoveToolTip, -3000
   }
return

; subroutine to clear the displayed tooltip
RemoveToolTip:
   ToolTip
return


f12::ExitApp
