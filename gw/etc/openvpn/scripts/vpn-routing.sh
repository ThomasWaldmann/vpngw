#!/bin/sh
# called by the systemd vpn-routing service ONCE

# if marked 1, use standard, non-VPN routing
ip rule add fwmark 1 table main

# A) do not use VPNs, route directly to internet:
# if marked 2/3/4, use the VPN routing tables
#ip rule add fwmark 2 table main
#ip rule add fwmark 3 table main
#ip rule add fwmark 4 table main

# B) use VPNs, route tagged VLANs into VPN tunnels:
# if marked 2/3/4, use the VPN routing tables
ip rule add fwmark 2 table t_tun0
ip rule add fwmark 3 table t_tun1
ip rule add fwmark 4 table t_tun2

# set a non-working default route for the VPNs
ip route add default dev lo table t_tun0
ip route add default dev lo table t_tun1
ip route add default dev lo table t_tun2

# testing this:
# ip route get 8.8.8.8 mark 1   -> should show non-vpn route
# ip route get 8.8.8.8 mark 2   -> should show tun0 vpn route


