/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
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

#ifndef __PACKETPROCESSING_H
#define __PACKETPROCESSING_H

enum PacketProcessing
{
    /*
     * Global systems safety.
     * Anywhere, it is safe to :
     * - Items: Generate new item GUID
     * On a single map (one thread), it is safe to:
     * - Call Player::TeleportTo
     * - Add a global Corpse in ObjectAccessor ON THE CURRENT MAP
    /*
     * PACKET_PROCESS_WORLD
     * Thread safe environment for this packet.
     */
    PACKET_PROCESS_WORLD = 0,                               //packet is not thread-safe - process it in World::UpdateSessions()
    /*
     * PACKET_PROCESS_MAP
     * Unsafe:
     * - Add / Remove players from other Maps
     * - Write Groups / Guilds / Loots
     * - Write any Object located in another Map
     * - Write Database global cache
     * Safe:
     * - Read current Map objects
     * - Read Groups / Guilds / Loots
     * - Iterate Groups / Guilds / Loots ...
     * - Call player->GetSession()->SendPacket() for any player
     * - Remove / Add players to current Map
     */
    PACKET_PROCESS_MAP,
    /*
     * PACKET_PROCESS_SPELLS
     * Same safety as PACKET_PROCESS_MAP
     * but is checked more frequently
     */
    PACKET_PROCESS_SPELLS,
    /*
     * PACKET_PROCESS_MOVEMENT
     * Same safety as PACKET_PROCESS_MAP
     * but is checked more frequently
     */
    PACKET_PROCESS_MOVEMENT,
    /*
     * PACKET_PROCESS_ASYNC
     * Handled whenever session update is not running.
     * Never at the same time as PACKET_PROCESS_WORLD.
     * Never while cli and gm commands are being executed.
     * Can be at the same time as maps are being updated.
     * Be careful touching the player.
     * Never touch the map.
     */
    PACKET_PROCESS_ASYNC,
    PACKET_PROCESS_MAX_TYPE,                                // no handler for this packet (server side, or not implemented)
    /*
     * PACKET_PROCESS_SELF_ITEMS
     * Only affects current player items.
     * Self:
     * - Write (and create) items
     * - Write quests
     * Map:
     * - Can modify shared items (loots for example)
     * Cross Maps:
     * - Read Groups
     * - No other modification / no read allowed
     */
    PACKET_PROCESS_SELF_ITEMS = PACKET_PROCESS_MAP,
    /*
    * PACKET_PROCESS_DB_QUERY
    * Does not write anything. Can be processed as long as containers are not being reloaded.
    * Reads static data (usually data from World DB)
    */
    PACKET_PROCESS_DB_QUERY = PACKET_PROCESS_ASYNC,
    /*
     * PACKET_PROCESS_CHANNEL
     * Allowed:
     * - Read / Iterate channels
     * - Modify channels
     * - Add / Remove channels
     */
    PACKET_PROCESS_CHANNEL = PACKET_PROCESS_WORLD,
    /*
     * PACKET_PROCESS_CHANNEL
     * Allowed:
     * - Read / Lookup Groups
     * - Modify Groups
     * - Add / Remove Groups
     * - Remove Group from any Player
     */
    PACKET_PROCESS_GROUP = PACKET_PROCESS_WORLD,
    /*
     * PACKET_PROCESS_CHANNEL
     * Allowed:
     * - Read / Lookup Guilds
     * - Modify Guilds
     * - Add / Remove Guilds
     * - Remove Guilds from any Player
     */
    PACKET_PROCESS_GUILD = PACKET_PROCESS_WORLD,
};

#endif
