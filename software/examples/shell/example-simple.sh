#!/bin/sh
# connects to localhost:4223 by default, use --host and --port to change it

# change to your UID
uid=XYZ

# Turn relay on/off for 10 times with 1 second delay
for i in 0 1 2 3 4; do
	sleep 1
	tinkerforge call solid-state-relay-bricklet $uid set-state true
	sleep 1
	tinkerforge call solid-state-relay-bricklet $uid set-state false
done
