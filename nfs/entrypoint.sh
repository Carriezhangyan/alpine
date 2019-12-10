#!/bin/sh

###### start nfs server ############
/usr/sbin/exportfs -ar
/usr/sbin/rpc.gssd -D
/sbin/rpcbind -w &
/usr/sbin/rpc.mountd -F &
/usr/sbin/rpc.nfsd -d &

#mkdir -p /opt/share1
#mkdir -p /opt/share2

tail -f /var/lib/nfs/log

