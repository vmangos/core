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

void WorldSession::HandleAttackSwingOpcode(WorldPackets::Combat::AttackSwing const& packet)
{
    if (!packet.targetGuid.IsUnit())
    {
        // stop attack state at client
        SendPacket(GetPlayer()->BuildMeleeAttackStopPacket(packet.targetGuid));
        return;
    }

    Unit* pEnemy = GetPlayer()->GetMap()->GetUnit(packet.targetGuid);
    if (!pEnemy || !GetPlayer()->IsValidAttackTarget(pEnemy))
    {
        // stop attack state at client
        SendPacket(GetPlayer()->BuildMeleeAttackStopPacket(packet.targetGuid));
        return;
    }

    if (GetPlayer()->Attack(pEnemy, true))
    {
        // each new attack shows its swing error again, even the one last sent
        GetPlayer()->SetSwingErrorMsg(ATTACK_RESULT_OK);
    }
    else if (!GetPlayer()->GetVictim())
    {
        // stop attack state at client
        SendPacket(GetPlayer()->BuildMeleeAttackStopPacket(packet.targetGuid));
    }
}

void WorldSession::HandleAttackStopOpcode(NullClientPacket const& /*packet*/)
{
    // reject packet if we don't have control
    if (GetPlayer()->IsCharmed())
        return;

    // client maintains the auto attack animation until it receives
    // a SMSG_ATTACKSTOP with its own player guid as the attacker, 
    // so send the packet even if we have no victim as confirmation
    if (!GetPlayer()->AttackStop())
        SendPacket(GetPlayer()->BuildMeleeAttackStopPacket());

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

void WorldSession::HandleSetSheathedOpcode(WorldPackets::Combat::SetSheathed const& packet)
{
    if (packet.sheathed >= MAX_SHEATH_STATE)
        return;

    GetPlayer()->InterruptSpellsWithChannelFlags(AURA_INTERRUPT_SHEATHING_CANCELS);
    GetPlayer()->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_SHEATHING_CANCELS);
    GetPlayer()->SetSheath(SheathState(packet.sheathed));
}
