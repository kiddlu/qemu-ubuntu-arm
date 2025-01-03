@echo on

:: -nographic
:: wget https://releases.linaro.org/components/kernel/uefi-linaro/latest/release/qemu64/QEMU_EFI.fd

"C:\Program Files\qemu\qemu-system-aarch64.exe" ^
    -smp 4 -m 4096 -M virt -bios QEMU_EFI.fd ^
    -device virtio-blk-device,drive=image ^
    -drive if=none,id=image,file=noble-server-cloudimg-arm64.img ^
    -netdev user,id=user0,hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23 -device virtio-net-device,netdev=user0 ^
    -cpu cortex-a72