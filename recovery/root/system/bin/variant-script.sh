#!/system/bin/sh
# This script is needed to automatically set device props.

memtotal=$(grep "MemTotal" /proc/meminfo | awk '{ print $2 }')

if [ ${memtotal} -gt "7000000" ]
then
    resetprop "ro.product.name",   "vela"
    resetprop "ro.build.product",  "vela"
    resetprop "ro.product.device", "vela"
fi

exit 0
