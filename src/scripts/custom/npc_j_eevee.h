#ifndef DEF_NPC_J_EEVEE_AI
#define DEF_NPC_J_EEVEE_AI
#include "scriptPCH.h"

struct npc_j_eevee_dreadsteedAI : public ScriptedAI
{
    npc_j_eevee_dreadsteedAI(Creature* pCreature);
    void Reset();
    uint64 guidPlayer;
    uint32 waitTimer;
    uint8 currentPoint;
    bool waypointReached;

    void MovementInform(uint32 uiType, uint32 uiPointId);
    void UpdateAI(const uint32 uiDiff);

    void SetPlayerGuid(uint64 playerGuid);
    void ShoutFreedom();
};

struct npc_j_eevee_scholomanceAI : public ScriptedAI
{
    npc_j_eevee_scholomanceAI(Creature* pCreature);
    void Reset();

    uint64 guidPlayer;
    uint32 waitTimer;
    uint32 attackRepeatTimer;
    uint8 currentPoint;
    bool waypointReached;
    bool finished;

    void MovementInform(uint32 uiType, uint32 uiPointId);
    void UpdateAI(const uint32 uiDiff);
};

#endif
