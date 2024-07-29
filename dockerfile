FROM busybox:stable-musl

COPY delay.sh /delay.sh
RUN chmod +x /delay.sh

ENTRYPOINT ["/delay.sh"]
