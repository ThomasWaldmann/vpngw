#!/bin/sh
DEV=$1
GW=$5
echo "iptables -A POSTROUTING -t nat -o $DEV -j MASQUERADE" > /tmp/up-$DEV.log
iptables -A POSTROUTING -t nat -o $DEV -j MASQUERADE
echo "ip route add default via $GW dev $DEV table t_$DEV" >> /tmp/up-$DEV.log
ip route add default via $GW dev $DEV table t_$DEV

# does not belong to tun0, but we only want to execute this once:
[ "$DEV" = "tun0" ] && ip rule add fwmark 1 table main

# tun device specific fwmarks:
[ "$DEV" = "tun0" ] && ip rule add fwmark 2 table t_tun0 && exit 0
[ "$DEV" = "tun1" ] && ip rule add fwmark 3 table t_tun1 && exit 0
[ "$DEV" = "tun2" ] && ip rule add fwmark 4 table t_tun2 && exit 0

