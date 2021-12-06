#!/bin/sh

# get rid of the default route via the VPN device (set by up.sh)
ip route del default dev $dev table t_$dev

# intentionally a route to lo - no internet there.
# without this default route, it would fall back to the non-VPN system default route!
ip route add default dev lo table t_$dev

