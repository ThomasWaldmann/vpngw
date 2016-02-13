Adopting the UAPs
=================

Adopting the UAPs did not work easily for me.
All attempts via the controller software web UI failed, but this method worked:

If you can SSH into the AP, it's possible to do L3-adoption via CLI command:

1. make sure the AP is running the same firmware as the controller.
   If it is not, see this guide: Upgrading UniFi firmware via SSH.

2. make sure the AP is in factory default state
   if it's not, do
   syswrapper.sh restore-default

3. ssh into the device and type
mca-cli
# the CLI interface:
set-inform http://192.168.0.1:8080/inform

4. Now adopt it on the Web UI

5. repeat the set-inform command


Configuration
=============

Is done via the Unifi Web UI (implemented by the controller running on the 
laptop). https://laptop-ip:8443/

Some hints:

Either use DHCP for the UAPs or give them fixed IPs 192.168.0.2+.

Add 4 WLANs:
lan   not tagged     this might give direct internet access, protect by
                     a different WPA2 password than the other 3.
vlan10 tagged vid 10  
vlan20 tagged vid 20
vlan30 tagged vid 30

Note: do NOT use wireless uplinks, they do not support VLANs.
      also, performance is much better with wired uplinks.

