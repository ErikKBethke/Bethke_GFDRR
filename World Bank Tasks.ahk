; AutoHotkey Version: AutoHotkey 1.1
; Language:           English
; Platform:           Win7 SP1 / Win8.1 / Win10
; Author:             Erik Bethke
; Short description:  Gets the URL of the current (active) browser tab for the GeoNode layer webpage, then navigates to various pages
; Last Mod:           2017-06-09

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
