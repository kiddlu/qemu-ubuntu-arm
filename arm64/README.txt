 tab ctl+alt hjkl
open in 7zip
ping/icmp无法穿透，dns设置获取不到，需要手动编辑/etc/hosts



cloud init
systemctl disable cloud-init-local cloud-init cloud-config cloud-final
systemctl stop cloud-init-local cloud-init cloud-config cloud-final


qemu-w64-setup-20171006.exe on windows

/dev/vda
host
"C:\Program Files\qemu\qemu-img.exe"  info ubuntu-16.04-server-cloudimg-armhf-disk1.img
"C:\Program Files\qemu\qemu-img.exe"  resize ubuntu-16.04-server-cloudimg-armhf-disk1.img +5G

guest
root@ubuntu:~# fdisk /dev/vda

Welcome to fdisk (util-linux 2.27.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Command (m for help): d
Selected partition 1
Partition 1 has been deleted.

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-15097855, default 2048):
Last sector, +sectors or +size{K,M,G,T,P} (2048-15097855, default 15097855):

Created a new partition 1 of type 'Linux' and of size 7.2 GiB.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Re-reading the partition table failed.: Device or resource busy

The kernel still uses the old table. The new table will be used at the next reboot or after you run partprobe(8) or kpartx(8).

root@ubuntu:~# partprobe

resize2fs /dev/vda1