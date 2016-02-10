Hardware
========

You likely can use a lot of different hardware for this, I am just documenting
what worked for me (and why).


VPN gateway
-----------

After first looking at standard wifi router hardware, I realized that they
usually do not have enough CPU power for what I wanted:

- OpenVPN as VPN solution
- strong crypto, like AES256
- one or multiple VPNs (multiple VPNs can use multiple CPU cores)
- high VPN througput, not being a bottleneck: goal is >= 100 MBit/s

Hardware chosen: (used) Lenovo Thinkpad X220 12.5" laptop

- why a laptop?

  - a laptop usually has lower power consumption than a standard PC
  - includes screen and keyboard for easy on-site device management
  - battery power so it doesn't crash if main power goes away
  - small form factor

- hardware properties:

  - 2x Intel Core i5-2450 (2.5GHz, 3.1GHz Turbo) cores with HT and AES-NI
    hw crypto acceleration

  - internal network connection: builtin Intel Gbit LAN
  - internet network connection: USB3 GBit adaptor

    - the laptop only has USB2 ports though, but that's not a bottleneck
    - USB was chosen for the external/internet adaptor to be easily replaceable
      in case it dies in a lightning storm or other overvoltage event
    - also, easy to remember: the external adaptor is the external network

  - 4GB RAM (that's plenty to run addtl. stuff even)
  - new 120GB Samsung Evo 850 SSD (capacity is also plenty, used a SSD
    for good reliability, no noise, little power consumption, shock proof -
    I did not want to rely on a used few years old mechanical HDD).
  - internal 3G/UMTS modem that could be used as fallback (not used yet)
  - builtin b/g/n Wifi (not used)
  - builtin camera (not used)


LAN / Wifi access points
------------------------

We do not need routers, VLAN capable switches and Wifi access points are enough.

Hardware chosen: TP-Link WR841N(D) v9

- cheap
- low power consumption
- runs OpenWrt
- antennas seem to be OK
- with OpenWrt it supports VLANs for LAN ports and Wifi
- it's intended as a router, but we reconfigure it a bit so it fits our needs

