https://forums.fedoraforum.org/showthread.php?300542-ThinkPad-X240-Remap-PrtSc-key-to-Right-Click-Menu-Context-Menu

install dconf-editor
search media-keys 
remove the binding of printscreen



e , paste the ori answer here :

If you are not happy with "PrtSc" key and missing Context Menu/ Menu/ Right Click key...
read below to asign Context Menu/ Menu/ Right Click to PrtSc

1.
Usually, some program handles print screen and you need to unbind it. I've used dconf-editor to do so. 
I am using cinemon desktop.
a. Open dconf-editor, navigate to 
org -> cinnamon -> settings-daemon -> plugins -> media-keys
b. In right side find Screenshot and delete value in it.


2. 
Open a teminal and dump the current keyboard map to a new file in your home directory called ".xmodmap" file
xmodmap -pke > ~/.xmodmap

3.
Using vim/ gedit/ any text editor open .xmodmap file

4. 
Find keycode 107 = Print Sys_Req Print Sys_Req in .xmodmap file. This is keycode for PrtSc and change it to
keycode 107 = Menu NoSymbol Menu

5.
Save .xmodmap file and close it.

6.
Import the modified keymap
xmodmap ~/.xmodmap

7.
Now your PrtSc key is binded to Context Menu/ Menu key/ Right Click.

