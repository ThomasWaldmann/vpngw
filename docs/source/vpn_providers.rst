VPN providers
=============

There are plenty of them, so just some comments on choosing one (or some).

Anonymity
---------

If you run the VPNs to avoid expensive / annoying letters from lawyers (which
might be triggered by actions of your untrusted users [or might also being
sent to you without any reason on your side - there were enough cases of
fraudulent lawyers in the past also]), check if the VPN provider:

- is trustworthy (difficult)
- has a "no logging policy"
- uses sane crypto
- operates from a different (and maybe more liberal) country/jurisdiction
- offers accounts (or software that comes with accounts) for you to buy
  with CASH (e.g. in a store), so the VPN provider does not even know you.


Privacy
-------

If you run the VPNs just to have privacy from your miserable internet provider
and maybe some other parties that could spy on you by sniffing your traffic
"on the wire", requirements are less strict, just the crypto and authentication
has to be strong enough to keep these parties out of your connection.


Other criteria
--------------

- they need to support OpenVPN (and it is nice if they give you "ready to use"
  OpenVPN configs for your accounts)
- price (check box retail price vs. monthly vs. yearly)
- throughput and latency (especially if you want to fully use a high-speed
  internet connection)
- traffic limits?
- amount and distribution of VPN servers


Caution
-------

Keep in mind:

- the VPN provider will always know your IP address, so you are not anonymous
- he is able to log that and all your traffic that goes over his VPN
- he might be legally obliged to work with law enforcement
- he might be hacked by who knows
- he might be evil

Thus:

- just don't do bad and illegal stuff
- protect your connections / your data additionally

You always should use https (or in general: TLS or other encryption plus
authentication) additionally to the VPN for good security.

Your traffic leaves the VPN at the VPN provider's server, so it won't be
protected by the VPN after there.

