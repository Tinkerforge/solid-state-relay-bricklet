#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "XYZ" # Change to your UID

import time

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_solid_state_relay import SolidStateRelay

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    ssr = SolidStateRelay(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Turn relay on/off for 10 times with 1 second delay
    for i in range(10):
        time.sleep(1)
        if i % 2:
            ssr.set_state(True)
        else:
            ssr.set_state(False)

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.disconnect()
