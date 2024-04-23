These are all my dotfiles used for configuring windows to my liking. 

<strike> I use komorebi and yasb to get a tiling window manager experience similar to dwm.

Install Koromebi and Yasb, shortcut their configs to the respective files in this folder. - yasb doesn't detect shortcutted config for some reason.

Tip: To avoid yasb from opening a python console in case of shell:startup autostarting the script, rename main.py to main.pyw.

Amethyst is another tiling window manager for windows that looked interesting and seems more automatic (and way easier to setup). </strike>

I primarily use AltSnap for all my window management needs

### Software

Some productivity software I use in my windows install:

* <strike> Komorebi + yasb </strike>
* <strike> AutoHotKey (required for komorebi) </strike>
* <strike> Win11DsiableRoundedCorners </strike>
* Powertoys
  * One really useful function is the keyboard remapper. I am using it to remap alt + shift + c to send alt f4 to close windows easily. 
 * Other things i use it for: AlwaysOnTop, Peek, FileExplorerAddons
* ZVirtualDesktop
   * zvirtualdesktop hotkeys are capslock+<number> to switch to desktop, capslock+alt+<number> to move window to desktop.
* **AltSnap** 👌👌👌 https://github.com/RamonUnch/AltSnap
   * I am using AltSnap (github fork of AltDrag) as my main window snapping tool as it seems better than using powertoys snap zones as well as the default windows snapping due to being able to alt drag and assign key shortcuts especially for hjkl. The altsnap window resizing is also super amazing especially because it works across two windows next to each other like dwm. It also lets you span a window across two zones easily by placing window in middle of them. Being able to selectively maximize a window quickly (like monocole) and it returnign easily to its place is also super good.
   * Some windows are buggy - elevate directly to adminstrator privileges
* Displayfusion
* StartAllBack
* Battery Percentage Icon (from the ms store)
* OneNoteGem - some features i use in onenote
* ChrisTitusTech's Ultimate windows utility
* On my thinkpad: Mouse Speed Switcher (because the max trackpoint sensitivity is too low for some dumbass reason, hopefully they will fix)
* <strike> WinSSHFS-GUI ( needs WINFSP, WINSSHFS) so i can have my laptop always connected </strike> - now using synctrayzor, WAY better
* SyncThing for syncing my laptop to desktop folders. https://github.com/syncthing/syncthing, more specifically GUI SyncTrayzor: https://github.com/canton7/SyncTrayzor
* Setup windows snipping tool as a shortcut and pin to taskbar for easy screenshots in tablet mode: https://winaero.com/add-screen-snip-taskbar-windows-10/

Some other stuff i use
* Parsec
* NoMachine (to connect to linux)
* Aster Multiseat (for media tv)
* ZeroTierOne (to connect to parsec on firewalled wifi)
* WinDirStat
* 7-Zip
* SpeedCrunch
* Onenote
* Firefox
* Onenote
* Vscode
* VR STUFF: Oculus, Steam, Using airlink on local wifi (well had to setup bridged access point server) but also can stream vr remotely using Sidequest with zerotier side loaded along with ALVR loaded (need to manually add the zerotier ip address in the computer settings side when pairing as opposed to the default one)
* Audacity, Ableton
* Ext2Fsd
* <strike> VoiceMeter Potato </strike>
* <strike> Equalizer APO + PEACE </strike> (EQ is cringe just vibe with the headphones engineered response)
  
Also sum good software occasionally I use for fun/hobbies:
* FreeCad, KiCad, LTSpice
* Scribus, Inkscape
* GIMP
* Darktable
* MultiMc
* Obs
* Davinci Resolve
* Blender
* Discord
  
# Mah keybinds for things:

[Caps] + [Number]              - Switch to desktop # (windows virtual desktops)

[Caps] + [Alt] + [Number]      - Move window to desktop #

[Alt] + [Shift] + c            - Close current window

[Alt] + [Left drag]            - Move window around

[Alt] + [Right drag]           - Resize window

[Alt] + [Shift] + [Left drag]  - Move window SNAP to zone

[Alt] + [Shift] + [Right drag] - Resize window RESIZE bordering zone windows

[Alt] + [Right click]          - Maximize window/Unmaximize (configured under Long drag-free in altsnap)




