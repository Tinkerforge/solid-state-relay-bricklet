/* solid-state-relay
 * Copyright (C) 2014 Olaf Lüke <olaf@tinkerforge.com>
 *
 * solid-state-relay.h: Implementation of Solid State Relay Bricklet messages
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

#ifndef SOLID_STATE_RELAY_H
#define SOLID_STATE_RELAY_H

#include <stdint.h>
#include "bricklib/com/com_common.h"

#define FID_SET_STATE 1
#define FID_GET_STATE 2
#define FID_SET_MONOFLOP 3
#define FID_GET_MONOFLOP 4
#define FID_MONOFLOP_DONE 5

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) StandardMessage;

typedef struct {
	MessageHeader header;
	bool state;
} __attribute__((__packed__)) SetState;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) GetState;

typedef struct {
	MessageHeader header;
	bool state;
} __attribute__((__packed__)) GetStateReturn;

typedef struct {
	MessageHeader header;
	bool state;
	uint32_t time;
} __attribute__((__packed__)) SetMonoflop;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) GetMonoflop;

typedef struct {
	MessageHeader header;
	bool state;
	uint32_t time;
	uint32_t time_remaining;
} __attribute__((__packed__)) GetMonoflopReturn;

typedef struct {
	MessageHeader header;
	bool state;
} __attribute__((__packed__)) MonoflopDone;

void set_state(const ComType com, const SetState *data);
void get_state(const ComType com, const GetState *data);
void set_monoflop(const ComType com, const SetMonoflop *data);
void get_monoflop(const ComType com, const GetMonoflop *data);

void invocation(const ComType com, const uint8_t *data);
void constructor(void);
void destructor(void);
void tick(const uint8_t tick_type);

#endif
