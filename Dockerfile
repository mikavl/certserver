FROM library/alpine:3.19.0

COPY --chown=root:root certserver.sh /usr/local/bin/certserver.sh

RUN apk add --no-cache dropbear \
 && addgroup -g 10000 dropbear \
 && adduser -h /home/dropbear -s /bin/sh -G dropbear -D -u 10000 dropbear \
 && install -d -o dropbear -g dropbear -m 0700 /var/lib/dropbear/.ssh \
 && chmod 0755 /usr/local/bin/certserver.sh

ENTRYPOINT ["/usr/sbin/dropbear"]
CMD ["-r", "/etc/dropbear/dropbear_ed25519_host_key", "-F", "-E", "-m", "-w", "-G", "dropbear", "-s", "-g", "-T", "3", "-j", "-k", "-c", "/usr/local/bin/certserver.sh", "-I", "15"]
