### gnome screensaver always get bad focus
1. switch to another tty
1. ps -ef | grep screensaver
1. kill screensaver
1. loginctl --unlock-sessions
