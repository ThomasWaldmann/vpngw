What is vpngw?
==============

vpngw is a project to build a VPN gateway and intranet setup for (potentially
untrusted) users accessing the internet in a secure and private way.

High VPN throughput (>= 100MBit/s) and easy VPN usability were the main goals.

The project is currently mostly documentation and configuration / script
examples. So there is nothing you can just install, but it at least will
take you less time than me.

Applications
------------

- at home: for family, friends, visitors
- easy VPN selection by choosing the right LAN / wireless LAN
- later, when more stable: small hotels, restaurants, ...

Components
----------

- a VPN gateway router
 
  - uses Debian Linux on standard PC/Laptop hardware
  - relies on a external modem or router for internet access,
    does not deal with establishing a internet connection by itself
  - establishes one or multiple VPN tunnels to VPN providers
  - when using multiple VPNs, offers simple CPU and VPN throughput load
    distribution

- LAN switch and wireless LAN access point

  - TP-Link WR-841N(D) with OpenWrt (same HW as often used by Freifunk project)
  - multiple wireless LAN networks (SSIDs) on 1 device, each VPN has specific SSID
  - multiple LAN ports, each VPN has a specific LAN port
  - separation of VPNs is done using VLANs

- alternatively, Ubiquiti Access Points (UAP) + optional separate switch
 
  - UAPs have VLAN support and can be centrally managed
  - if you need wired ports for the users, use a manageable switch with VLANs


Links
=====

* `Debian <https://debian.org/>`_
* `OpenWrt <https://openwrt.org/>`_

