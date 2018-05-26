### how to mount remote share directory
1. link: https://linhost.info/2012/05/mount-a-network-share-in-linux-ubuntu/
1. simple steps
  1. yum install cifs-utils
  1. mount.cifs //192.168.1.107/share1/  /mnt/shares/share1/ -o user=user1,pass=user1password
  1. also can add it to fstab for mount at boot.
1. sample: sudo mount.cifs //10.0.0.21/home /mnt/21home/ -o user=ng
