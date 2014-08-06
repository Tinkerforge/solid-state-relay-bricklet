import com.tinkerforge.BrickletSolidStateRelay;
import com.tinkerforge.IPConnection;

public class ExampleSimple {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;
	private static final String UID = "ABC"; // Change to your UID

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions you
	//       might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletSolidStateRelay ssr = new BrickletSolidStateRelay(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Turn relay on/off for 10 times with 1 second delay
		for(int i = 0; i < 10; i++) {
			Thread.sleep(1000);

			if(i % 2 == 1) {
				ssr.setState(true);
			} else {
				ssr.setState(false);
			}
		}

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
