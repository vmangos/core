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
SDName: Azshara
SD%Complete: 90
SDComment: Quest support: 2744, 3141, 9364
SDCategory: Azshara
EndScriptData */

/* ContentData
go_southfury_moonstone
mobs_spitelashes
npc_loramus_thalipedes
EndContentData */

#include "scriptPCH.h"
#include "World.h"

/*######
## mobs_spitelashes
######*/

struct mobs_spitelashesAI : public ScriptedAI
{
    mobs_spitelashesAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 morphtimer;
    bool spellhit;

    void Reset()
    {
        morphtimer = 0;
        spellhit = false;
    }

    void SpellHit(Unit *Hitter, const SpellEntry *Spellkind)
    {
        if (!spellhit && Hitter->GetTypeId() == TYPEID_PLAYER)
        {
            if (((Player*)Hitter)->GetQuestStatus(9364) == QUEST_STATUS_INCOMPLETE &&
                    (Spellkind->Id == 118 || Spellkind->Id == 12824 || Spellkind->Id == 12825 || Spellkind->Id == 12826))
            {
                spellhit = true;
                DoCastSpellIfCan(m_creature, 29124);                      //become a sheep
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        // we mustn't remove the creature in the same round in which we cast the summon spell, otherwise there will be no summons
        if (spellhit && morphtimer >= 5000)
        {
            m_creature->ForcedDespawn();
            return;
        }

        // walk 5 seconds before summoning
        if (spellhit && morphtimer < 5000)
        {
            morphtimer += diff;
            if (morphtimer >= 5000)
            {
                DoCastSpellIfCan(m_creature, 28406);                  //summon copies
                DoCastSpellIfCan(m_creature, 6924);                   //visual explosion
                uint32 invocation_nb = rand() % 4;
                invocation_nb = invocation_nb + 2;
                for (uint32 counter = 0; counter < invocation_nb; counter++)
                {
                    if (Creature* summoned = DoSpawnCreature(16479, 8.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 12000))
                    {
                        summoned->SetHomePosition(summoned->GetPositionX(), summoned->GetPositionY(), summoned->GetPositionZ(), 0.0f);
                        summoned->SetDefaultMovementType(RANDOM_MOTION_TYPE);
                        summoned->SetRespawnRadius(55.0f);
                    }
                }

            }
        }
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //TODO: add abilities for the different creatures
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mobs_spitelashes(Creature* pCreature)
{
    return new mobs_spitelashesAI(pCreature);
}

/*######
## npc_loramus_thalipedes
######*/

bool GossipHello_npc_loramus_thalipedes(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(2744) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Can you help me?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(3141) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Tell me your story", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_loramus_thalipedes(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->AreaExploredOrEventHappens(2744);
            break;

        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Please continue", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 21);
            pPlayer->SEND_GOSSIP_MENU(1813, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+21:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I do not understand", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 22);
            pPlayer->SEND_GOSSIP_MENU(1814, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+22:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Indeed", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 23);
            pPlayer->SEND_GOSSIP_MENU(1815, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+23:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I will do this with or your help, Loramus", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 24);
            pPlayer->SEND_GOSSIP_MENU(1816, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+24:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Yes", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 25);
            pPlayer->SEND_GOSSIP_MENU(1817, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+25:
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->AreaExploredOrEventHappens(3141);
            break;
    }
    return true;
}

//--Alita MAWS
enum
{
    //sorts
    EAU_SOMBRE  = 25743,
    FRENESIE    = 19812,
    SACCAGER    = 25744, //charge
    EMOTE_THE_BEAST_RETURNS = -1000800
};
struct Locations
{
    float x, y, z;
};
//tourne dans l'eau avant aggro.
static Locations ronde[] =
{
    { 3525.413330f, -6673.905273f, -20.0f },//à cause de l'animation qui tombe je m'étais dit hop dans l'eau. non utilisé.
    { 3561.725098f, -6647.203613f, -7.5f },//entre 57 et 58 metres du maelstom //spawn
    { 3569.491211f, -6601.534668f, -7.5f },
    { 3567.581787f, -6601.534668f, -7.5f },

    { 3556.089844f, -6580.337402f, -7.5f },
    { 3535.929199f, -6566.029785f, -7.5f },
    { 3512.707275f, -6560.118164f, -7.5f },
    { 3481.141113f, -6564.093262f, -7.5f },

    { 3471.087158f, -6577.640137f, -7.5f },
    { 3457.589844f, -6601.105957f, -7.5f },
    { 3455.857666f, -6626.840820f, -7.5f },
    { 3464.808838f, -6650.078613f, -7.5f },

    { 3482.844238f, -6667.317383f, -7.5f },
    { 3506.620361f, -6675.020020f, -7.5f },
    { 3525.413330f, -6673.905273f, -7.5f }
};

struct mob_mawsAI : public ScriptedAI
{
    mob_mawsAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        LastWayPoint = 2;
        Reset();
    }
    uint32 LastWayPoint;
    uint32 SaccagerTimer;
    uint32 SaccagerTimerMax;
    uint32 FrenzyTimer;
    uint32 FrenzyTimerMax;
    uint32 DarkWaterTimer;
    uint32 LeaveCombatTimer; //juste pour éviter des abus.

    bool InCombat;
    bool PhaseTwo;

    void MovementInform(uint32 uiType, uint32 uiPointId)
    {
        if (!InCombat)
        {
            if (uiPointId < 14)
                m_creature->GetMotionMaster()->MovePoint(uiPointId + 1, ronde[uiPointId + 1].x, ronde[uiPointId + 1].y, ronde[uiPointId + 1].z);
            else if (uiPointId == 14)
                m_creature->GetMotionMaster()->MovePoint(1, ronde[1].x, ronde[1].y, ronde[1].z);
        }
        if (uiPointId > 0 && uiPointId < 15)
            LastWayPoint = uiPointId;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (InCombat)
        {
            if (!m_creature->SelectHostileTarget() || !m_creature->getVictim() || LeaveCombatTimer < uiDiff) // m_creature->getThreatManager().isThreatListEmpty() ?
            {
                InCombat = 0;
                Reset();
                return;
            }
            else
            {
                if (!PhaseTwo && m_creature->GetHealthPercent() < 20.0f)
                {
                    PhaseTwo = true;
                    SaccagerTimerMax = 12000;
                    FrenzyTimerMax = 15000;
                    if (SaccagerTimerMax < SaccagerTimer)
                        SaccagerTimer = SaccagerTimerMax;
                    if (FrenzyTimerMax < FrenzyTimer)
                        FrenzyTimer = FrenzyTimerMax;
                }
                if (SaccagerTimer < uiDiff)
                {
                    DoCastSpellIfCan(m_creature->getVictim(), SACCAGER);
                    if (!PhaseTwo)
                        SaccagerTimerMax = urand(20, 120) * 1000;
                    SaccagerTimer = SaccagerTimerMax;
                }
                else
                    SaccagerTimer -= uiDiff;
                if (FrenzyTimer < uiDiff)
                {
                    DoCastSpellIfCan(m_creature, FRENESIE);
                    FrenzyTimer = FrenzyTimerMax;
                }
                else
                    FrenzyTimer -= uiDiff;
                if (PhaseTwo)
                {
                    if (DarkWaterTimer < uiDiff)
                    {
                        DoCastSpellIfCan(m_creature, EAU_SOMBRE);
                        DarkWaterTimer = 15000;
                    }
                    else
                        DarkWaterTimer -= uiDiff;
                }

                if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE)
                    m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
                LeaveCombatTimer -= uiDiff;
                DoMeleeAttackIfReady();
            }
        }
        else if (m_creature->getVictim())
            InCombat = 1;
    }
    void DamageTaken(Unit *done_by, uint32 &damage)// l'empecher d'etre kittable infini. s'applique pas aux dégats de la charge.
    {
        LeaveCombatTimer = 30000;
    }

    void JustDied(Unit* pKiller)
    {
        sWorld.SendWorldText(EMOTE_THE_BEAST_RETURNS);
    }

    void Reset()
    {
        PhaseTwo = 0;
        InCombat = 0;
        m_creature->RemoveAllAuras();
        m_creature->DeleteThreatList();
        m_creature->CombatStop(true);
        m_creature->SetLootRecipient(NULL);
        LeaveCombatTimer = 30000;
        SaccagerTimer = urand(20, 120) * 1000;
        SaccagerTimerMax = 120000;
        FrenzyTimer = 25000;
        FrenzyTimerMax = 25000;
        DarkWaterTimer = 15000;

        m_creature->GetMotionMaster()->MovePoint(LastWayPoint, ronde[LastWayPoint].x, ronde[LastWayPoint].y, ronde[LastWayPoint].z);
    }

};

CreatureAI* GetAI_mob_maws(Creature* pCreature)
{
    return new mob_mawsAI(pCreature);
}
//--

void AddSC_azshara()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "mobs_spitelashes";
    newscript->GetAI = &GetAI_mobs_spitelashes;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_loramus_thalipedes";
    newscript->pGossipHello =  &GossipHello_npc_loramus_thalipedes;
    newscript->pGossipSelect = &GossipSelect_npc_loramus_thalipedes;
    newscript->RegisterSelf();

    //--Alita
    newscript = new Script;
    newscript->Name = "mob_maws";
    newscript->GetAI = &GetAI_mob_maws;
    newscript->RegisterSelf();
    //--
}
