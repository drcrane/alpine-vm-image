#!/bin/sh

qemu-system-x86_64 \
	-machine pc-q35-2.10 \
	-net nic,model=virtio,macaddr=00:00:CA:FE:BA:BE \
	-net tap,ifname=tap11,script=no,downscript=no \
	-vnc 127.0.0.1:11 \
	-serial tcp:localhost:6011,server,nowait \
	-drive if=virtio,file=os-image.qcow2,format=qcow2,discard=unmap \
	-chardev socket,path=/tmp/qga.sock,server,nowait,id=qga0 \
	-device virtio-serial \
	-device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0


