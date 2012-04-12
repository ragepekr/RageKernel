#임시폴더 생성
mkdir /data/temp

### prepare for md5 checksum ###
dd if=/dev/block/mmcblk0boot0 of=/data/temp/compare_me bs=1 count=5 skip=131076

### check using the md5sum binary; the md5sum binary is mendatory. if there isn't, get the busybox
#saving a hash key
echo "91f8eef5a9e0ceb663383cab6e27aa94  /data/temp/compare_me" > /data/temp/md5check.txt
md5sum -c /data/temp/md5check.txt
if [ $? != 0 ] 
then 
	##not maching -> reset the counter!
	#부트파티션을 임시폴더로 백업
	dd if=/dev/block/mmcblk0boot0 of=/data/temp/mmcblk0boot0 bs=512

	#퍼미션주고
	chmod 666 /data/temp/mmcblk0boot0

	#카운트인식하는 해당위치를 수정
	dd if=/res/misc/count_reset of=/data/temp/mmcblk0boot0 bs=1 count=5 seek=131076 conv=notrunc

	#부트파티션 언락
	echo 0 > /sys/block/mmcblk0boot0/force_ro
	echo 0 > /sys/block/mmcblk0boot0/ro

	#부트파티션 다시 쓰기
	dd if=/data/temp/mmcblk0boot0 of=/dev/block/mmcblk0boot0 bs=512

	#부트 파티션 락
	echo 1 > /sys/block/mmcblk0boot0/ro
	echo 1 > /sys/block/mmcblk0boot0/force_ro
else
	echo
	##matching -> no need to reset the counter
fi
	#임시파일 삭제
	rm -r /data/temp
