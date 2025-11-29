FROM busybox:1.36.1-uclibc
WORKDIR /app
ENTRYPOINT ["sh", "../telegram_notifier.sh"]
COPY telegram_notifier.sh .
WORKDIR /app/state
STOPSIGNAL SIGKILL
