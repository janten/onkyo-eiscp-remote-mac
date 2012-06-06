onkyo-eiscp-remote-mac
======================
A simple command line tool for Mac OS X to send ISCP commands over TCP/IP to a compatible Onkyo AV receiver. Uses GCDAsyncSocket (https://github.com/robbiehanson/CocoaAsyncSocket) by Robbie Hanson.

Usage
-----
After compiling you can use the tool with this syntax

    octl command ipAddress [port]
    
Where ipAddress is the IP address of your AV receiver, which has to be on the same network. If you do not enter a port number the default port 60128 will be used.

Examples
--------
To wake the receiver from Stand By use the command

    octl PWR01 ipAddress [port]
    
and to switch it off use

    octl PWR00 ipAddress [port]
    

Some commands will also receive information from the receiver. To get the current power status, use

    octl PWRQSTN ipAddress [port]
    
Commands
--------
A list of available commands and supported receivers is available on http://www.wyerd.co.uk/images/onkyo_cmds.xls