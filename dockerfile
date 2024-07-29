FROM busybox:stable-musl

COPY delay.sh /delay.sh
RUN chmod +x /delay.sh

HEALTHCHECK --interval=1s --timeout=1s --start-period=0s --retries=0 \
  CMD /delay.sh --check-health

ENV DELAY_SECONDS=30

ENTRYPOINT ["/delay.sh"]
