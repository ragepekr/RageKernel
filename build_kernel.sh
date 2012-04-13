#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=/root/workspace/arm-eabi-4.4.3/bin/arm-eabi-
export USE_SEC_FIPS_MODE=true

make u1_kor_skt_defconfig
nice -n 10 make -j4 CROSS_COMPILE=/root/workspace/arm-eabi-4.4.3/bin/arm-eabi- CONFIG_INITRAMFS_SOURCE=/root/workspace/kernel_repack/uc21_2nd_init_reset

cp drivers/net/wireless/bcmdhd/dhd.ko /root/workspace/kernel_repack/uc21_2nd_init_reset/lib/modules/
cp drivers/scsi/scsi_wait_scan.ko /root/workspace/kernel_repack/uc21_2nd_init_reset/lib/modules/

nice -n 10 make -j4 zImage CROSS_COMPILE=/root/workspace/arm-eabi-4.4.3/bin/arm-eabi- CONFIG_INITRAMFS_SOURCE=/root/workspace/kernel_repack/uc21_2nd_init_reset

