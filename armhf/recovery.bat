@echo on

::-nographic 
:: ro recovery nomodeset

"C:\Program Files\qemu\qemu-system-arm.exe" ^
  -kernel vmlinuz ^
  -initrd initrd.img ^
  -append "root=/dev/vda1 ro recovery nomodeset" ^
  -no-reboot ^
  -smp 2 ^
  -m 1024 ^
  -M virt ^
  -device virtio-blk-device,drive=image ^
  -drive if=none,id=image,file=ubuntu-16.04-server-cloudimg-armhf-disk1.img ^
  -netdev user,id=user0 -device virtio-net-device,netdev=user0 -redir tcp:666::22

:: wget http://ports.ubuntu.com/ubuntu-ports/dists/xenial/main/installer-armhf/current/images/generic-lpae/netboot/initrd.gz
:: wget http://ports.ubuntu.com/ubuntu-ports/dists/xenial/main/installer-armhf/current/images/generic-lpae/netboot/vmlinuz
:: tab ctl+alt hjkl
::open in 7zip