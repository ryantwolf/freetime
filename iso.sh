#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/freetime.kernel isodir/boot/freetime.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "freetime" {
	multiboot /boot/freetime.kernel
}
EOF
grub-mkrescue -o freetime.iso isodir
