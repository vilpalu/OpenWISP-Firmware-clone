#!/bin/sh
#
sum=0
for iface in ` iwinfo |  grep  ESSID: | awk '{ print $1 }'`; do
#echo $iface
#sum= $((expr $sum + $(( iw dev $iface  station dump | grep  Station))))
sum=`expr $sum +  $(iw dev $iface  station dump | grep  Station | wc -l)`
done
#echo $sum
exit $sum
