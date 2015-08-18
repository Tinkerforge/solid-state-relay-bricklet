#include <stdio.h>

#define IPCON_EXPOSE_MILLISLEEP

#include "ip_connection.h"
#include "bricklet_solid_state_relay.h"

#define HOST "localhost"
#define PORT 4223
#define UID "XYZ" // Change to your UID

int main(void) {
	// Create IP connection
	IPConnection ipcon;
	ipcon_create(&ipcon);

	// Create device object
	SolidStateRelay ssr;
	solid_state_relay_create(&ssr, UID, &ipcon);

	// Connect to brickd
	if(ipcon_connect(&ipcon, HOST, PORT) < 0) {
		fprintf(stderr, "Could not connect\n");
		return 1;
	}
	// Don't use device before ipcon is connected

	// Turn relay on/off for 10 times with 1 second delay
	int i;
	for(i = 0; i < 10; ++i) {
		millisleep(1000);

		if (i % 2 != 0) {
			solid_state_relay_set_state(&ssr, true);
		} else {
			solid_state_relay_set_state(&ssr, false);
		}
	}

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon); // Calls ipcon_disconnect internally
	return 0;
}
