/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "ResetAiAction.h"

#include "Event.h"
#include "Group.h"
#include "ObjectGuid.h"
#include "PlayerbotRepository.h"
#include "Playerbots.h"
#include "WorldPacket.h"

bool ResetAiAction::Execute(Event event)
{
    // SMSG_GROUP_LIST parsing not available for Vanilla - missing fields and LFG support
    if (!event.getPacket().empty())
    {
        WorldPacket packet = event.getPacket();
        if (packet.GetOpcode() == SMSG_GROUP_LIST)
        {
            uint8 groupType;
            Group::MemberSlot slot;
            packet >> slot.group;
            // fields not available in Vanilla
            uint8 flags = 0;
            uint8 roles = 0;
            packet >> flags;
            packet >> roles;
            if (groupType & GROUP_LFG)
            {
                uint8 status;
                uint32 dungeon;
                packet >> status;
                packet >> dungeon;
            }
            ObjectGuid guid;
            uint32 counter;
            uint32 membersCount;
            packet >> guid;
            packet >> counter;
            packet >> membersCount;
            if (membersCount != 0)
            {
                return false;
            }
        }
    }
    PlayerbotRepository::instance().Reset(botAI);
    botAI->ResetStrategies(false);
    botAI->TellMaster("AI was reset to defaults");
    return true;
}
