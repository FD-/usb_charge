USB charger utility
======================
USB charging control utility used to enable/disable charging of devices connected to USB ports. This is a fork of mkorenkov's original work, with a few modifications:

* Modified to compile with recent versions of libusb-1.0.0
* Added support for all currently known iOS devices (most notably, added iPod Touch 5G and iPad 2018)
* Don't unnecessarily claim connected USB device (to prevent interference with other device drivers)

Supported devices:
------------------
* All iOS devices known as of October 2018 should be supported

Requirements:
-------------
Linux, GCC, Make, libusb-1.0.0

Wiki:
-----
[https://github.com/mkorenkov/ipad_charge/wiki](https://github.com/mkorenkov/ipad_charge/wiki)

libusb-1.0.0
----------
```
sudo apt-get install libusb-1.0.0 libusb-1.0.0-dev
```

Authors & Maintainers:
-------
* Ondrej Zary
* Max Korenkov
* Pranava Swaroop
* Florian Draschbacher

