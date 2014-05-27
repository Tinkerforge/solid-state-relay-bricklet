<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletSolidStateRelay.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletSolidStateRelay;

const HOST = 'localhost';
const PORT = 4223;
const UID = '6hL'; // Change to your UID

$ipcon = new IPConnection(); // Create IP connection
$ssr = new BrickletSolidStateRelay(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Turn relay on/off for 10 times with 1 second delay
for($i = 0; $i < 10; $i++) {
    sleep(1);

    if ($i % 2 == 1) {
        $ssr->setState(TRUE);
    } else {
        $ssr->setState(FALSE);
    }
}

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
