/sbin/ext/busybox mount -t rootfs -o remount,rw rootfs 
mkdir -p /customkernel/property 
echo true >> /customkernel/property/customkernel.cf-root 
echo true >> /customkernel/property/customkernel.base.cf-root 
echo Rage >> /customkernel/property/customkernel.name 
echo "Rage-v0.5" >> /customkernel/property/customkernel.namedisplay 
echo uc21 >> /customkernel/property/customkernel.version.number 
echo 0.5 >> /customkernel/property/customkernel.version.name 
echo true >> /customkernel/property/customkernel.bootani.zip 
echo true >> /customkernel/property/customkernel.bootani.bin 
echo true >> /customkernel/property/customkernel.cwm 
echo 5.0.2.7 >> /customkernel/property/customkernel.cwm.version 
/sbin/ext/busybox mount -t rootfs -o remount,ro rootfs 