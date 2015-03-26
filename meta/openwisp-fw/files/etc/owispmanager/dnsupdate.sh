USER="user"
PASS="paswowd"
IFACE="setup069"
TMP_PATH="/tmp/"
DNSINFO="$TMP_PATH/dns.log"
D="$(nslookup $(cat /proc/sys/kernel/hostname).dynamic-dns.net 83.171.22.2 | head -n 5 | tail -1 | awk '{print $3}' )"
B="$(ifconfig $IFACE | grep inet | awk '{print $2}' | cut -d':' -f2)"
if [ $D  != $B  ]; then
   C="$(nslookup nic.changeip.com 83.171.22.2 | head -n 5 | tail -1 | awk '{print $3}')"
   wget -q -U "rinker.sh wget 1.0" -O $DNSINFO  "http://$USER:$PASS@$C/nic/update?hostname=$(cat /proc/sys/kernel/hostname).dynamic-dns.net&ip=$(ifconfig setup069 | grep inet | awk '{print $2}' | cut -d':' -f2)"
   echo "DDNS updated"
else
  echo "no IP changes"
fi
