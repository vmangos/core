/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
SDName: Zulfarrak
SD%Complete: 50
SDComment: Consider it temporary, no instance script made for this instance yet.
SDCategory: Zul'Farrak
EndScriptData */

/* ContentData
npc_sergeant_bly
npc_weegli_blastfuse
EndContentData */

#include "scriptPCH.h"
#include "zulfarrak.h"

/*######
## npc_sergeant_bly
######*/

enum blyAndCrewFactions
{
    FACTION_HOSTILE           = 14,
    FACTION_FRIENDLY          = 35,  //while in cages (so the trolls won't attack them while they're caged)
    FACTION_FREED             = 250  //after release (so they'll be hostile towards trolls)
};

enum blySays
{
    SAY_1       = -1209002, // What? How dare you say that to me?!?
    SAY_2       = -1209003, // After all we've been through? Well, I didn't like you anyway!!
    SAY_WEEGLI  = -1209004, // I'm out of here!
};

enum blySpells
{
    SPELL_SHIELD_BASH          = 11972,
    SPELL_REVENGE              = 12170
};

#define GOSSIP_BLY                  "That's it! I'm tired of helping you out.  It's time we settled things on the battlefield!"


struct npc_sergeant_blyAI : public ScriptedAI
{
    npc_sergeant_blyAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = pCreature->GetInstanceData();
        postGossipStep = 0;
        Text_Timer = 0;
        PlayerGUID = 0;
        Reset();
    }

    InstanceData* pInstance;

    uint32 postGossipStep;
    uint32 Text_Timer;
    uint32 ShieldBash_Timer;
    uint32 Revenge_Timer;                                   //this is wrong, spell should never be used unless m_creature->getVictim() dodge, parry or block attack. Trinity support required.
    uint64 PlayerGUID;

    void Reset()
    {
        ShieldBash_Timer = 5000;
        Revenge_Timer = 8000;

//        m_creature->setFaction(FACTION_FRIENDLY);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!pInstance)
            return;

        if (postGossipStep > 0 && postGossipStep < 4)
        {
            if (Text_Timer < diff)
            {
                switch (postGossipStep)
                {
                    case 1:
                        DoScriptText(SAY_1, m_creature);
                        Text_Timer = 5000;
                        break;
                    case 2:
                        DoScriptText(SAY_2, m_creature);
                        Text_Timer = 5000;
                        break;
                    case 3:
                        m_creature->setFaction(FACTION_HOSTILE);
                        if (Player* pTarget = ((Player*)Unit::GetUnit(*m_creature, PlayerGUID)))
                            AttackStart(pTarget);
                        //weegli doesn't fight - he goes & blows up the door
                        if (Creature* weegli = pInstance->instance->GetCreature(pInstance->GetData64(ENTRY_WEEGLI)))
                        {
                            weegli->AI()->DoAction();
                            DoScriptText(SAY_WEEGLI, weegli);
                        }

                        switchFactionIfAlive(pInstance, ENTRY_RAVEN);
                        switchFactionIfAlive(pInstance, ENTRY_ORO);
                        switchFactionIfAlive(pInstance, ENTRY_MURTA);
                }
                postGossipStep++;
            }
            else
                Text_Timer -= diff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (ShieldBash_Timer <= diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHIELD_BASH);
            ShieldBash_Timer = 15000;
        }
        else
            ShieldBash_Timer -= diff;

        if (Revenge_Timer <= diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_REVENGE);
            Revenge_Timer = 10000;
        }
        else
            Revenge_Timer -= diff;

        DoMeleeAttackIfReady();
    }

    void DoAction(const uint32 param)
    {
        postGossipStep = 1;
        Text_Timer = 0;
    }

    void switchFactionIfAlive(InstanceData* pInstance, uint32 entry)
    {
        if (Creature* crew = pInstance->instance->GetCreature(pInstance->GetData64(entry)))
            if (crew->isAlive())
                crew->setFaction(FACTION_HOSTILE);
    }
};

bool OnGossipSelect_npc_sergeant_bly(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        if (npc_sergeant_blyAI* ai = dynamic_cast<npc_sergeant_blyAI*>(pCreature->AI()))
        {
            ai->PlayerGUID = pPlayer->GetGUID();
            ai->DoAction(0);
        }
    }
    return true;
}

bool OnGossipHello_npc_sergeant_bly(Player* pPlayer, Creature* pCreature)
{
    if (InstanceData* pInstance = pCreature->GetInstanceData())
    {
        if (pInstance->GetData(EVENT_PYRAMID) == PYRAMID_KILLED_ALL_TROLLS)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_BLY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->SEND_GOSSIP_MENU(1517, pCreature->GetGUID());
        }
        else if (pInstance->GetData(EVENT_PYRAMID) == PYRAMID_NOT_STARTED)
            pPlayer->SEND_GOSSIP_MENU(1515, pCreature->GetGUID());
        else
            pPlayer->SEND_GOSSIP_MENU(1516, pCreature->GetGUID());
        return true;
    }
    return false;
}

CreatureAI* GetAI_npc_sergeant_bly(Creature* pCreature)
{
    return new npc_sergeant_blyAI(pCreature);
}


void AddSC_npc_sergeant_bly()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "npc_sergeant_bly";
    pNewScript->GetAI = &GetAI_npc_sergeant_bly;
    pNewScript->pGossipHello = &OnGossipHello_npc_sergeant_bly;
    pNewScript->pGossipSelect = &OnGossipSelect_npc_sergeant_bly;
    pNewScript->RegisterSelf();
}

/*######
+## go_troll_cage
+######*/

void initBlyCrewMember(InstanceData* pInstance, uint32 entry, float x, float y, float z)
{
    uint64 creaGUID = pInstance->GetData64(entry);

    if (Creature* crew = pInstance->instance->GetCreature(creaGUID))
    {
        //crew->GetCharmInfo()->SetReactState(REACT_AGGRESSIVE);
        crew->SetCombatStartPosition(x, y, z);
        crew->SetHomePosition(x, y, z, 4.7f);
        crew->GetMotionMaster()->MovePoint(1, x, y, z, MOVE_PATHFINDING | MOVE_WALK_MODE);
        crew->setFaction(FACTION_FREED);
    }
}


bool OnGossipHello_go_troll_cage(Player* pPlayer, GameObject* pGo)
{
    if (InstanceData* pInstance = pGo->GetInstanceData())
    {
        pInstance->SetData(EVENT_PYRAMID, PYRAMID_CAGES_OPEN);
        //set bly & co to aggressive & start moving to top of stairs
        initBlyCrewMember(pInstance, ENTRY_BLY, 1887.17f, 1263.72f, 41.484f);
        initBlyCrewMember(pInstance, ENTRY_RAVEN, 1890.76f, 1265.82f, 41.43f);
        initBlyCrewMember(pInstance, ENTRY_ORO, 1883.3f, 1272.53f, 41.87f);
        initBlyCrewMember(pInstance, ENTRY_WEEGLI, 1883.87f, 1263.49f, 41.55f);
        initBlyCrewMember(pInstance, ENTRY_MURTA, 1886.48f, 1272.76f, 41.76f);
    }
    return false;
}

void AddSC_go_troll_cage()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "go_troll_cage";
    pNewScript->pGOHello = &OnGossipHello_go_troll_cage;
    pNewScript->RegisterSelf();
}
/*######
## npc_weegli_blastfuse
######*/

enum weegliSpells
{
    SPELL_BOMB                 = 8858,
    SPELL_GOBLIN_LAND_MINE     = 21688,
    SPELL_SHOOT                = 6660,
    SPELL_WEEGLIS_BARREL       = 10772
};

enum weegliSays
{
    SAY_WEEGLI_OHNO      = -1209000,
    SAY_WEEGLI_OK_I_GO   = -1209001,
    SAY_CHIEF_UKORZ_DOOR = -1209004
};

#define GOSSIP_WEEGLI               "Will you blow up that door now?"


struct npc_weegli_blastfuseAI : public ScriptedAI
{
    npc_weegli_blastfuseAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        destroyingDoor = false;
        runAway = false;
        Bomb_Timer = 10000;
        LandMine_Timer = 30000;
        explosiveGUID = 0;
        disappear = false;
        regen = false;
    }

    uint64 explosiveGUID;
    uint32 Bomb_Timer;
    uint32 LandMine_Timer;
    bool destroyingDoor;
    bool runAway;
    bool disappear;
    bool regen;
    ScriptedInstance* pInstance;

    void Reset()
    {
        /*if (pInstance)
            pInstance->SetData(0, NOT_STARTED);*/
    }

    void AttackStart(Unit *victim)
    {
        ScriptedAI::AttackStart(victim);
        //AttackStartCaster(victim,10);//keep back & toss bombs/shoot
    }

    void JustDied(Unit * /*victim*/)
    {
        /*if (pInstance)
            pInstance->SetData(0, DONE);*/
    }

    void UpdateAI(const uint32 diff)
    {
        if (regen == false && pInstance->GetData(EVENT_PYRAMID) == PYRAMID_KILLED_ALL_TROLLS)
        {
            regen = true;

            Creature* pOro = m_creature->GetMap()->GetCreature(pInstance->GetData64(ENTRY_ORO));
            if (pOro->isAlive())
                pOro->SetHealthPercent(100.0f);

            Creature* pMurta = m_creature->GetMap()->GetCreature(pInstance->GetData64(ENTRY_MURTA));
            if (pMurta->isAlive())
                pMurta->SetHealthPercent(100.0f);

            Creature* pBly = m_creature->GetMap()->GetCreature(pInstance->GetData64(ENTRY_BLY));
            if (pBly->isAlive())
                pBly->SetHealthPercent(100.0f);

            Creature* pRaven = m_creature->GetMap()->GetCreature(pInstance->GetData64(ENTRY_RAVEN));
            if (pRaven->isAlive())
                pRaven->SetHealthPercent(100.0f);

            if (m_creature->isAlive())
                m_creature->SetHealthPercent(100.0f);
        }


        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;


        if (pInstance->GetData(EVENT_PYRAMID) != PYRAMID_KILLED_ALL_TROLLS)
        {
            Creature* pOro = m_creature->GetMap()->GetCreature(pInstance->GetData64(ENTRY_ORO));
            if (!pOro->SelectHostileTarget() || !pOro->getVictim())
                ((CreatureAI*)pOro->AI())->AttackStart(m_creature->getVictim());

            Creature* pMurta = m_creature->GetMap()->GetCreature(pInstance->GetData64(ENTRY_MURTA));
            if (!pMurta->SelectHostileTarget() || !pMurta->getVictim())
                ((CreatureAI*)pMurta->AI())->AttackStart(m_creature->getVictim());

            Creature* pBly = m_creature->GetMap()->GetCreature(pInstance->GetData64(ENTRY_BLY));
            if (!pBly->SelectHostileTarget() || !pBly->getVictim())
                ((CreatureAI*)pBly->AI())->AttackStart(m_creature->getVictim());
        }

        if (Bomb_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_BOMB);
            Bomb_Timer = 10000;
        }
        else
            Bomb_Timer -= diff;

        if (m_creature->isAttackReady() && !m_creature->IsWithinMeleeRange(m_creature->getVictim()))
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHOOT);
            m_creature->SetSheath(SHEATH_STATE_RANGED);
        }
        else
        {
            m_creature->SetSheath(SHEATH_STATE_MELEE);
            DoMeleeAttackIfReady();
        }
    }

    void MovementInform(uint32 type, uint32 id)
    {
        if (pInstance)
        {
            if (pInstance->GetData(EVENT_PYRAMID) == PYRAMID_CAGES_OPEN)
            {
                if (id == 1)
                {
                    pInstance->SetData(EVENT_PYRAMID, PYRAMID_ARRIVED_AT_STAIR);
                    DoScriptText(SAY_WEEGLI_OHNO, m_creature);
                    m_creature->SetCombatStartPosition(1882.69f, 1272.28f, 41.87f);
                    m_creature->SetWalk(false);
                    m_creature->GetMotionMaster()->MovePoint(2, 1883.27f, 1268.72f, 41.73f);
                }
            }
            else if (pInstance->GetData(EVENT_PYRAMID) == PYRAMID_WAVE_1 && id == 2)
            {
                m_creature->GetMotionMaster()->MovePoint(3, 1888.55f, 1272.19f, 41.67f);
                m_creature->SetCombatStartPosition(1888.55f, 1272.19f, 41.67f);
                m_creature->SetHomePosition(1888.55f, 1272.19f, 41.67f, 4.7f);
                m_creature->SetWalk(true);
            }
            else
            {
                if (destroyingDoor)
                {
                    GameObject* go = m_creature->SummonGameObject(144065, 1856.314209f, 1144.990479f, 15.486275f, 5.6635f, 0, 0, 0, 0, -1, false);
                    explosiveGUID = go->GetGUID();
                    destroyingDoor = false;
                    RunAfterExplosion1();
                }
                if (runAway && id == 1)
                {
                    if (GameObject* pBoom = m_creature->GetMap()->GetGameObject(explosiveGUID))
                    {
                        pBoom->SetSpellId(13259);
                        pBoom->UseDoorOrButton(explosiveGUID);
                    }
                    uint64 EndDoorGUID = pInstance->GetData64(GO_END_DOOR);
                    pInstance->DoUseDoorOrButton(EndDoorGUID);
                    if (Creature* pChief = m_creature->GetMap()->GetCreature(pInstance->GetData64(ENTRY_UKORZ)))
                        DoScriptText(SAY_CHIEF_UKORZ_DOOR, pChief);
                    RunAfterExplosion2();
                    runAway = false;
                }
                if (disappear && id == 2)
                    m_creature->ForcedDespawn();
            }
        }
    }

    void DoAction(const uint32 param)
    {
        sLog.outString("DoAction de npc_weegli_blastfuse : Destruction porte");
        DestroyDoor();
    }

    void DestroyDoor()
    {
        if (m_creature->isAlive())
        {
            m_creature->setFaction(FACTION_FRIENDLY);
            m_creature->SetWalk(false);
            m_creature->GetMotionMaster()->MovePoint(0, 1858.57f, 1146.35f, 14.745f);
            m_creature->SetCombatStartPosition(1858.57f, 1146.35f, 14.745f); // in case he gets interrupted
            DoScriptText(SAY_WEEGLI_OK_I_GO, m_creature);
            destroyingDoor = true;
        }
    }

    void RunAfterExplosion1()
    {
        if (m_creature->isAlive())
        {
            m_creature->GetMotionMaster()->MovePoint(1, 1863.77f, 1176.99f, 9.993f);
            m_creature->SetCombatStartPosition(1863.77f, 1176.99f, 9.993f); // in case he gets interrupted

            runAway = true;
        }
    }

    void RunAfterExplosion2()
    {
        if (m_creature->isAlive())
        {
            m_creature->GetMotionMaster()->MovePoint(2, 1827.1f, 1184.0f, 8.993f);
            m_creature->SetCombatStartPosition(1827.1f, 1184.0f, 8.993f); // in case he gets interrupted
            disappear = true;
        }
    }

};


bool OnGossipSelect_npc_weegli_blastfuse(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        //here we make him run to door, set the charge and run away off to nowhere
        pCreature->AI()->DoAction();
    }
    return true;
}

bool OnGossipHello_npc_weegli_blastfuse(Player* pPlayer, Creature* pCreature)
{
    if (InstanceData* pInstance = pCreature->GetInstanceData())
    {
        switch (pInstance->GetData(EVENT_PYRAMID))
        {
            case PYRAMID_KILLED_ALL_TROLLS:
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_WEEGLI, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                pPlayer->SEND_GOSSIP_MENU(1514, pCreature->GetGUID());  //if event can proceed to end
                break;
            case PYRAMID_NOT_STARTED:
                pPlayer->SEND_GOSSIP_MENU(1511, pCreature->GetGUID());  //if event not started
                break;
            default:
                pPlayer->SEND_GOSSIP_MENU(1513, pCreature->GetGUID());  //if event are in progress
        }
        return true;
    }
    return false;
}

CreatureAI* GetAI_npc_weegli_blastfuse(Creature* pCreature)
{
    return new npc_weegli_blastfuseAI(pCreature);
}

void AddSC_npc_weegli_blastfuse()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "npc_weegli_blastfuse";
    pNewScript->GetAI = &GetAI_npc_weegli_blastfuse;
    pNewScript->pGossipHello = &OnGossipHello_npc_weegli_blastfuse;
    pNewScript->pGossipSelect = &OnGossipSelect_npc_weegli_blastfuse;
    pNewScript->RegisterSelf();
}

/*######
## go_shallow_grave
######*/

enum
{
    ZOMBIE = 7286,
    DEAD_HERO = 7276,
    ZOMBIE_CHANCE = 65,
    DEAD_HERO_CHANCE = 10
};

bool OnGossipHello_go_shallow_grave(Player* pPlayer, GameObject* pGo)
{
    // randomly summon a zombie or dead hero the first time a grave is used
    if (pGo->GetUseCount() == 0)
    {
        uint32 randomchance = urand(0, 100);
        if (randomchance < ZOMBIE_CHANCE)
            pGo->SummonCreature(ZOMBIE, pGo->GetPositionX(), pGo->GetPositionY(), pGo->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 30000);
        else if ((randomchance - ZOMBIE_CHANCE) < DEAD_HERO_CHANCE)
            pGo->SummonCreature(DEAD_HERO, pGo->GetPositionX(), pGo->GetPositionY(), pGo->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 30000);
    }
    pGo->AddUse();
    return true;
}

void AddSC_go_shallow_grave()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "go_shallow_grave";
    pNewScript->GOOpen = &OnGossipHello_go_shallow_grave;
    pNewScript->RegisterSelf();
}
/*######
## at_zumrah
######*/

enum zumrahConsts
{
    ZUMRAH_ID = 7271,
    ZUMRAH_HOSTILE_FACTION = 37
};

#define SAY_ZUMRAH_TRIGGER -1900163
#define SAY_ZUMRAH_YELL    -1900164
#define SAY_ZUMRAH_KILLED  -1900165

bool OnTrigger_at_zumrah(Player* pPlayer, const AreaTriggerEntry *at)
{
    Creature* pZumrah = pPlayer->FindNearestCreature(ZUMRAH_ID, 30.0f);

    if (!pZumrah)
        return false;

    if (pZumrah->getFaction() != ZUMRAH_HOSTILE_FACTION)
    {
        pZumrah->setFaction(ZUMRAH_HOSTILE_FACTION);
        DoScriptText(SAY_ZUMRAH_TRIGGER, pZumrah);
    }

    return true;
}

/******************/
struct ZumRahAI : public ScriptedAI
{
    ZumRahAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiGraveTimer;
    uint32 m_uiWardTimer;
    uint32 m_uiShadowBoltTimer;
    uint32 m_uiHealingTimer;
    bool zombies;
    bool isHealed;
    uint32 m_uiZombiesTimer;

    void Reset()
    {
        zombies = false;
        isHealed = false;
        m_uiShadowBoltTimer = 0;
        m_uiHealingTimer = 0;
        m_uiZombiesTimer = 3000;
        m_uiGraveTimer = 5000;
        m_uiWardTimer  = 3000;
    }

    void KilledUnit(Unit* pVictim)
    {
        DoScriptText(SAY_ZUMRAH_KILLED, m_creature);
        ScriptedAI::KilledUnit(pVictim);
    }

    void JustDied(Unit* pKiller)
    {
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
        DoScriptText(SAY_ZUMRAH_YELL, m_creature);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiZombiesTimer < uiDiff)
        {
            if (!zombies)
            {
                zombies = true;

                std::list<Creature*> m_ZombieList;
                GetCreatureListWithEntryInGrid(m_ZombieList, m_creature, 7286, 200.0f);
                for (std::list<Creature*>::iterator it = m_ZombieList.begin(); it != m_ZombieList.end(); ++it)
                    (*it)->AI()->AttackStart(m_creature->getVictim());
                m_ZombieList.clear();
            }
        }
        else
            m_uiZombiesTimer -= uiDiff;

        if (m_uiShadowBoltTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), 12739, true);
            m_uiShadowBoltTimer = 7500;
        }
        else
            m_uiShadowBoltTimer -= uiDiff;

        if (m_uiGraveTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature, 11086);
            m_uiGraveTimer = 7000;
        }
        else
            m_uiGraveTimer -= uiDiff;

        if (m_creature->GetHealthPercent() <= 33.0f || isHealed)
        {
            if (m_uiHealingTimer < uiDiff)
            {
                DoCastSpellIfCan(m_creature, 12491, true);
                isHealed = true;
                m_uiHealingTimer = urand(4800, 8900);
            }
            else
                m_uiHealingTimer -= uiDiff;
        }

        if (m_uiGraveTimer < uiDiff)
        {
            std::list<GameObject*> m_GraveList;
            uint32 zombieNumber = 0;
            GetGameObjectListWithEntryInGrid(m_GraveList, m_creature, 128403, 100.0f);
            for (std::list<GameObject*>::iterator it = m_GraveList.begin(); it != m_GraveList.end(); ++it)
            {
                GameObject *go = *it;
                if (go->GetGoState() != 1 || go->getLootState() != 1 || go->GetRespawnTime() != 0)
                    continue;

                go->UseDoorOrButton(go->GetGUID());
                if (Creature* undead = m_creature->SummonCreature(7286, go->GetPositionX(),
                    go->GetPositionY(),
                    go->GetPositionZ(), 5.93f, TEMPSUMMON_CORPSE_DESPAWN, 60000))
                {
                    if (undead->AI())
                        undead->AI()->AttackStart(m_creature->getVictim());
                }

                m_uiGraveTimer = 18000;
                zombieNumber++;
                if (zombieNumber == 2)
                    return;
            }
            m_GraveList.clear();
        }
        else
            m_uiGraveTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_ZumRah(Creature* pCreature)
{
    return new ZumRahAI(pCreature);
}

bool OnGossipHello_go_table_theka(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(2936) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(2936);

    pPlayer->SEND_GOSSIP_MENU(1653, pGo->GetGUID());

    return true;
}

struct ward_zumrahAI : public ScriptedAI
{
    ward_zumrahAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiSkeletonTimer;

    void Reset()
    {
        m_uiSkeletonTimer = 5000;
        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);

        if (m_uiSkeletonTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, 11088, true) == CAST_OK)
                m_uiSkeletonTimer = 5000;
        }
        else
            m_uiSkeletonTimer -= uiDiff;
    }
};

CreatureAI* GetAI_ward_zumrah(Creature* pCreature)
{
    return new ward_zumrahAI(pCreature);
}

/*
 *
 */

struct earthGrab_totemAI : public ScriptedAI
{
    earthGrab_totemAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiRootTimer;

    void JustDied(Unit *Killer)
    {
        m_creature->DeleteLater();
    }

    void Reset()
    {
        m_uiRootTimer = 0;

        m_creature->AddAura(23198, ADD_AURA_PERMANENT); // Avoidance : pas touch� par les AOE
        //m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED); // no attack a ajouter ?
        m_creature->addUnitState(UNIT_STAT_ROOT);
        SetCombatMovement(false);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);

        if (!m_creature->hasUnitState(UNIT_STAT_ROOT))
            m_creature->addUnitState(UNIT_STAT_ROOT);

        if (m_uiRootTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature, 8377, true);
            m_uiRootTimer = 4000;
        }
        else
            m_uiRootTimer -= uiDiff;
    }
};

CreatureAI* GetAI_earth_grab_totem(Creature* pCreature)
{
    return new earthGrab_totemAI(pCreature);
}


struct zombieAI : public ScriptedAI
{
    zombieAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiAlert_Timer;

    void Reset()
    {
        m_uiAlert_Timer = 3000;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff)
    {

        if (m_uiAlert_Timer < uiDiff)
        {
            DoCastSpellIfCan(m_creature, 8377, true);
            m_uiAlert_Timer = 7000;
        }
        else
            m_uiAlert_Timer -= uiDiff;

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_zombie(Creature* pCreature)
{
    return new zombieAI(pCreature);
}

struct alarmOMaticAI : public ScriptedAI
{
    alarmOMaticAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiAlert_Timer;

    void Reset()
    {
        m_uiAlert_Timer = 3000;
    }

    void Aggro(Unit* pWho)
    {
//        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff)
    {

        if (m_uiAlert_Timer < uiDiff)
        {
            DoCastSpellIfCan(m_creature, 23002, true);
            m_uiAlert_Timer = 7000;
        }
        else
            m_uiAlert_Timer -= uiDiff;

//        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
//            return;

//        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_alarmOMatic(Creature* pCreature)
{
    return new alarmOMaticAI(pCreature);
}


enum
{
    SPELL_SHOOT_FURY        =   15547, /* Distance spell */
    SPELL_HEX               =   11641,
    SPELL_DISMOUNT_SHOT     =   18395, /* Distance spell */
};

struct SandfuryShadowhunterAI : public ScriptedAI
{
    SandfuryShadowhunterAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool   m_bIsOutOfRange;
    uint32 m_uiShoot_Timer;
    uint32 m_uiHex_Timer;

    void Reset()
    {
        m_creature->clearUnitState(UNIT_STAT_ROOT);
        m_bIsOutOfRange           = false;
        m_uiShoot_Timer           = 3000;
        m_uiHex_Timer             = 6600;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        /** Techniques changes depending on the distance of his target */
        if (m_creature->GetDistance2d(m_creature->getVictim()) > 5.0f &&
                m_creature->GetDistance2d(m_creature->getVictim()) < 31.0f)
        {
            m_creature->addUnitState(UNIT_STAT_ROOT);
            m_bIsOutOfRange = true;
        }
        else
        {
            m_creature->clearUnitState(UNIT_STAT_ROOT);
            m_bIsOutOfRange = false;
        }

        if (m_uiHex_Timer < uiDiff)
        {
            Unit* target = NULL;
            target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);

            if (DoCastSpellIfCan(target, SPELL_HEX) == CAST_OK)
                m_uiHex_Timer = urand(6600, 6900);
        }
        else
            m_uiHex_Timer -= uiDiff;

        switch (m_bIsOutOfRange)
        {
            case 0:
                break;
            case 1:
                if (m_uiShoot_Timer < uiDiff)
                {
                    /** Classic shoot */
                    if (!m_creature->getVictim()->IsMounted())
                        DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHOOT_FURY);
                    else
                        /** Dismount shot if the player is mounted */
                        DoCastSpellIfCan(m_creature->getVictim(), SPELL_DISMOUNT_SHOT);

                    m_uiShoot_Timer = 3000;
                }
                else
                    m_uiShoot_Timer -= uiDiff;
                break;
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_SandfuryShadowhunterAI(Creature* pCreature)
{
    return new SandfuryShadowhunterAI(pCreature);
}

void AddSC_at_zumrah()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "at_zumrah";
    pNewScript->pAreaTrigger = &OnTrigger_at_zumrah;
    pNewScript->RegisterSelf();
}

void AddSC_zulfarrak()
{
    AddSC_npc_sergeant_bly();
    AddSC_npc_weegli_blastfuse();
    AddSC_go_shallow_grave();
    AddSC_at_zumrah();
    AddSC_go_troll_cage();

    Script *newscript;

    newscript = new Script;
    newscript->Name = "zf_sandfury_shadow_hunter";
    newscript->GetAI = &GetAI_SandfuryShadowhunterAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "alarm_o_matic";
    newscript->GetAI = &GetAI_alarmOMatic;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "zf_zombie";
    newscript->GetAI = &GetAI_zombie;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "earth_grab_totem";
    newscript->GetAI = &GetAI_earth_grab_totem;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_zumrah";
    newscript->GetAI = &GetAI_ZumRah;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "ward_zumrah";
    newscript->GetAI = &GetAI_ward_zumrah;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_table_theka";
    newscript->pGOHello = &OnGossipHello_go_table_theka;
    newscript->RegisterSelf();
}
