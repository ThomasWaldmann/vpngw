LAN/WIFI Access Point setup
===========================

What it does
------------

By connecting to a "vlanXX" Wifi ESSID or LAN port, you get connected to a
specific vlan (virtual lan) that offers internet access via a specific VPN.

"lan" isn't going into a specific vlan, just connects you to the LAN normally.

Depending on the VPN gateway configuration, there might be internet access for
"lan" or just local network access.

All we need from the router is:

- 3 VLANs - 1 VLAN for each VPN
- 1 switch port for each VLAN
- 1 Wifi ESSID for each VLAN


What it does not
----------------

NOT needed on the router (the VPN gateway does all this):

- name server
- dhcp server
- openvpn
- NAT
- firewall / packet filter
- NTP server


Hardware specifics
------------------

The port labels 1..4 on the router case are reversed.

Internal LAN port 4 is right next to the orange WAN port.
That's where the cable to the VPN gateway plugs in.

The other LAN ports give access to the VPNs.

The WAN port is unused.


Installation
------------

Install OpenWrt "Chaos Calmer" 15.05 r46767 onto the TP-WR841N(D).

On the web interface (192.168.1.1):

Enter a password, enable ssh login as root with password (or with your ssh
key), log out.


Configuration
-------------

See ap/TL-WR841N directory. The configs are commented, read them and adapt
them to your needs.

You can scp these configs "as is" into /etc/config of a fresh router. Reboot.

Please note that from now on, the router does not work as dhcp server any
more.

Plug into the blue LAN port next to the orange WAN port, browse to 192.168.0.2
and disable some unneeded services:

- firewall
- odhcpd
- dnsmasq
- sysntpd (or configure it to query the ntpd on the VPN gateway)
- uhttpd (if you disable it, the web interface is gone, ssh only)

Save/apply and reboot.

