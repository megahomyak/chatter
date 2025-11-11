This is an alternation of my Blabber ("chatfiles/blabber"), another attempt to bring a centralized messenger to its minimum

# HOW TO USE:

## SERVER:

```
mkdir rooms users
CHATTER_USERS_DIR=users ./add_user username # However many you want; will print out the password ONCE, send it to the person immediately
cd rooms
CHATTER_HOST=0.0.0.0 CHATTER_PORT=6969 CHATTER_USERS_DIR=../users ../server # The server serves rooms from the current directory; please, don't put sensitive files in there, they may be leaked
```

## CLIENT:

```
CHATTER_ROOMNAME=general CHATTER_URL=http(s)://some_host:6969 CHATTER_PASSWORD=blahblahblah58372727838 CHATTER_USERNAME=username ./client
```
