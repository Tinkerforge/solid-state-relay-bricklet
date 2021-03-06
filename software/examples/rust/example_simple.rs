use std::{error::Error, io, thread, time::Duration};
use tinkerforge::{ip_connection::IpConnection, solid_state_relay_bricklet::*};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Solid State Relay Bricklet.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let ssr = SolidStateRelayBricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    // Turn relay on/off 10 times with 1 second delay
    for _i in 0..5 {
        thread::sleep(Duration::from_millis(1000));
        ssr.set_state(true).recv()?;
        thread::sleep(Duration::from_millis(1000));
        ssr.set_state(false).recv()?;
    }

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
