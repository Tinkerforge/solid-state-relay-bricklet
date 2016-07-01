#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "XYZ" # Change XYZ to the UID of your Solid State Relay Bricklet

import time

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_solid_state_relay import BrickletSolidStateRelay

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    ssr = BrickletSolidStateRelay(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Turn relay on/off 10 times with 1 second delay
    for i in range(5):
        time.sleep(1)
        ssr.set_state(True)
        time.sleep(1)
        ssr.set_state(False)

    raw_input("Press key to exit\n") # Use input() in Python 3
    ipcon.disconnect()
