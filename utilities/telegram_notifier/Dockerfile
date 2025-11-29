FROM alpine:3.22.2
WORKDIR /app/state
COPY telegram_notifier.sh /app/telegram_notifier.sh
STOPSIGNAL SIGKILL
CMD ["sh", "/app/telegram_notifier.sh"]
