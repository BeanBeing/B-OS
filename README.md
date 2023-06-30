# B-OS
An Operating System I'm working on to learn some assembly, computer architecture, and systems programming on the side

# To Install
```
clone this repository
run make
then run the .img file located in build folder in a virtual-machine/hypervisor like qemu, vmware, virtualbox, etc...
```
# If you have QEMU/KVM then run the .img file like so:
```
make; qemu-system-i386 -fda build/main_floppy.img
```
