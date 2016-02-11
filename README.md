onkyo-eiscp-remote-mac
======================
A simple command line tool for Mac OS X to send ISCP commands over TCP/IP to a compatible Onkyo AV receiver. Uses [GCDAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket) by Robbie Hanson.

Usage
-----
After compiling you can use the tool with this syntax

    octl command ipAddress [port]
    
Where ipAddress is the IP address of your AV receiver, which has to be on the same network. If you do not enter a port number the default port 60128 will be used.

Examples
--------
These examples assume that your receiver is reachable at IP address 192.168.2.239.

To wake the receiver from Stand By use the command

    octl PWR01 192.168.2.239
    
and to switch it off use

    octl PWR00 192.168.2.239

Some commands will also receive information from the receiver. To get the current power status, use

    octl PWRQSTN 192.168.2.239

and you should get a response like this

	Connected to 192.168.2.239 at port 60128
	Command sent
	Resonse: !1PWR01
    
where `!1PWR01` indicates that the receiver is switched on.

Commands
--------
A list of available commands and supported receivers is available in <a href="commands.xls">commands.xls</a>.
