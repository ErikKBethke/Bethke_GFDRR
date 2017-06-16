; AutoHotkey Version: AutoHotkey 1.1
; Language:           English
; Platform:           Win10
; Author:             Erik Bethke
; Short description:  AutoHotkey Script that creates different shortcuts to navigate through GeoNode-Gfdrrlab.org
; Last Mod:           2017-06-16

Menu, Tray, Icon, % A_WinDir "\system32\netshell.dll", 86 ; Shows a world icon in the system tray

; Navigate to metadata, (Alt + C)
!c::
    baseURL = http://www.geonode-gfdrrlab.org/layers/
    endURL = /metadata
	Send !d
    Sleep 50
    clipboard = %clipboard%
    regexmatch(clipboard, "hazard(.*)", layerName)
    Clipboard := baseURL . layerName . endURL
    Sleep 50
    Send ^v
    Sleep 50
    Send {Enter}
Return

; Navigate to styling management, (Ctrl + Alt + C)
^!c::
    baseURL = http://www.geonode-gfdrrlab.org/gs/
    endURL = /style/manage
    Send !d
    Sleep 50
    clipboard = %clipboard%
    regexmatch(clipboard, "hazard(.*)", layerName)
    Clipboard := baseURL . layerName . endURL
    Sleep 50
    Send ^v
    Sleep 50
    Send {Enter}
Return

; Set thumbnail, (Alt + X)
!x::
    baseURL = http://www.geonode-gfdrrlab.org/layers/
    endURL = #
	Send !d
    Sleep 50
    Send ^c
    clipboard = %clipboard%
    regexmatch(clipboard, "hazard(.*)", layerName)
    Clipboard := baseURL . layerName . endURL
    Sleep 50
    Send ^v
    Sleep 50
    Send {Enter}
Return

; Update metadata autoclick , (Alt + E)
!e::
    Send ^+j
    Sleep 500
    Send, form = document.getElementById("layer_metadata_update")
    Sleep 50
    Send, {Enter}
    Sleep 500
    Send, form.submit()
    Sleep 50
    Send, {Enter}
    Sleep 500
    Send ^+j
Return
