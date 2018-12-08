USB charger utility
======================
USB charging control utility used to enable/disable charging of devices connected to USB ports. This is a fork of mkorenkov's original work, with a few modifications:

* Modified to compile with recent versions of libusb-1.0.0
* Added support for all currently known iOS devices (most notably, added iPod Touch 5G and iPad 2018)
* Don't unnecessarily claim connected USB device (to prevent interference with other device drivers)

How it works:
-----------------
I'm not entirely sure who exactly is the original author of this tool. It seems like around 2010, some ASUS software (Ai Charger, not to be confused with Ai Charger+, which seems to short D+ and D- and works with all devices but blocks data transfer while enabled) added functionality to charge iOS devices under Windows. Some curious Linux developer (Ondrej Zary) investigated how it was done and implemented a Linux tool, which was later maintained and improved by Max Korenkov and several contributors. Many of the original web sites are no longer online.

It seems the original author of this functionality analysed how iOS devices can properly charge from a MacBook USB socket (running macOS), while connecting them to a USB socket on any other OS only charges them at the 500mA a USB socket is guaranteed to deliver by the USB 2.0 specs.

Luckily, Apple implemented their protocol as a simple USB control packet, which can be easily replicated from a libUSB user-space driver. By sending a particular USB control packet, the computer tells the connected iOS device how much power it is allowed to draw from the USB socket. Obviously, the user has to make sure there is actually enough power on the USB port, ie it is recommended to use a powered USB hub.

The USB control packet typically has the following format:

| Field         |  Value        |
| ------------- |:-------------:|
| bRequestType  | 0x40          |
| bRequest      | 0x40          |
| wValue        | 500 (default power; According to MFi spec either 0, 100, 500) |
| wIndex        | 1600 (additional power; 1600 mA, the max according to the MFi spec) |

Please note the references to the MFi spec are taken over from the original source code. I don't know what exact specification it is referring to and haven't found any such document online.

It seems like a different value is provided depending on whether the connected device is an iPad or an iPhone/iPod. From the original source code, it looks like some Android phones adopted the same protocol in order to support charging from MacBook USB sockets. However, I tested it with a Nexus 9 and Note 8.0 tablet and neither of them supported it.

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

