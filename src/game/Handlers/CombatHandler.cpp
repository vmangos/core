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

#include "Common.h"
#include "Log.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "CreatureAI.h"
#include "ObjectGuid.h"
#include "Player.h"
#include "Map.h"

void WorldSession::HandleAttackSwingOpcode(WorldPacket& recv_data)
{
    ObjectGuid guid;
    recv_data >> guid;

    if (!guid.IsUnit())
        return;

    Unit* pEnemy = _player->GetMap()->GetUnit(guid);

    if (!pEnemy)
    {
        // stop attack state at client
        SendAttackStop(nullptr);
        return;
    }

    if (_player->IsFriendlyTo(pEnemy) || pEnemy->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING | UNIT_FLAG_NOT_SELECTABLE))
    {
        // stop attack state at client
        SendAttackStop(pEnemy);
        return;
    }

    if (!pEnemy->IsAlive())
    {
        // client can generate swing to known dead target if autoswitch between autoshot and autohit is enabled in client options
        // stop attack state at client
        SendAttackStop(pEnemy);
        return;
    }

    _player->Attack(pEnemy, true);
}

void WorldSession::HandleAttackStopOpcode(WorldPacket& /*recv_data*/)
{
    GetPlayer()->AttackStop();

    /*
    I wanted to take a moment to provide some clarification around what changed in 1.13.3 with Reckoning.
    There were several systemic issues with extra attack procs behaving incorrectly, which we fixed in the patch.
    A secondary effect of these fixes were two notable changes to Reckoning:
    - Reckoning stacks are lost when you mount up.
    - Reckoning stacks are lost when you initiate an auto-attack against a target and cancel it before it goes off.
    However, both of these behaviors were correct behaviors in the 1.12 reference client and as such are considered bug fixes.
    https://us.forums.blizzard.com/en/wow/t/reckoning-is-broken-after-yesterdays-patch/386476/123
    */
    GetPlayer()->ResetExtraAttacks();
}

void WorldSession::HandleSetSheathedOpcode(WorldPacket& recv_data)
{
    uint32 sheathed;
    recv_data >> sheathed;
    if (sheathed >= MAX_SHEATH_STATE)
        return;

    GetPlayer()->InterruptSpellsWithChannelFlags(AURA_INTERRUPT_SHEATHING_CANCELS);
    GetPlayer()->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_SHEATHING_CANCELS);
    GetPlayer()->SetSheath(SheathState(sheathed));
}

void WorldSession::SendAttackStop(Unit const* enemy)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
    WorldPacket data(SMSG_ATTACKSTOP, (4 + 20));            // we guess size
    data << GetPlayer()->GetPackGUID();
    data << (enemy ? enemy->GetPackGUID() : PackedGuid());  // must be packed guid
#else
    WorldPacket data(SMSG_ATTACKSTOP);
    data << GetPlayer()->GetGUID();
    data << (enemy ? enemy->GetGUID() : uint64());
#endif
    data << uint32(0);                                      // unk, can be 1 also
    SendPacket(&data);
}
