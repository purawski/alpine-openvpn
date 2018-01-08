FROM alpine:3.7
MAINTAINER Pawel Urawski <Pawel.Urawski@gmail.com>

# Install samba
#RUN apk --no-cache --no-progress upgrade && \
#    apk --no-cache --no-progress add bash samba shadow && \
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add bash-completion openvpn
    


VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp 1194/tcp
COPY init.sh /
CMD ["/init.sh"]


#HEALTHCHECK --interval=60s --timeout=15s \
#CMD smbclient -L '\\localhost\' -U 'guest%' -m SMB3
#VOLUME ["/etc/samba"]
#ENTRYPOINT ["samba.sh"]
