@echo on

:: -nographic 
:: ro recovery nomodeset

start "" "C:\Program Files\qemu\qemu-system-arm.exe" ^
  -kernel vmlinuz ^
  -initrd initrd.img ^
  -append "root=/dev/vda1" ^
  -no-reboot ^
  -smp 2 ^
  -m 1024 ^
  -M virt ^
  -device virtio-blk-device,drive=image ^
  -drive if=none,id=image,file=ubuntu-16.04-server-cloudimg-armhf-disk1.img ^
  -netdev user,id=user0,hostfwd=tcp::50022-:22,hostfwd=tcp::50555-:5555,hostfwd=tcp::55037-:5037 ^
  -device e1000,netdev=user0

:: wget http://ports.ubuntu.com/ubuntu-ports/dists/xenial/main/installer-armhf/current/images/generic-lpae/netboot/initrd.gz
:: wget http://ports.ubuntu.com/ubuntu-ports/dists/xenial/main/installer-armhf/current/images/generic-lpae/netboot/vmlinuz