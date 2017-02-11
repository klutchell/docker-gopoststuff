#!/bin/ash

# check for existing config
if [ -f /config/.gopoststuff.conf ]; then
	echo "using extisting configuration file"
else
	echo "using default configuration file"
	cp /go/src/github.com/ERR1R/GoPostStuff/sample.conf  /config/.gopoststuff.conf
fi

[ -n "$POST_FROM" ] && sed -i "s|^From=.*|From=${POST_FROM}|" /config/.gopoststuff.conf
[ -n "$SERVER_ADDRESS" ] && sed -i "s|^Address=.*|^Address=${SERVER_ADDRESS}|" /config/.gopoststuff.conf
[ -n "$SERVER_PORT" ] && sed -i "s|^Port=.*|^Port=${SERVER_PORT}|" /config/.gopoststuff.conf
[ -n "$SERVER_USERNAME" ] && sed -i "s|^Username=.*|^Username=${SERVER_USERNAME}|" /config/.gopoststuff.conf
[ -n "$SERVER_PASSWORD" ] && sed -i "s|^Password=.*|^Password=${SERVER_PASSWORD}|" /config/.gopoststuff.conf
[ -n "$SERVER_CONNECTIONS" ] && sed -i "s|^Connections=.*|^Connections=${SERVER_CONNECTIONS}|" /config/.gopoststuff.conf
[ -n "$SERVER_TLS_ENABLED" ] && sed -i "s|^TLS=.*|^TLS=${SERVER_TLS_ENABLED}|" /config/.gopoststuff.conf

/go/bin/GoPostStuff -c "/config/.gopoststuff.conf" -d "/uploads" -g "${POST_GROUP}" -s "${POST_SUBJECT}" -v

exit 0
