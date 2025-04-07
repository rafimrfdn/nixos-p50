#!/bin/sh

	sed -i '' -e's|ttyv0.*|ttyv0	"/usr/libexec/getty Pc"		xterm	on  secure|' /etc/ttys
	sed -i '' -e's|ttyv1.*|ttyv1	"/usr/libexec/getty Pc"		xterm	on  secure|' /etc/ttys
	sed -i '' -e's|ttyv2.*|ttyv2	"/usr/libexec/getty Pc"		xterm	off  secure|' /etc/ttys
	sed -i '' -e's|ttyv3.*|ttyv3	"/usr/libexec/getty Pc"		xterm	off  secure|' /etc/ttys
	sed -i '' -e's|ttyv4.*|ttyv4	"/usr/libexec/getty Pc"		xterm	off  secure|' /etc/ttys
	sed -i '' -e's|ttyv5.*|ttyv5	"/usr/libexec/getty Pc"		xterm	off  secure|' /etc/ttys
	sed -i '' -e's|ttyv6.*|ttyv6	"/usr/libexec/getty Pc"		xterm	off  secure|' /etc/ttys
	sed -i '' -e's|ttyv7.*|ttyv7	"/usr/libexec/getty Pc"		xterm	off  secure|' /etc/ttys
