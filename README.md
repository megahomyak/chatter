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

## My thoughts on the protocol

Essentially, w/o any annoying implementation limitations, the protocol should just be this:

### Client

* Collect the necessary data (roombias (the size of the roomfile, =0 if roomfile wasn't found), username, password, roomname, message)
* Send the request with the above variables on separate lines, in order
* Write the response to the roomfile

### Server

* Collect and validate the incoming data (validation: `is_unsigned_int(roombias) && basename(username) == username && basename(roomname) == roomname && sha256(read(CHATTER_USERS_DIR/username)) == password && (message != "" || exists(roomname))`; server response status = validity check status)
* Write to the roomfile if a message is present
* Send from the roomfile from the offset
