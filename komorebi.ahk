; Dependency files from the koromebi git:
; iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/master/komorebic.lib.ahk -OutFile $Env:USERPROFILE\komorebic.lib.ahk
; iwr https://raw.githubusercontent.com/LGUG2Z/komorebi/master/komorebi.generated.ahk -OutFile $Env:USERPROFILE\komorebi.generated.ahk

; good reference: https://gist.github.com/crosstyan/dafacc0778dabf693ce9236c57b201cd

#SingleInstance Force

; You can generate a fresh version of this file with "komorebic ahk-library"
#Include %A_ScriptDir%\komorebic.lib.ahk
; https://github.com/LGUG2Z/komorebi/#generating-common-application-specific-configurations
#Include %A_ScriptDir%\komorebi.generated.ahk

Sleep, 10000 ; Wait 10 seconds to make sure the komorebic service is started on start. (unfortunately it delays reload but easiest solution)

; Default to minimizing windows when switching workspaces
WindowHidingBehaviour("hide")

; Set cross-monitor move behaviour to insert instead of swap
CrossMonitorMoveBehaviour("insert")

; Enable hot reloading of changes to this file
WatchConfiguration("enable")

; make 6 workspaces on 2 monitors
EnsureWorkspaces(0, 6)
EnsureWorkspaces(1, 6)

; Configure the invisible border dimensions
InvisibleBorders(7, 0, 14, 7)

MouseFollowsFocus(false)

defaultLayout := "vertical-stack" ; vertical stack is like the dwm master stack layout

;Make resize amount
ResizeDelta(60)

ActiveWindowBorderColour(66, 165, 245, "single")
ActiveWindowBorderWidth(2) 
ActiveWindowBorder("disable")   ; this is quite buggy right now so disabling, border width not working yet specifically.

workspaceNumbers := [0,1,2,3,4,5]
monitorNumbers := [0,1]

for monIndex, monnum in monitorNumbers {
    for workIndex, worknum in workspaceNumbers {
        WorkspaceLayout(monnum, worknum, defaultLayout)   
        WorkspacePadding(monnum, worknum, 3)
        ContainerPadding(monnum, worknum, 3)
    }
}

; Screen orientation checker, set layout if the screen is oriented (for my thinkpad yoga)
vertical := false
Loop
{
    if (A_ScreenWidth < A_ScreenHeight and not vertical) {
        vertical := true
        ChangeLayout("rows")

    }
    else if(A_ScreenWidth > A_ScreenHeight and vertical) {
        vertical := false
        ChangeLayout(defaultLayout)
    }

    Sleep, 500
}

; Make monocle act more like dwm, aka like another layout instead of toggle
global monocleOn := false ; keep track of when monocle is on so it can be turned off when switching to other layouts. Simulates dwm behavior where monocle is a seperate layout itself
setMonocleOff() {
    if(monocleOn) {
        ToggleMonocle()
        monocleOn := false
    }
}
setMonocleOn() {
    if(not monocleOn) {
        ToggleMonocle()
        monocleOn := true
    }
}


; Allow komorebi to start managing windows
CompleteConfiguration()


; Master keys

; retile everything if it gets stuck
!+r::
Retile()
return

; quit komorebi
!+q::
Stop()
return

; start komorebi Again
!+s::
RunWait, komorebic.exe start, , Hide
Reload  ; Reload script because for some reason komorebi not detecting script, loads config.
return

; toggle tiling on focused workspace (acts like floating layout)
!+t::
ToggleTiling()
return

; Close focused app
!+c::
Close()
return


; Focus keys

; using cycle focus instead of the directional movement to emulate a more dwm-like experience
!j::
CycleFocus("previous")
return

!k::
CycleFocus("next")
return

; !h::
; Focus("left")
; return
; 
; !j::
; Focus("down")
; return
; 
; !k::
; Focus("up")
; return
; 
; !l::
; Focus("right")
; return


; Move keys
; Again, using cycle keys instead of directional movement to emulate dwm
!+j::
CycleMove("previous")
return

!+k::
CycleMove("next")
return

; !+h::
; Move("left")
; return
; 
; !+j::
; Move("down")
; return
; 
; !+k::
; Move("up")
; return
; 
; !+l::
; Move("right")
; return


; Layout switching

!t::
setMonocleOff()
ChangeLayout("vertical-stack")
return

!b::
setMonocleOff()
ChangeLayout("bsp")
return

!c::
setMonocleOff()
ChangeLayout("columns")
return

!r::
setMonocleOff()
ChangeLayout("rows")
return

!e::
setMonocleOff()
ChangeLayout("ultrawide-vertical-stack")

!+Space::
ToggleFloat()
return

!m::
setMonocleOn()
return


; disabled because not working properly
; Window resizing (mfact)

; !h::
; ResizeAxis("horizontal", "increase")
; return
;
; !l::
; ResizeAxis("horizontal", "decrease")
; return



; Workspace focusing
; Originally I had the fear that this one interfere with onenote alt+number function which i use a lot, but i realized in onenote(and most ms apps) you can press alt+key in sequence without chording it making it not interfere with my shortcuts here.

!1::
FocusWorkspace(0)
return

!2::
FocusWorkspace(1)
return

!3::
FocusWorkspace(2)
return

!4::
FocusWorkspace(3)
return

!5::
FocusWorkspace(4)
return

!6::
FocusWorkspace(5)
return

; Workspace sending (moving will follow action, sending will send and stay on current workspace)

!+1::
SendToWorkspace(0)
return

!+2::
SendToWorkspace(1)
return

!+3::
SendToWorkspace(2)
return

!+4::
SendToWorkspace(3)
return

!+5::
SendToWorkspace(4)
return

!+6::
SendToWorkspace(5)
return


; Monitor focusing

!,::
CycleMonitor("left")
return

!.::
CycleMonitor("right")
return

; Monitor sending (again not moving, it wont follow window)
; For some reason there is no option to cycle so this method only works with 2 monitors for now

!+,::
SendToMonitor(0)
return

!+.::
SendToMonitor(1)
return