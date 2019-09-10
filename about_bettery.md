# load internal battery when below 65%
sudo tpacpi-bat -s ST 1 65
# stop charging at 95%
sudo tpacpi-bat -s SP 1 95 
# how to view battery's status 
cat /sys/class/power_supply/BAT0/uevent
