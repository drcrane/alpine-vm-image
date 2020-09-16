#!/bin/sh
set -o errexit
virsh pool-define-as default dir --target /var/lib/libvirt/images
virsh pool-start default
virsh vol-create-as default alpinebase.qcow2 16G --format qcow2
virsh vol-upload alpinebase.qcow2 alpinevmbase.qcow2 --pool=default
virsh vol-create-as default os-image.qcow2 16G \
    --format qcow2 \
    --backing-vol /var/lib/libvirt/images/alpinebase.qcow2 \
    --backing-vol-format qcow2

