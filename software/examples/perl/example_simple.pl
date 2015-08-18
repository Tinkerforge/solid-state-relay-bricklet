#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletSolidStateRelay;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'joQ'; # Change to your UID

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $ssr = Tinkerforge::BrickletSolidStateRelay->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Turn relay on/off for 10 times with 1 second delay
for (my $i = 0; $i < 10; $i++)
{
    sleep(1);

    if ($i % 2)
    {
        $ssr->set_state(1);
    }
    else
    {
        $ssr->set_state(0);
    }
}

print "Press any key to exit...\n";
<STDIN>;
$ipcon->disconnect();

