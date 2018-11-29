/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef MANGOSSERVER_PROGRESSION_H
#define MANGOSSERVER_PROGRESSION_H

// Game client builds
#define CLIENT_BUILD_1_2_4 4222
#define CLIENT_BUILD_1_3_1 4297
#define CLIENT_BUILD_1_4_2 4375
#define CLIENT_BUILD_1_5_1 4449
#define CLIENT_BUILD_1_6_1 4544
#define CLIENT_BUILD_1_7_1 4695
#define CLIENT_BUILD_1_8_4 4878
#define CLIENT_BUILD_1_9_4 5086
#define CLIENT_BUILD_1_10_2 5302
#define CLIENT_BUILD_1_11_2 5464
#define CLIENT_BUILD_1_12_1 5875
// Change this to define which version players can use
#define SUPPORTED_CLIENT_BUILD CLIENT_BUILD_1_12_1

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_11_2
#define MAX_CONTENT_PATCH 10
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_10_2
#define MAX_CONTENT_PATCH 9
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
#define MAX_CONTENT_PATCH 8
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
#define MAX_CONTENT_PATCH 7
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_7_1
#define MAX_CONTENT_PATCH 6
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_6_1
#define MAX_CONTENT_PATCH 5
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_5_1
#define MAX_CONTENT_PATCH 4
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
#define MAX_CONTENT_PATCH 3
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_3_1
#define MAX_CONTENT_PATCH 2
#elif SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_2_4
#define MAX_CONTENT_PATCH 1
#else
#define MAX_CONTENT_PATCH 0
#endif

#endif
