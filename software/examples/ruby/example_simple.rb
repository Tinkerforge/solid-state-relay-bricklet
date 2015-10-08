#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_solid_state_relay'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change to your UID

ipcon = IPConnection.new # Create IP connection
ssr = BrickletSolidStateRelay.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Turn relay on/off 10 times with 1 second delay
for _ in 0..4
  sleep 1
  ssr.set_state true
  sleep 1
  ssr.set_state false
end

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
