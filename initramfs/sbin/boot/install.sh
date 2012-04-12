if /sbin/ext/busybox [ ! -f /system/cfroot/release-UC21-M250S- ]; 
then
# Remount system RW
    /sbin/ext/busybox mount -o remount,rw /system
    /sbin/ext/busybox mount -t rootfs -o remount,rw rootfs

# Free some space
    toolbox rm /system/app/MobileODINFlasher.apk
    /sbin/ext/busybox cp /system/app/Maps.apk /Maps.tmp
    toolbox rm /system/app/Maps.apk

# ensure /system/xbin exists
    toolbox mkdir /system/xbin
    toolbox chmod 755 /system/xbin

# su
    toolbox rm /system/bin/su
    toolbox rm /system/xbin/su
    toolbox cat /res/misc/su > /system/xbin/su
    toolbox chown 0.0 /system/xbin/su
    toolbox chmod 6755 /system/xbin/su

# Superuser
    toolbox rm /system/app/Superuser.apk
    toolbox rm /data/app/Superuser.apk
    toolbox cat /res/misc/Superuser.apk > /system/app/Superuser.apk
    toolbox chown 0.0 /system/app/Superuser.apk
    toolbox chmod 644 /system/app/Superuser.apk

# CWM Manager
    toolbox rm /system/app/CWMManager.apk
    toolbox rm /data/dalvik-cache/*CWMManager.apk*
    toolbox rm /data/app/eu.chainfire.cfroot.cwmmanager*.apk

    toolbox cat /res/misc/CWMManager.apk > /system/app/CWMManager.apk
    toolbox chown 0.0 /system/app/CWMManager.apk
    toolbox chmod 644 /system/app/CWMManager.apk

# Restore Maps if possible
    /sbin/ext/busybox cp /Maps.tmp /system/app/Maps.apk
    toolbox chown 0.0 /system/app/Maps.apk
    toolbox chmod 644 /system/app/Maps.apk
    toolbox rm /Maps.tmp

# Once be enough
    toolbox mkdir /system/cfroot
    toolbox chmod 755 /system/cfroot
    toolbox rm /data/cfroot/*
    toolbox rmdir /data/cfroot
    toolbox rm /system/cfroot/*
    echo 1 > /system/cfroot/release-UC21-M250S- 

# Remount system RO
    /sbin/ext/busybox mount -t rootfs -o remount,ro rootfs
    /sbin/ext/busybox mount -o remount,ro /system
fi;
