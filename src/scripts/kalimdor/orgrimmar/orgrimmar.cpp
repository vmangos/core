/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Orgrimmar
SD%Complete: 100
SDComment: Quest support: 2460, 6566
SDCategory: Orgrimmar
EndScriptData */

/* ContentData
npc_shenthul
npc_thrall_warchief
EndContentData */

#include "scriptPCH.h"

/*######
## npc_shenthul
######*/

enum
{
    QUEST_SHATTERED_SALUTE  = 2460
};

struct npc_shenthulAI : public ScriptedAI
{
    npc_shenthulAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool CanTalk;
    bool CanEmote;
    uint32 Salute_Timer;
    uint32 Reset_Timer;
    uint64 playerGUID;

    void Reset()
    {
        CanTalk = false;
        CanEmote = false;
        Salute_Timer = 6000;
        Reset_Timer = 0;
        playerGUID = 0;
    }

    void ReceiveEmote(Player* pPlayer, uint32 emote)
    {
        if (emote == TEXTEMOTE_SALUTE && pPlayer->GetQuestStatus(QUEST_SHATTERED_SALUTE) == QUEST_STATUS_INCOMPLETE)
        {
            if (CanEmote)
            {
                pPlayer->AreaExploredOrEventHappens(QUEST_SHATTERED_SALUTE);
                Reset();
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (CanEmote)
        {
            if (Reset_Timer < diff)
            {
                if (Player* pPlayer = m_creature->GetMap()->GetPlayer(playerGUID))
                {
                    if (pPlayer->GetTypeId() == TYPEID_PLAYER && pPlayer->GetQuestStatus(QUEST_SHATTERED_SALUTE) == QUEST_STATUS_INCOMPLETE)
                        pPlayer->FailQuest(QUEST_SHATTERED_SALUTE);
                }
                Reset();
            }
            else Reset_Timer -= diff;
        }

        if (CanTalk && !CanEmote)
        {
            if (Salute_Timer < diff)
            {
                m_creature->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
                CanEmote = true;
                Reset_Timer = 60000;
            }
            else Salute_Timer -= diff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_shenthul(Creature* pCreature)
{
    return new npc_shenthulAI(pCreature);
}

bool QuestAccept_npc_shenthul(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_SHATTERED_SALUTE)
    {
        ((npc_shenthulAI*)pCreature->AI())->CanTalk = true;
        ((npc_shenthulAI*)pCreature->AI())->playerGUID = pPlayer->GetGUID();
    }
    return true;
}

struct SpawnLocation
{
    float m_fX, m_fY, m_fZ;
};

// NOTE: Valley of Honor is explicitly not supposed to receive the buff
static const SpawnLocation aRallyGeneratorLocs[6] =
{
    { 1678.6f, -4355.3f, 61.73f }, // Valley of Strength (North)
    { 1550.3f, -4186.2f, 40.95f }, // Valley of Spirits
    { 1931.2f, -4279.3f, 29.90f }, // Valley of Wisdom
    { 1919.0f, -4117.2f, 43.45f }, // Thrall's Chamber
    { 1804.3f, -4344.9f, -2.9f  }, // The Cleft of Shadow
    { 1881.0f, -4518.5f, 27.74f }  // The Drag
};

enum
{
    SPELL_RALLYING_CRY_DRAGONSLAYER = 22888,
    NPC_RALLY_CRY_GENERATOR_HORDE   = 21001,

    MAX_RALLY_GENERATORS            = 6
};

/*######
## npc_overlord_runthak
######*/

enum
{
    QUEST_FOR_ALL_TO_SEE                = 7491,

    YELL_ONY_REWARD_1_HORDE             = -1900113,
    YELL_ONY_REWARD_2_HORDE             = -1900112,

    GO_ONYXIAS_HEAD_HORDE               = 179556
};

struct npc_overlord_runthakAI : public ScriptedAI
{
    npc_overlord_runthakAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }
    uint32 m_uiTick;
    uint32 m_uiDialogueTimer;
    bool m_bRallyingCryEvent;
    ObjectGuid m_playerGuid;

    void Reset()
    {
        m_uiTick = 0;
        m_uiDialogueTimer = 2000;
        m_bRallyingCryEvent = false;
        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    void StartRallyEvent(ObjectGuid playerGuid)
    {
        m_playerGuid = playerGuid;
        m_bRallyingCryEvent = true;
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    void MovementInform(uint32 uiType, uint32 uiPointId)
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        switch (uiPointId)
        {
            case 0:
                m_creature->GetMotionMaster()->MovePoint(1, 1541.95f, -4405.1f, 10.244f);
                break;
            case 1:
                m_uiDialogueTimer = 1000; 
                m_uiTick++;
                break;
            case 2:
                m_creature->GetMotionMaster()->MovePoint(3, 1568.0f, -4405.87f, 8.13371f);
                break;
            case 3:
                Reset();
                break;
        }
    }

    void UpdateAI(uint32 const uiDiff)
    {
        if (m_bRallyingCryEvent)
        {
            if (m_uiDialogueTimer <= uiDiff)
            {
                switch (m_uiTick)
                {
                    case 0:
                        m_creature->GetMotionMaster()->MovePoint(0, 1540.2f, -4405.02f, 11.18f, MOVE_PATHFINDING);
                        m_uiDialogueTimer = 30000; //handled by MovementInform
                        break;
                    case 1:
                        if (Player* pPlayer = m_creature->GetMap()->GetPlayer(m_playerGuid))
                        {
                            m_creature->HandleEmote(EMOTE_ONESHOT_SHOUT);
                            m_creature->MonsterYellToZone(YELL_ONY_REWARD_1_HORDE, 0, pPlayer);
                        }
                        if (GameObject* pGo = m_creature->FindNearestGameObject(GO_ONYXIAS_HEAD_HORDE, 150.0f))
                        {
                            if (!pGo->isSpawned())
                            {
                                pGo->SetRespawnTime(7200);
                                pGo->Refresh();
                            }
                        }
                        m_uiDialogueTimer = 8000;
                        m_uiTick++;
                        break;
                    case 2:
                        m_creature->HandleEmote(EMOTE_ONESHOT_SHOUT);
                        m_creature->MonsterYellToZone(YELL_ONY_REWARD_2_HORDE);
                        if (GameObject* pGo = m_creature->FindNearestGameObject(GO_ONYXIAS_HEAD_HORDE, 150.0f))
                        {
                            pGo->SetGoState(GO_STATE_ACTIVE);
                        }
                        m_uiDialogueTimer = 7000;
                        m_uiTick++;
                        break;
                    case 3:
                        m_creature->CastSpell(m_creature, SPELL_RALLYING_CRY_DRAGONSLAYER, true);
                        for (uint8 i = 0; i < MAX_RALLY_GENERATORS; ++i)
                        {
                            if (Creature* pGenerator = m_creature->SummonCreature(NPC_RALLY_CRY_GENERATOR_HORDE, aRallyGeneratorLocs[i].m_fX, aRallyGeneratorLocs[i].m_fY, aRallyGeneratorLocs[i].m_fZ, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 1000))
                                pGenerator->CastSpell(pGenerator, SPELL_RALLYING_CRY_DRAGONSLAYER, true);
                        }
                        m_uiDialogueTimer = 2000;
                        m_uiTick++;
                        break;
                    case 4:
                        m_creature->GetMotionMaster()->MovePoint(2, 1570.0f, -4405.89f, 7.63613f);
                        m_uiDialogueTimer = 30000; //handled by MovementInform
                        return;
                }
            }
            else m_uiDialogueTimer -= uiDiff;
        } 

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_overlord_runthak(Creature* pCreature)
{
    return new npc_overlord_runthakAI(pCreature);
}

bool QuestRewarded_npc_overlord_runthak(Player* pPlayer, Creature* pCreature, Quest const* quest)
{
    if (quest->GetQuestId() == QUEST_FOR_ALL_TO_SEE)
    {
        if (npc_overlord_runthakAI* pRunthak = dynamic_cast<npc_overlord_runthakAI*>(pCreature->AI()))
            pRunthak->StartRallyEvent(pPlayer->GetObjectGuid());
    }
    return true;
}

/*######
## npc_overlord_saurfang
######*/

enum
{
    SPELL_SF_EXECUTE      = 7160,  //OK
    SPELL_SF_CLEAVE       = 15284, //OK
    SPELL_SF_CHARGE       = 22886, //OK
    SPELL_SF_THUNDERCLAP  = 23931, //?
    SPELL_SF_MORTALSTRIKE = 12294, //?
    SPELL_SF_SAURFANGRAGE = 26339,

    QUEST_LORD_OF_BLACKROCK_HORDE       = 7784,

    YELL_NEF_REWARD_1_HORDE     = -1900106,
    YELL_NEF_REWARD_2_HORDE     = -1900105,

    GO_NEFARIANS_HEAD_HORDE            = 179881,
};

struct npc_overlord_saurfangAI : public ScriptedAI
{
    npc_overlord_saurfangAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiExecute_Timer;
    uint32 m_uiCleave_Timer;
    uint32 m_uiCharge_Timer;
    uint32 m_uiThunderClap_Timer;
    uint32 m_uiMortalStrike_Timer;
    uint32 m_uiSaurfangRage_Timer;
    bool isInCombat;

    uint32 m_uiTick;
    uint32 m_uiDialogueTimer;
    bool m_bRallyingCryEvent;
    ObjectGuid m_playerGuid;

    void Reset()
    {
        isInCombat = false;
        m_uiExecute_Timer = 0;
        m_uiCleave_Timer = 7000;
        m_uiCharge_Timer = 0;
        m_uiThunderClap_Timer = 5000;
        m_uiMortalStrike_Timer = 13000;
        m_uiSaurfangRage_Timer = urand(3000, 8000);

        m_uiTick = 0;
        m_uiDialogueTimer = 2000;
        m_bRallyingCryEvent = false;
        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    void Aggro(Unit* pWho)
    {
        if (isInCombat == false)
        {
            m_creature->MonsterTextEmote("Saurfang's eyes glow red for a brief moment");
            isInCombat = true;
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
        }
    }

    void KilledUnit(Unit* pVictim)
    {
        if (pVictim->GetTypeId() == TYPEID_PLAYER)
            m_creature->MonsterSay("Is that the best you can do?", 0, 0);
    }

    void StartRallyEvent(ObjectGuid playerGuid)
    {
        m_playerGuid = playerGuid;
        m_bRallyingCryEvent = true;
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP | UNIT_NPC_FLAG_QUESTGIVER);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    void MovementInform(uint32 uiType, uint32 uiPointId) override
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        switch (uiPointId)
        {
            case 0:
                m_creature->GetMotionMaster()->MovePoint(1, 1542.73f, -4425.55f, 10.87f);
                break;
            case 1:
                m_uiDialogueTimer = 1000;
                m_uiTick++;
                break;
            case 2:
                m_creature->GetMotionMaster()->MovePoint(3, 1565.79f, -4395.27f, 6.9866f);
                break;
            case 3:
                Reset();
                break;
        }
    }

    void UpdateAI(const uint32 diff)
    {
      if (m_bRallyingCryEvent)
        {
            if (m_uiDialogueTimer <= diff)
            {
                switch (m_uiTick)
                {
                    case 0:
                        m_creature->GetMotionMaster()->MovePoint(0, 1540.54f, -4427.2f, 11.29f, MOVE_PATHFINDING);
                        m_uiDialogueTimer = 30000; //handled by MovementInform
                        break;
                    case 1:
                        if (Player* pPlayer = m_creature->GetMap()->GetPlayer(m_playerGuid))
                        {
                            m_creature->HandleEmote(EMOTE_ONESHOT_SHOUT);
                            m_creature->MonsterYellToZone(YELL_NEF_REWARD_1_HORDE, 0, pPlayer);
                        }
                        m_uiDialogueTimer = 10000;
                        m_uiTick++;
                        break;
                    case 2:
                        if (Player* pPlayer = m_creature->GetMap()->GetPlayer(m_playerGuid))
                        {
                            m_creature->HandleEmote(EMOTE_ONESHOT_SHOUT);
                            m_creature->MonsterYellToZone(YELL_NEF_REWARD_2_HORDE, 0, pPlayer);
                        }
                        if (GameObject* pGo = m_creature->FindNearestGameObject(GO_NEFARIANS_HEAD_HORDE, 150.0f))
                        {
                            if (!pGo->isSpawned())
                            {
                                pGo->SetRespawnTime(7200);
                                pGo->Refresh();
                            }
                        }
                        m_uiDialogueTimer = 8000;
                        m_uiTick++;
                        break;
                    case 3:
                        if (GameObject* pGo = m_creature->FindNearestGameObject(GO_NEFARIANS_HEAD_HORDE, 150.0f))
                        {
                            pGo->SetGoState(GO_STATE_ACTIVE);
                        }
                        m_uiDialogueTimer = 5000;
                        m_uiTick++;
                        break;
                    case 4:
                        m_creature->CastSpell(m_creature, SPELL_RALLYING_CRY_DRAGONSLAYER, true);
                        for (uint8 i = 0; i < MAX_RALLY_GENERATORS; ++i)
                        {
                            if (Creature* pGenerator = m_creature->SummonCreature(NPC_RALLY_CRY_GENERATOR_HORDE, aRallyGeneratorLocs[i].m_fX, aRallyGeneratorLocs[i].m_fY, aRallyGeneratorLocs[i].m_fZ, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 1000))
                                pGenerator->CastSpell(pGenerator, SPELL_RALLYING_CRY_DRAGONSLAYER, true);
                        }
                        m_uiDialogueTimer = 10000;
                        m_uiTick++;
                        break;
                    case 5:
                        m_creature->GetMotionMaster()->MovePoint(2, 1567.39f, -4394.9f, 6.89f);
                        m_uiDialogueTimer = 30000; //handled by MovementInform
                        return;
                }
            }
            else
                m_uiDialogueTimer -= diff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_creature->getVictim()->GetHealth() <= m_creature->getVictim()->GetMaxHealth() * 0.2f && m_uiExecute_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SF_EXECUTE);
            m_uiExecute_Timer = 2000;
        }
        else m_uiExecute_Timer -= diff;

        if (m_uiMortalStrike_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SF_MORTALSTRIKE);
            m_uiMortalStrike_Timer = 13000;
        }
        else m_uiMortalStrike_Timer -= diff;

        /*        if (m_uiCleave_Timer < diff)
                {
                    DoCastSpellIfCan(m_creature->getVictim(), SPELL_SF_CLEAVE);
                    m_uiCleave_Timer = 7000;
                }
                else m_uiCleave_Timer -= diff;
        */
        if (m_uiCharge_Timer < diff && m_creature->GetDistance(m_creature->getVictim()->GetPositionX(),
                m_creature->getVictim()->GetPositionY(),
                m_creature->getVictim()->GetPositionZ()) >= 8.0f)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SF_CHARGE);
            m_uiCharge_Timer = 9000;
        }
        else m_uiCharge_Timer -= diff;
        /*
                if (m_uiThunderClap_Timer < diff)
                {
                    DoCastSpellIfCan(m_creature->getVictim(), SPELL_SF_THUNDERCLAP);
                    m_uiThunderClap_Timer = 9000;
                }
                else m_uiThunderClap_Timer -= diff;
        */
        if (m_uiSaurfangRage_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SF_SAURFANGRAGE) ;
            m_uiSaurfangRage_Timer = 8000;
        }
        else m_uiSaurfangRage_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};


CreatureAI* GetAI_npc_overlord_saurfang(Creature* pCreature)
{
    return new npc_overlord_saurfangAI(pCreature);
}

bool QuestRewarded_npc_overlord_saurfang(Player* pPlayer, Creature* pCreature, Quest const* quest)
{
    if (quest->GetQuestId() == QUEST_LORD_OF_BLACKROCK_HORDE)
    {
        if (npc_overlord_saurfangAI* pSaurfang = dynamic_cast<npc_overlord_saurfangAI*>(pCreature->AI()))
            pSaurfang->StartRallyEvent(pPlayer->GetObjectGuid());
    }
    return true;
}


/*######
## npc_thrall_warchief
######*/

#define QUEST_6566              6566

#define SPELL_CHAIN_LIGHTNING   16033
#define SPELL_SHOCK             16034

static const SpawnLocation aBlessingGeneratorLocs[8] =
{
    { 1678.6f, -4355.3f, 61.73f }, // Valley of Strength (North)
    { 1543.2f, -4413.9f, 10.14f }, // Valley of Strength (South)
    { 1550.3f, -4186.2f, 40.95f }, // Valley of Spirits
    { 1931.2f, -4279.3f, 29.90f }, // Valley of Wisdom
    { 1804.3f, -4344.9f, -2.9f  }, // The Cleft of Shadow
    { 1881.0f, -4518.5f, 27.74f }, // The Drag
    { 316.50f, -4737.3f, 9.56f  }, // Razor Hill
    { -2356.8f, -1932.5f, 96.0f }  // Camp Taurajo
};

enum
{
    SPELL_WARCHIEF_BLESSING         = 16609,
    NPC_WARCHIEF_BLESSING_GENERATOR = 21003,
    NPC_HERALD_THRALL               = 10719,
    MAX_BLESSING_GENERATORS         = 8,
    QUEST_FOR_THE_HORDE             = 4974,
    YELL_WARCHIEF_BLESSING_1        = -1900109,
    YELL_WARCHIEF_BLESSING_2        = -1900108,
    YELL_WARCHIEF_BLESSING_3        = -1900107,
    WARCHIEF_BLESSING_COOLDOWN      = 30000
};

//TODO: verify abilities/timers
struct npc_thrall_warchiefAI : public ScriptedAI
{
    npc_thrall_warchiefAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_uiTick = 0;
        m_uiBlessingEventTimer = 0;
        m_bBlessingEvent = false;
    }

    uint32 m_uiTick;
    uint32 ChainLightning_Timer;
    uint32 Shock_Timer;
    uint32 m_uiBlessingEventTimer;
    bool m_bBlessingEvent;
    Creature* m_pHerald;

    void Reset()
    {
        ChainLightning_Timer = 2000;
        Shock_Timer = 8000;
    }

    void StartBlessingEvent()
    {
        if (!m_bBlessingEvent)
        {
            m_uiTick = 0;
            m_uiBlessingEventTimer = 0;
            m_bBlessingEvent = true;
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (m_bBlessingEvent)
        {
            if (m_uiBlessingEventTimer <= diff)
            {
                // Need video evidence to adjust the timers
                switch (m_uiTick)
                {
                    case 0:
                        // Spawn Herald of Thrall in the Crossroads
                        m_pHerald = m_creature->SummonCreature(NPC_HERALD_THRALL, -462.404f, -2637.68f, 96.0656f, 5.8606f, TEMPSUMMON_TIMED_DESPAWN, WARCHIEF_BLESSING_COOLDOWN);
                        if (m_pHerald)
                            m_pHerald->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_PASSIVE);

                        m_uiBlessingEventTimer = 3000;
                        m_uiTick++;
                        break;
                    case 1:
                        // Do the first shout
                        m_creature->HandleEmote(EMOTE_ONESHOT_SHOUT);
                        m_creature->MonsterYellToZone(YELL_WARCHIEF_BLESSING_1);
                        if (m_pHerald)
                        {
                            m_pHerald->HandleEmote(EMOTE_ONESHOT_SHOUT);
                            m_pHerald->MonsterYellToZone(YELL_WARCHIEF_BLESSING_1);
                        }
                        m_uiBlessingEventTimer = 10000;
                        m_uiTick++;
                        break;
                    case 2:
                        // Do the second shout
                        m_creature->HandleEmote(EMOTE_ONESHOT_SHOUT);
                        m_creature->MonsterYellToZone(YELL_WARCHIEF_BLESSING_2);
                        if (m_pHerald)
                        {
                            m_pHerald->HandleEmote(EMOTE_ONESHOT_SHOUT);
                            m_pHerald->MonsterYellToZone(YELL_WARCHIEF_BLESSING_3);
                        }
                        m_uiBlessingEventTimer = 2000;
                        m_uiTick++;
                        break;
                    case 3:
                        // Cast the spell and spawn buff generators
                        m_creature->CastSpell(m_creature, SPELL_WARCHIEF_BLESSING, true);
                        if (m_pHerald)
                            m_pHerald->CastSpell(m_pHerald, SPELL_WARCHIEF_BLESSING, true);
                        for (uint8 i = 0; i < MAX_BLESSING_GENERATORS; ++i)
                        {
                            if (Creature* pGenerator = m_creature->SummonCreature(NPC_WARCHIEF_BLESSING_GENERATOR, aBlessingGeneratorLocs[i].m_fX, aBlessingGeneratorLocs[i].m_fY, aBlessingGeneratorLocs[i].m_fZ, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 1000))
                                pGenerator->CastSpell(pGenerator, SPELL_WARCHIEF_BLESSING, true);
                        }
                        // Disable the event for 6 hours
                        m_uiBlessingEventTimer = WARCHIEF_BLESSING_COOLDOWN;
                        m_uiTick++;
                        break;
                    case 4:
                        m_uiTick = 0;
                        m_uiBlessingEventTimer = 0;
                        m_bBlessingEvent = false;
                        return;
                }
            }
            else m_uiBlessingEventTimer -= diff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (ChainLightning_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_CHAIN_LIGHTNING);
            ChainLightning_Timer = 9000;
        }
        else ChainLightning_Timer -= diff;

        if (Shock_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHOCK);
            Shock_Timer = 15000;
        }
        else Shock_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_thrall_warchief(Creature* pCreature)
{
    return new npc_thrall_warchiefAI(pCreature);
}

bool GossipHello_npc_thrall_warchief(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(QUEST_6566) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Please share your wisdom with me, Warchief.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_thrall_warchief(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What discoveries?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(5733, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Usurper?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->SEND_GOSSIP_MENU(5734, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "With all due respect, Warchief - why not allow them to be destroyed? Does this not strengthen our position?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            pPlayer->SEND_GOSSIP_MENU(5735, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I... I did not think of it that way, Warchief.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->SEND_GOSSIP_MENU(5736, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+5:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I live only to serve, Warchief! My life is empty and meaningless without your guidance.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
            pPlayer->SEND_GOSSIP_MENU(5737, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+6:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Of course, Warchief!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
            pPlayer->SEND_GOSSIP_MENU(5738, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+7:
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->AreaExploredOrEventHappens(QUEST_6566);
            break;
    }
    return true;
}

bool QuestRewarded_npc_thrall_warchief(Player* pPlayer, Creature* pCreature, Quest const* quest)
{
    if (quest->GetQuestId() == QUEST_FOR_THE_HORDE)
    {
        if (npc_thrall_warchiefAI* pThrall = dynamic_cast<npc_thrall_warchiefAI*>(pCreature->AI()))
            pThrall->StartBlessingEvent();
    }
    return true;
}

bool GossipHello_npc_eitrigg(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(4941) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(4941);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

/*######
## npc_voljin
######*/

bool GossipHello_npc_voljin(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

enum eSpells
{
    SPELL_HEX               = 16097,
    SPELL_SHADOW_SHOCK      = 17289,
    SPELL_SHADOW_WORD_PAIN  = 17146,
    SPELL_SHOOT             = 20463,
    SPELL_VEIL_OF_SHADOW    = 17820,
};

struct boss_vol_jinAI : public ScriptedAI
{
public:
    boss_vol_jinAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
        m_uiHexTimer = 10000;
        m_uiShadowShockTimer = 8000;
        m_uiShadowWordPainTimer = 12000;
        m_uiShootTimer = 10000;
        m_uiVeilOfShadowTimer = 18000;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiHexTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_HEX) == CAST_OK)
                m_uiHexTimer = 10000;
        }
        else
            m_uiHexTimer -= uiDiff;

        if (m_uiShadowShockTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOW_SHOCK) == CAST_OK)
                m_uiShadowShockTimer = urand(8000, 12000);
        }
        else
            m_uiShadowShockTimer -= uiDiff;

        if (m_uiShadowWordPainTimer <= uiDiff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_SHADOW_WORD_PAIN) == CAST_OK)
                    m_uiShadowWordPainTimer = 12000;
            }
        }
        else
            m_uiShadowWordPainTimer -= uiDiff;

        if (m_uiShootTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHOOT) == CAST_OK)
                m_uiShootTimer = 10000;
        }
        else
            m_uiShootTimer -= uiDiff;

        if (m_uiVeilOfShadowTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_VEIL_OF_SHADOW) == CAST_OK)
                m_uiVeilOfShadowTimer = 18000;
        }
        else
            m_uiVeilOfShadowTimer -= uiDiff;

        DoMeleeAttackIfReady();
        EnterEvadeIfOutOfCombatArea(uiDiff);
    }

private:
    uint32 m_uiHexTimer;
    uint32 m_uiShadowShockTimer;
    uint32 m_uiShadowWordPainTimer;
    uint32 m_uiShootTimer;
    uint32 m_uiVeilOfShadowTimer;
};

CreatureAI* GetAI_boss_vol_jin(Creature* pCreature)
{
    return new boss_vol_jinAI(pCreature);
}


void AddSC_orgrimmar()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_shenthul";
    newscript->GetAI = &GetAI_npc_shenthul;
    newscript->pQuestAcceptNPC =  &QuestAccept_npc_shenthul;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_thrall_warchief";
    newscript->GetAI = &GetAI_npc_thrall_warchief;
    newscript->pGossipHello =  &GossipHello_npc_thrall_warchief;
    newscript->pGossipSelect = &GossipSelect_npc_thrall_warchief;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_thrall_warchief;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_voljin";
    newscript->GetAI = &GetAI_boss_vol_jin;
    newscript->pGossipHello   = &GossipHello_npc_voljin;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_eitrigg";
    newscript->pGossipHello =  &GossipHello_npc_eitrigg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_overlord_runthak";
    newscript->GetAI = &GetAI_npc_overlord_runthak;
    newscript->pQuestRewardedNPC =  &QuestRewarded_npc_overlord_runthak;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_overlord_saurfang";
    newscript->GetAI = &GetAI_npc_overlord_saurfang;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_overlord_saurfang;
    newscript->RegisterSelf();
}
