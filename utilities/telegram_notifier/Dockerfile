FROM busybox:1.36.1-uclibc
WORKDIR /app/state
COPY telegram_notifier.sh /app/telegram_notifier.sh
STOPSIGNAL SIGKILL
CMD ["sh", "/app/telegram_notifier.sh"]
