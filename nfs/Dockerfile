FROM harbor.sh-sit.eainc.com/base/alpine:3.9

MAINTAINER 625495630@qq.com

RUN apk add nfs-utils \
    && touch /var/lib/nfs/log \
    && chmod 777 /var/lib/nfs/log

COPY exports /etc/exports
COPY entrypoint.sh /etc/entrypoint.sh

ENTRYPOINT ["/bin/sh"]
CMD ["/etc/entrypoint.sh"]
