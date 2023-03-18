#!/bin/sh
set -e
export CC=/usr/bin/x86_64-linux-gnu-gcc
if [ -f /sys/kernel/btf/vmlinux ]
then
    # Avoids "Skipping BTF generation ..." warning during build
    sudo cp -n /sys/kernel/btf/vmlinux /usr/lib/modules/`uname -r`/build/
fi
make clean
make -j 16 CC=/usr/bin/x86_64-linux-gnu-gcc
sudo make install
# sudo modprobe vmmon
# sudo modprobe vmnet
sudo service vmware restart
