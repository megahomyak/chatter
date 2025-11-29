FROM alpine:3.22.2
RUN apk add --no-cache curl=8.14.1-r2 jq=1.8.1-r0
WORKDIR /app/state
COPY telegram_notifier.sh /app/telegram_notifier.sh
STOPSIGNAL SIGKILL
CMD ["sh", "/app/telegram_notifier.sh"]
