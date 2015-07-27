#Foundation_Platform --cores=4 --image kernel.axf

/soft/qemu/bin/qemu-system-aarch64 -machine virt -cpu cortex-a57 -smp 4 -m 4096 -kernel kernel.axf -serial stdio 
