#!/bin/bash
source env
while :; do
    TEXT="$(curl --http0.9 -s -S -f -d "$(printf '%s\n%s\n%s\n%s\n%s\n.' "$( (stat -c %s "$CHATTER_ROOMNAME" || stat -f %z "$CHATTER_ROOMNAME") 2>/dev/null || printf 0)" "$CHATTER_USERNAME" "$CHATTER_PASSWORD" "$CHATTER_ROOMNAME" "" "$CHATTER_URL" | tee -a "$CHATTER_ROOMNAME")"
    if [ "$TEXT" != "" ]; then
        TEXT="$(printf '%s @ %s :\n\n%s' "$CHATTER_ROOMNAME" "$CHATTER_URL" "$TEXT")"
        PARAMETERS="$(jq -n --arg text "$TEXT" --arg chat_id "$TELEGRAM_CHAT_ID" '{text: $text, chat_id: $chat_id}')"
        curl -H 'Content-Type: application/json' -d "$PARAMETERS" "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
    fi
    sleep 10
done
