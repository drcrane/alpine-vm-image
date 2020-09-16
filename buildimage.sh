#!/bin/sh
set -o errexit
# Perhaps required if the currrent machine has grsecurity
# sysctl -w kernel.grsecurity.chroot_caps=0
if [[ ! -f alpinevmbase.qcow2 ]] ; then
./alpine-make-vm-image/alpine-make-vm-image --image-format qcow2 --image-size 16G --packages "openssh qemu-guest-agent" \
	--serial-console --script-chroot alpinevmbase.qcow2 ./alpinevmbase.sh
if [[ ! -f os-image.qcow2 ]] ; then
rm os-image.qcow2
fi
fi
if [[ ! -f os-image.qcow2 ]] ; then
qemu-img create -b alpinevmbase.qcow2 -f qcow2 os-image.qcow2 16G
fi

