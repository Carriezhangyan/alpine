FROM alpine:3.9

MAINTAINER zhangyan@625495630@qq.com

RUN apk add samba \
    && mkdir -p /usr/local/samba/var/ \
    && touch /usr/local/samba/var/log \
    && chmod 777 /usr/local/samba/var/log

COPY smb.conf /etc/samba/smb.conf
COPY entrypoint.sh /etc/entrypoint.sh

ENTRYPOINT ["/bin/sh"]
CMD ["/etc/entrypoint.sh"]
