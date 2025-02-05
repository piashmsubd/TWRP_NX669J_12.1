# TWRP & OrangeFox vendorsetup.sh for NX669J

export ALLOW_MISSING_DEPENDENCIES=true

FDEVICE="NX669J"

get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$BUILD_DEVICE" ]; then
   get_target_device
fi
    
if [ "$1" = "$FDEVICE" -o "$BUILD_DEVICE" = "$FDEVICE" ]; then
    export LC_ALL="C"

    # TWRP Variables
    export TARGET_DEVICE_ALT="NX669J,NX669S,NX669J-UN,NX669S-UN,NX669J-EEA,NX669S-EEA"
    export TARGET_SUPPORTS_AB=true
    export TW_THEME="portrait_hdpi"
    export TW_USE_TOOLBOX=true
    export TW_INCLUDE_NTFS_3G=true
    export TW_NO_SCREEN_TIMEOUT=true
    export TW_SCREEN_BLANK_ON_BOOT=false
    export TW_EXCLUDE_TWRPAPP=1
    export TARGET_COPY_OUT_RECOVERY=1

    # OrangeFox Variables
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export FOX_VERSION="R11.1"
    export FOX_BUILD_DEVICE="NX669J"
    export FOX_AB_DEVICE=1
    export FOX_REPLACE_BUSYBOX_PS=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    export FOX_DELETE_AROMAFM=1
    export OF_SCREEN_H=2340
    export OF_STATUS_H=100
    export OF_USE_LOCKSCREEN_BUTTON=1
    export FOX_USE_SPECIFIC_MAGISK_ZIP="~/magisk.zip"
    export TW_DEVICE_VERSION="R11.1"

    # Let's log the build variables
    if [ -n "$BUILD_LOG_FILE" -a -f "$BUILD_LOG_FILE" ]; then
       export | grep "FOX" >> $BUILD_LOG_FILE
       export | grep "OF_" >> $BUILD_LOG_FILE
       export | grep "TARGET_" >> $BUILD_LOG_FILE
       export | grep "TW_" >> $BUILD_LOG_FILE
    fi
fi

add_lunch_combo twrp_NX669J-eng
add_lunch_combo twrp_NX669J-userdebug
add_lunch_combo orangefox_NX669J-eng
add_lunch_combo orangefox_NX669J-userdebug
