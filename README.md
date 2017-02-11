# GoPostStuff Docker Image #

## Description ##

Docker image to upload multiple local files to a usenet server of your choosing.

Uses [golang:alpine](https://hub.docker.com/_/golang/) base image with [ERR1R](https://github.com/ERR1R)'s fork of [GoPostStuff](https://github.com/ERR1R/GoPostStuff) for uploads.

## Usage ##

```bash
$ docker run \
--name=gogetstuff \
-e "POST_FROM=User <teSPAMst@examNOSPAMple.com>" \
-e "POST_GROUP=alt.binaries.test.yenc" \
-e "POST_SUBJECT=my test upload"
-e SERVER_ADDRESS=testserver.int \
-e SERVER_PORT=563 \
-e SERVER_USERNAME=testuser \
-e SERVER_PASSWORD=topsecret \
-v </path/to/config>:/config \
-v <path/to/uploads>:/uploads \
klutchell/gogetstuff
```

## Parameters ##

* ```-e POST_FROM=``` - The 'From' address to put on posts. If you change this then try to resume a posting, many clients will get confused.
* ```-e POST_GROUP=``` - Group to post files to (alt.binaries.test.yenc).
* ```-e SERVER_ADDRESS=``` - Usenet server address or host. You can have multiple if you like that sort of thing.
* ```-e SERVER_PORT=``` - Usenet server port. May change when switching Encryption on or off.
* ```-e SERVER_USERNAME=``` - Usenet server username. Leave blank if not required.
* ```-e SERVER_PASSWORD=``` - Usenet server password. Leave blank if not required.
* ```-e SERVER_CONNECTIONS=``` - Number of simultaneous connections. You pretty much just have to test with varying numbers until you hit a reasonable amount for your server and internet connection.
* ```-e SERVER_TLS_ENABLED=``` - Encryption ('on' or 'off').
* ```-v </path/to/config>:/config``` - Host directory for storing persistent configuration (optional).
* ```-v <path/to/uploads>:/uploads``` - Host directory with files requiring upload. Everything in this dir will be uploaded on every run so keep it clean.

## Configuration ##

To maintain confguration parameters between runs just provide the ```-v </path/to/config>:/config``` volume mount. Configuration will be saved in ```</path/to/config>/.gopoststuff.conf``` after the first run.

To change existing saved parameters, just provide new values from the docker run command and the old values will be overwritten. Or optionally edit ```</path/to/config>/.gopoststuff.conf``` manually.

Note that ```POST_GROUP``` and ```POST_SUBJECT``` will still be required on every run.

## Contributing ##

* n/a

## Author ##

* Kyle Harding <kylemharding@gmail.com>

## Credit ##

I give credit where it's due and would like to give a shoutout to the creators of the utilites/images used in this project:
* [ERR1R](https://github.com/ERR1R/)
* [madcowfred](https://github.com/madcowfred/)
