#!/bin/sh

###### start samba server ##########
echo -e "shareuser\nshareuser" | adduser shareuser
echo -e "shareuser\nshareuser" | smbpasswd -s -a  shareuser

/usr/sbin/smbd --foreground --no-process-group &

tail -f /usr/local/samba/var/log

