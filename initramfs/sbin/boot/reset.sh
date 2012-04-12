#reset flash counter

mkdir /data/temp

dd if=/dev/block/mmcblk0boot0 of=/data/temp/mmcblk0boot0 bs=512

chmod 666 /data/temp/mmcblk0boot0

dd if=/res/misc/reset of=/data/temp/mmcblk0boot0 bs=1 count=5 seek=131076 conv=notrunc

echo 0 > /sys/block/mmcblk0boot0/force_ro

echo 0 > /sys/block/mmcblk0boot0/ro

dd if=/data/temp/mmcblk0boot0 of=/dev/block/mmcblk0boot0 bs=512

echo 1 > /sys/block/mmcblk0boot0/ro

echo 1 > /sys/block/mmcblk0boot0/force_ro

rm /data/temp/mmcblk0boot0
