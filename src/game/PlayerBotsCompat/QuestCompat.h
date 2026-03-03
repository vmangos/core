#pragma once
#include "Objects/Player.h"

inline uint32 PB_GetQuestSlotQuestId(Player const* p, uint16 slot)
{
    return p->GetUInt32Value(PLAYER_QUEST_LOG_1_1 + slot * MAX_QUEST_OFFSET + QUEST_ID_OFFSET);
}
