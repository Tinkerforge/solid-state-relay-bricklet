<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletSolidStateRelay.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletSolidStateRelay;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Solid State Relay Bricklet

$ipcon = new IPConnection(); // Create IP connection
$ssr = new BrickletSolidStateRelay(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Turn relay on/off 10 times with 1 second delay
for($i = 0; $i < 5; $i++) {
    sleep(1);
    $ssr->setState(TRUE);
    sleep(1);
    $ssr->setState(FALSE);
}

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
