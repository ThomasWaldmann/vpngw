VPN Gateway setup
=================

I won't go into every detail here, you need Linux experience to do the basic
steps yourself and only look here if it gets rather special / difficult.

All relevant config files are in the "gw" directory.

Basics
------

Install Debian Linux 11.x (minimum install, 64bit).

After minimal installation is finished, we need to install some more packages.

It seems like Debian 11 defaults to install a lot of "recommended" / "suggested"
packages additionally to the stuff we need.

If you don't like that and rather want to have a slim system:

::

    # /etc/apt/apt.conf.d/10norecommends
    APT::Install-Recommends "0";
    APT::Install-Suggests "0";


Essential Packages
~~~~~~~~~~~~~~~~~~

openvpn
unbound
isc-dhcp-server
ferm iptables iproute2
vlan
resolvconf
unattended-upgrades

Nice to have packages
~~~~~~~~~~~~~~~~~~~~~

wget curl  # to download stuff
etckeeper  # to manage config changes
ddclient  # update dynamic dns service 
systemd-timesyncd ntpdate  # to have correct time
locales  # avoid warnings when logging in via ssh
rfkill  # to block unused bluetooth, wwan, wifi
wpasupplicant iw wireless-tools  # to use the laptop wifi
ethtool  # maybe needed to get your NICs working flawlessly

Admin helpers
~~~~~~~~~~~~~

ssh vim screen mc ...

Monitoring
~~~~~~~~~~

htop atop # CPU load
smartmontools # SSD/HDD health
postfix mailutils  # if you want to send e-mails

Hardware support
~~~~~~~~~~~~~~~~

Whatever you need for your hardware, e.g.:

firmware-iwlwifi
firmware-realtek
firmware-linux-free
firmware-misc-nonfree
intel-microcode


Hardware specifics
------------------

Do not suspend if the laptop lid is closed:

::

    # /etc/systemd/logind.conf, add / change:
    HandleLidSwitch=ignore


Network configuration
---------------------

See /etc/network/interfaces.d/wan and lan. Optional: wifi

Make sure the wan, lan, wifi interfaces are assigned as wanted, see:

/etc/systemd/network/\*.link  # <-- adapt MAC addrs there as needed

These .link files should be the only place needing changes related to network
interfaces (their names), all other places use the "wan"/"lan"/"wifi" names.

Some sysctl changes:

::

    # /etc/sysctl.conf
    # this is a IP v4 router, it needs forwarding:
    net.ipv4.ip_forward=1
    # IP v6 might be a privacy risk, if not supported by VPN, disable it:
    net.ipv6.conf.all.disable_ipv6=1
    # Do not accept ICMP redirects (prevent MITM attacks):
    net.ipv4.conf.all.accept_redirects = 0
    net.ipv6.conf.all.accept_redirects = 0


Add VLAN support kernel module:

::

    # /etc/modules, add:
    8021q


Unattended Upgrades
---------------------------

Install security upgrades regularly AND reboot the machine if needed,
so kernel security fixes get active.

::

    # /etc/apt/apt.conf.d/50unattended-upgrades
    Unattended-Upgrade::Automatic-Reboot-Time "04:00";


Nameserver
----------

Recursive nameserver to service localhost and all our internal interfaces.

See: /etc/unbound/unbound.conf.d/my.conf


DHCP Server
-----------

Centrally assign IPv4 IPs to all internal clients (lan + vlan10/20/30).

::

    (V)LAN  IPs             GW            DNS
    ---------------------------------------------------
    lan     192.168.0.xxx   192.168.0.1   192.168.0.1
    vlan10  192.168.10.xxx  192.168.10.1  192.168.10.1
    vlan20  192.168.20.xxx  192.168.20.1  192.168.20.1
    vlan30  192.168.30.xxx  192.168.30.1  192.168.30.1


See: /etc/dhcp/dhcpd.conf


Firewall / Paket Mangling
-------------------------

Be rather closed on the external interface except some admin stuff.

Internet traffic coming in via the internal interfaces gets directed to the
internet directly (lan) or into a VPN (vlan10/20/30).

See: /etc/ferm/ferm.conf, /etc/iproute2/rt_tables,
     /etc/openvpn/scripts/{up,down,vpn-routing}.sh


VPNs
----

See: /etc/openvpn

This is a setup with 3 VPN tunnels from nordvpn.com (should work in a
similar way for other VPN providers).

You will need your own accounts, keys, certificates and credentials, of course.


Ideas / TODOs
-------------

- tuning: Process to CPU core pinning (taskset)
- automatic failover when a vpn connection dies / is too slow?
- automatic load balancing between existing vpn connections?
- 3G UMTS card as emergency fallback, provider&tariff?


Ubiquiti UniFi
--------------

Alternatively to the modified TP-Link router, one can also use Ubiquiti
hardware and software. The ubiquiti access points need a central controller
software in Java that runs as a daemon and implements a web interface to
control all your ubiquiti hardware. It can be installed on the laptop.

Installing the unifi controller software on debian is a bit cumbersome,
thus using the install and update scripts made by Glenn R. is the easiest way:

https://glennr.nl/  (--> scripts ...)

Then visit the admin webui: https://laptop-ip:8443/

