#!/bin/sh

###### start samba server ##########
echo -e "shareuser\nshareuser" | adduser shareuser
echo -e "shareuser\nshareuser" | smbpasswd -s -a  shareuser
mkdir -p /opt/share
chown -R shareuser:shareuser /opt/share
#mkdir -p /opt/share2
#chown -R shareuser:shareuser /opt/share2

/usr/sbin/smbd --foreground --no-process-group &

tail -f /usr/local/samba/var/log

