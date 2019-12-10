FROM alpine:3.9

MAINTAINER 625495630@qq.com

RUN apk add samba \
	&& mkdir -p /opt/share \
	&& chown -R shareuser:shareuser /opt/share \
#	&& mkdir -p /opt/share2 \
#	&& chown -R shareuser:shareuser /opt/share2 \
    && mkdir -p /usr/local/samba/var/ \
    && touch /usr/local/samba/var/log \
    && chmod 777 /usr/local/samba/var/log

COPY smb.conf /etc/samba/smb.conf
COPY entrypoint.sh /etc/entrypoint.sh

ENTRYPOINT ["/bin/sh"]
CMD ["/etc/entrypoint.sh"]
