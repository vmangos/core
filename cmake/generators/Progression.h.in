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

// Game client builds.
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

// Change this to define which build of the game to emulate.
// Has an effect on things such as core gameplay mechanics,
// loading of client data, and network packets structure.
#define SUPPORTED_CLIENT_BUILD @supported_build@

// This defines which client builds the world server will accept.
#if SUPPORTED_CLIENT_BUILD >= CLIENT_BUILD_1_12_1
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 5875, 6005, 6141, 0}
#elif SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_11_2
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 5464, 0}
#elif SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_10_2
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 5302, 0}
#elif SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_9_4
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 5086, 0}
#elif SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_8_4
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 4878, 0}
#elif SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_7_1
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 4695, 0}
#elif SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_6_1
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 4544, 4565, 4620, 0}
#elif SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_5_1
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 4449, 0}
#elif SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_4_2
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 4375, 0}
#elif SUPPORTED_CLIENT_BUILD == CLIENT_BUILD_1_3_1
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 4297, 0}
#else
#define EXPECTED_MANGOSD_CLIENT_BUILD        { 4222, 0}
#endif

// Content patches, used for loading DB data.
enum WowPatch
{
    WOW_PATCH_102 = 0,
    WOW_PATCH_103 = 1,
    WOW_PATCH_104 = 2,
    WOW_PATCH_105 = 3,
    WOW_PATCH_106 = 4,
    WOW_PATCH_107 = 5,
    WOW_PATCH_108 = 6,
    WOW_PATCH_109 = 7,
    WOW_PATCH_110 = 8,
    WOW_PATCH_111 = 9,
    WOW_PATCH_112 = 10
};

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
