/* solid-state-relay
 * Copyright (C) 2014 Olaf Lüke <olaf@tinkerforge.com>
 *
 * solid-state-relay.c: Implementation of Solid State Relay Bricklet messages
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "solid-state-relay.h"

#include "brickletlib/bricklet_entry.h"
#include "bricklib/bricklet/bricklet_communication.h"
#include "config.h"
#include "bricklib/utility/init.h"

void invocation(const ComType com, const uint8_t *data) {
	switch(((MessageHeader*)data)->fid) {
		case FID_SET_STATE: {
			set_state(com, (SetState*)data);
			return;
		}

		case FID_GET_STATE: {
			get_state(com, (GetState*)data);
			return;
		}

		case FID_SET_MONOFLOP: {
			set_monoflop(com, (SetMonoflop*)data);
			return;
		}

		case FID_GET_MONOFLOP: {
			get_monoflop(com, (GetMonoflop*)data);
			return;
		}

		default: {
			BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_NOT_SUPPORTED, com);
			return;
		}
	}
}

void set_state(const ComType com, const SetState *data) {
	if(data->state) {
		PIN_RELAY.pio->PIO_SODR = PIN_RELAY.mask;
	} else {
		PIN_RELAY.pio->PIO_CODR = PIN_RELAY.mask;
	}

	BC->time = 0;
	BC->time_remaining = 0;

	BA->com_return_setter(com, data);
}

void get_state(const ComType com, const GetState *data) {
	GetStateReturn gsr;
	gsr.header        = data->header;
	gsr.header.length = sizeof(GetStateReturn);
	gsr.state         = PIN_RELAY.pio->PIO_ODSR & PIN_RELAY.mask;

	BA->send_blocking_with_timeout(&gsr,
	                               sizeof(GetStateReturn),
	                               com);
}

void set_monoflop(const ComType com, const SetMonoflop *data) {
	BC->time = data->time;
	BC->time_remaining = data->time;

	if(data->state) {
		PIN_RELAY.pio->PIO_SODR = PIN_RELAY.mask;
	} else {
		PIN_RELAY.pio->PIO_CODR = PIN_RELAY.mask;
	}

	BA->com_return_setter(com, data);
}

void get_monoflop(const ComType com, const GetMonoflop *data) {
	GetMonoflopReturn gfr;
	gfr.header        = data->header;
	gfr.header.length = sizeof(GetMonoflopReturn);

	gfr.time = BC->time;
	gfr.time_remaining = BC->time_remaining;
	gfr.state = PIN_RELAY.pio->PIO_ODSR & PIN_RELAY.mask;

	BA->send_blocking_with_timeout(&gfr, sizeof(GetMonoflopReturn), com);
}

void constructor(void) {
	_Static_assert(sizeof(BrickContext) <= BRICKLET_CONTEXT_MAX_SIZE, "BrickContext too big");

	BC->time = 0;
	BC->time_remaining = 0;
	BC->monoflop_callback = false;

	PIN_RELAY.type = PIO_OUTPUT_0;
	PIN_RELAY.attribute = PIO_DEFAULT;
    BA->PIO_Configure(&PIN_RELAY, 1);
}

void destructor(void) {
	PIN_RELAY.type = PIO_INPUT;
	PIN_RELAY.attribute = PIO_PULLUP;
    BA->PIO_Configure(&PIN_RELAY, 1);
}

void tick(const uint8_t tick_type) {
	if(tick_type & TICK_TASK_TYPE_CALCULATION) {
		if(BC->time_remaining != 0) {
			BC->time_remaining--;
			if(BC->time_remaining == 0) {
				if(PIN_RELAY.pio->PIO_ODSR & PIN_RELAY.mask) {
					PIN_RELAY.pio->PIO_CODR = PIN_RELAY.mask;
				} else {
					PIN_RELAY.pio->PIO_SODR = PIN_RELAY.mask;
				}
				BC->monoflop_callback = true;
			}
		}
	}

	if(tick_type & TICK_TASK_TYPE_MESSAGE) {
		if(BC->monoflop_callback) {
			MonoflopDone md;
			BA->com_make_default_header(&md, BS->uid, sizeof(MonoflopDone), FID_MONOFLOP_DONE);
			md.state = PIN_RELAY.pio->PIO_ODSR & PIN_RELAY.mask;

			BA->send_blocking_with_timeout(&md,
										   sizeof(MonoflopDone),
										   *BA->com_current);

			BC->monoflop_callback = false;
		}
	}
}

