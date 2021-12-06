#!/bin/sh

# just in case, get rid of any present route (e.g. the one set by down.sh)
ip route del default table t_$dev

# set a default route via the VPN tun device
ip route add default dev $dev table t_$dev

