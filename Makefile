ipad_charge: usb_charge.c
	gcc -Wall -Wextra usb_charge.c -lusb-1.0 -o usb_charge

install: ipad_charge
	install -o root -g root -m 755 -s usb_charge /usr/bin/
	install -o root -g root -m 644 95-usb_charge.rules /etc/udev/rules.d/

uninstall:
	rm -rf /usr/bin/usb_charge
	rm -rf /etc/udev/rules.d/95-usb_charge.rules

clean:
	rm -f usb_charge
