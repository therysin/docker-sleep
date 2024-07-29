FROM busybox:stable-musl

COPY delay.sh /delay.sh
RUN chmod +x /delay.sh

ENV delay=30

ENTRYPOINT ["/delay.sh"]
