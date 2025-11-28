#!/bin/bash
source env
while :; do
    if [ "$(curl --http0.9 -s -S -f -d "$(printf '%s\n%s\n%s\n%s\n%s\n.' "$( (stat -c %s "$CHATTER_ROOMNAME" || stat -f %z "$CHATTER_ROOMNAME") 2>/dev/null || printf 0)" "$CHATTER_USERNAME" "$CHATTER_PASSWORD" "$CHATTER_ROOMNAME" "" "$CHATTER_URL" | tee -a "$CHATTER_ROOMNAME")" != "" ]; then
        curl -H 'Content-Type: application/json' -d "{\"chat_id\": \"$TELEGRAM_CHAT_ID\", \"text\": \"New Chatter messages in $CHATTER_ROOMNAME on $CHATTER_URL\"}" "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
    fi
    sleep 10
done
