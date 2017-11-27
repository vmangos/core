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
SDName: Eastern_Plaguelands
SD%Complete: 100
SDComment: Quest support: 5211, 5742. Special vendor Augustus the Touched
SDCategory: Eastern Plaguelands
EndScriptData */

/* ContentData
mobs_ghoul_flayer
npc_augustus_the_touched
npc_darrowshire_spirit
npc_tirion_fordring
EndContentData */

#include "scriptPCH.h"

/*######
## npc_augustus_the_touched
######*/

bool GossipHello_npc_augustus_the_touched(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pCreature->isVendor() && pPlayer->GetQuestRewardStatus(6164))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_augustus_the_touched(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_TRADE)
        pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
    return true;
}

/*######
## npc_darrowshire_spirit
######*/

#define SPELL_SPIRIT_SPAWNIN    17321

struct npc_darrowshire_spiritAI : public ScriptedAI
{
    npc_darrowshire_spiritAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        DoCastSpellIfCan(m_creature, SPELL_SPIRIT_SPAWNIN);
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    }
};

CreatureAI* GetAI_npc_darrowshire_spirit(Creature* pCreature)
{
    return new npc_darrowshire_spiritAI(pCreature);
}

bool GossipHello_npc_darrowshire_spirit(Player* pPlayer, Creature* pCreature)
{
    pPlayer->SEND_GOSSIP_MENU(3873, pCreature->GetGUID());
    pPlayer->TalkedToCreature(pCreature->GetEntry(), pCreature->GetGUID());
    pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    return true;
}

/*######
## npc_tirion_fordring
######*/

bool GossipHello_npc_tirion_fordring(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(5742) == QUEST_STATUS_INCOMPLETE && pPlayer->getStandState() == UNIT_STAND_STATE_SIT)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I am ready to hear your tale, Tirion.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_tirion_fordring(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Thank you, Tirion.  What of your identity?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(4493, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "That is terrible.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->SEND_GOSSIP_MENU(4494, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I will, Tirion.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            pPlayer->SEND_GOSSIP_MENU(4495, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            pPlayer->CLOSE_GOSSIP_MENU();
            pPlayer->AreaExploredOrEventHappens(5742);
            break;
    }
    return true;
}

// Eris Havenfire event

enum
{
    NPC_PAYSANT_0           = 14484,        // BLESSE
    NPC_PAYSANT_1           = 14485,        // CONTAMINE
    NPC_GUERRIER            = 14486,
    NPC_ARCHER              = 14489,
    NPC_CLEANER             = 14503,

    GO_LIGHT                = 179693,
    GO_SLAIN_PEASANT        = 179695,

    SPELL_PESTE             = 23072,
    SPELL_TIR_FLECHE        = 22121,
    SPELL_ENTRE_LUMIERE     = 23107,
    SPELL_BUFF              = 23108,
    SPELL_INVOC_PAYSANTS    = 23119,
    SPELL_PORTE_MORT        = 23127,
    SPELL_FUFU              = 23196,
    SPELL_SEE               = 23199,        // Pas sur de son utilité

    SAY_PEASANT_RANDOM_3    = -1900118,
    SAY_PEASANT_RANDOM_2    = -1900119,
    SAY_PEASANT_RANDOM_1    = -1900120,
    SAY_PEASANT_END_4       = -1900121,
    SAY_PEASANT_END_3       = -1900122,
    SAY_PEASANT_END_2       = -1900123,
    SAY_PEASANT_END_1       = -1900124,
    SAY_ERIS_FAIL_1         = -1900125,
    SAY_ERIS_FAIL_2         = -1900126,
    SAY_PEASANT_SPAWN_1     = -1900127,
    SAY_PEASANT_SPAWN_2     = -1900128,
    SAY_PEASANT_SPAWN_3     = -1900129,
    SAY_PEASANT_SPAWN_4     = -1900130,
    SAY_ERIS_END            = -1900131,
    SAY_ERIS_HEAL           = -1900132,

    QUEST_BALANCE_OF_LIGHT  = 7622,

    POINT_DEBUT_COMBAT      = 0,
    POINT_FIN_EVENT         = 1,

    PaysantsSpawn           = 0,
    PaysantsDest            = 1,
    GuerrierPop0            = 2,
    GuerrierPop1            = 3,
    GuerrierPop2            = 4,
    ArcherPop0              = 5,
    ArcherPop1              = ArcherPop0 + 1,
    ArcherPop2              = ArcherPop1 + 1,
    ArcherPop3              = ArcherPop2 + 1,
    ArcherPop4              = ArcherPop3 + 1,
    ArcherPop5              = ArcherPop4 + 1,
    ArcherPop6              = ArcherPop5 + 1,
    ArcherPop7              = ArcherPop6 + 1,
    Fin                     = ArcherPop7 + 1
};

struct ErisHavenfireMove
{
    float X;
    float Y;
    float Z;
    float O;
};

static ErisHavenfireMove ErisHavenfireEvent[] =
{
    {3358.1096f, -3049.8063f, 166.226f, 1.87f},     // Depart
    {3327.0f, -2970.0f, 161.0f, 0.0f},          // Arrive
    {3366.0f, -3045.0f, 166.0f, 3.3f},          // Guerrier 0
    {3345.0f, -3054.0f, 167.0f, 0.4f},          // Guerrier 1
    {3364.0f, -3057.0f, 166.0f, 2.0f},          // Guerrier 2
    {3327.076f, -3017.9831f, 171.5497f, 5.777f},        // Archer 0
    {3313.686f, -3038.0459f, 168.5863f, 0.072f},        // Archer 1
    {3333.0f, -3052.0f, 175.0f, 0.61f},                 // Archer 2
    {3380.0f, -3040.0f, 174.0f, 3.3885f},               // Archer 3
    {3381.0f, -3060.0f, 184.0f, 2.5991f},               // Archer 4
    {3371.4809f, -3070.0302f, 175.166f, 1.952f},        // Archer 5
    {3347.1079f, -3071.3110f, 177.910f, 1.356f},        // Archer 6
    {3358.7299f, -3075.9846f, 174.794f, 1.575f}         // Archer 7
};

struct npc_eris_havenfireAI : public ScriptedAI
{
    explicit npc_eris_havenfireAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_creature->CastSpell(m_creature, SPELL_FUFU, true);
        m_creature->SetCreatureSummonLimit(200);
    }

    uint32 Vague;
    uint32 Timer[2];
    uint32 BuffTimer;
    uint32 TimerArcher[8];
    uint32 VillageoisMorts;
    uint32 VillageoisPasses;
    uint64 JoueurGUID;
    uint64 ArchersGUIDs[8];
    uint64 VillageoisGUIDs[50];
    bool BeginQuete;
    bool CleanerSpawn;

    Player* GetPlayer()
    {
        return me->GetMap()->GetPlayer(JoueurGUID);
    }

    void Reset()
    {
        Vague = 0;
        VillageoisMorts = 0;
        VillageoisPasses = 0;
        BeginQuete = false;
        CleanerSpawn = false;

        Timer[0] = 10000;
        Timer[1] = 110000;
        BuffTimer = 100000;
        for (int i = 0; i < 8; i++)
        {
            TimerArcher[i] = 5000;
            ArchersGUIDs[i] = 0;
        }
        for (int i = 0; i < 50; i++)
            VillageoisGUIDs[i] = 0;
    }

    void AttackedBy(Unit* Attacker)
    {
        return;
    }

    void MoveInLineOfSight(Unit* who)
    {
        if ((who->GetTypeId() == TYPEID_PLAYER || who->IsPet()) && CleanerSpawn == false && BeginQuete == true)
        {
            if (who->GetGUID() != JoueurGUID || who->IsPet())
            {   
                if (Creature* Crea = m_creature->SummonCreature(NPC_CLEANER, 3358.1096f, -3049.8063f, 166.226f, 1.87f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 1000))
                {
                    Crea->SetInCombatWith(who);
                    Crea->GetMotionMaster()->MoveChase(who);
                    BeginQuete = false;
                    CleanerSpawn = true;
                    EchecEvent(GetPlayer(), false);
                }
            }
        }
    }

    void SetAttackOnPeasantOrPlayer(Creature* summoned)
    {
        if (!summoned)
            return;

        std::vector<uint32> mobsEntries;
        std::vector<uint32>::iterator entriesIt;
        mobsEntries.push_back(NPC_PAYSANT_0);
        mobsEntries.push_back(NPC_PAYSANT_1);

        for (entriesIt = mobsEntries.begin(); entriesIt != mobsEntries.end(); ++entriesIt)
        {
            std::list<Creature*> tmpMobsList;
            GetCreatureListWithEntryInGrid(tmpMobsList, m_creature, (*entriesIt), 100.0f);
            while (!tmpMobsList.empty())
            {
                Creature* curr = tmpMobsList.front();
                tmpMobsList.pop_front();

                if (curr->isAlive())
                    summoned->AddThreat(curr, float(urand(100, 200)));
            }
        }
        if (Player* player = GetPlayer())
            if (player->isAlive())
            {
                summoned->AddThreat(player, 50.0f);
                if ((rand() % 4) > 0)
                {
                    if (Unit* victim = summoned->getVictim())
                        summoned->SendMeleeAttackStop(victim);
                    summoned->AddThreat(player, 200.0f);
                    summoned->GetMotionMaster()->Clear(false);
                    summoned->GetMotionMaster()->MoveChase(player);
                    if (Unit* victim = summoned->getVictim())
                        summoned->SendMeleeAttackStart(victim);
                }
            }

        mobsEntries.clear();
    }

    void DespawnAll()
    {
        std::vector<uint32> mobsEntries;
        std::vector<uint32>::iterator entriesIt;
        mobsEntries.push_back(NPC_PAYSANT_0);
        mobsEntries.push_back(NPC_PAYSANT_1);
        mobsEntries.push_back(NPC_GUERRIER);
        mobsEntries.push_back(NPC_ARCHER);

        for (entriesIt = mobsEntries.begin(); entriesIt != mobsEntries.end(); ++entriesIt)
        {
            std::list<Creature*> tmpMobsList;
            GetCreatureListWithEntryInGrid(tmpMobsList, m_creature, (*entriesIt), 150.0f);
            while (!tmpMobsList.empty())
            {
                Creature* curr = tmpMobsList.front();
                tmpMobsList.pop_front();

                if (curr->isAlive())
                    curr->ForcedDespawn();
            }
        }
        mobsEntries.clear();
    }

    void JustSummoned(Creature* summoned)
    {
        float X = 0.0f;
        float Y = 0.0f;
        float Z = 0.0f;
        int Var = 0;
        int var = 0;
        uint64 GUIDs[50];

        for (int i = 0; i < 50; i++)
            GUIDs[i] = 0;

        switch (summoned->GetEntry())
        {
            case NPC_ARCHER:
                summoned->SetSheath(SHEATH_STATE_RANGED);
                while (ArchersGUIDs[Var] && Var < 7)
                    ++Var;

                ArchersGUIDs[Var] = summoned->GetGUID();
                summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                summoned->addUnitState(UNIT_STAT_ROOT);
                break;
            case NPC_GUERRIER:
                SetAttackOnPeasantOrPlayer(summoned);
                break;
            case NPC_PAYSANT_1:
                summoned->CastSpell(summoned, SPELL_PESTE, true);
            // no break
            case NPC_PAYSANT_0:
                while (VillageoisGUIDs[Var] && Var < 49)
                    ++Var;

                if (Var < 50)
                    VillageoisGUIDs[Var] = summoned->GetGUID();

                if (Player* player = GetPlayer())
                    summoned->setFaction(player->getFaction());
                summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP);
                break;
        }
    }

    void SummonedMovementInform(Creature* pSummoned, uint32 uiMotionType, uint32 uiPointId)
    {
        if (uiMotionType != POINT_MOTION_TYPE || !pSummoned)
            return;

        if ((pSummoned->GetEntry() == NPC_PAYSANT_0 || pSummoned->GetEntry() == NPC_PAYSANT_1) && uiPointId == POINT_FIN_EVENT)
        {
            ++VillageoisPasses;
            switch (rand() % 15)
            {
                case 0:
                    DoScriptText(SAY_PEASANT_END_1, pSummoned);
                    break;
                case 1:
                    DoScriptText(SAY_PEASANT_END_2, pSummoned);
                    break;
                case 2:
                    DoScriptText(SAY_PEASANT_END_3, pSummoned);
                    break;
                case 3:
                    DoScriptText(SAY_PEASANT_END_4, pSummoned);
                    break;
            }

            int Var = 0;
            while (VillageoisGUIDs[Var] != pSummoned->GetGUID() && Var < 49)
                ++Var;

            if (Var < 50)
                VillageoisGUIDs[Var] = 0;

            pSummoned->ForcedDespawn();

            if (VillageoisPasses >= 50)
                if (Player* player = GetPlayer())
                    SituationFinale(player);
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned)
    {
        if (!pSummoned)
            return;

        if (pSummoned->GetEntry() == NPC_PAYSANT_0 || pSummoned->GetEntry() == NPC_PAYSANT_1)
            ++VillageoisMorts;

        if (VillageoisMorts >= 15)
            EchecEvent(GetPlayer(), true);

        int Var = 0;
        while (VillageoisGUIDs[Var] != pSummoned->GetGUID() && Var < 49)
            ++Var;

        if (Var < 50)
            VillageoisGUIDs[Var] = 0;
    }

    void EchecEvent(Player* pPlayer, bool npcDespawn)
    {
        if (pPlayer && pPlayer->GetQuestStatus(QUEST_BALANCE_OF_LIGHT) == QUEST_STATUS_INCOMPLETE)
            pPlayer->SetQuestStatus(QUEST_BALANCE_OF_LIGHT, QUEST_STATUS_FAILED);

        if (rand() % 2)
            DoScriptText(SAY_ERIS_FAIL_1, m_creature);
        else
            DoScriptText(SAY_ERIS_FAIL_2, m_creature);

        if (GameObject* pLight = m_creature->FindNearestGameObject(GO_LIGHT, 100.0f))
            pLight->AddObjectToRemoveList();

        DespawnAll();

        if (npcDespawn)
            m_creature->DisappearAndDie();
        else
            Reset();
    }

    void DebutEvent(Player* pPlayer)
    {
        if (!pPlayer)
            return;

        Vague = 0;
        VillageoisMorts = 0;
        VillageoisPasses = 0;
        CleanerSpawn = false;
        BeginQuete = true;
        JoueurGUID = pPlayer->GetGUID();

        Timer[0] = 10000;
        Timer[1] = 100000;
        BuffTimer = 95000;
        for (int i = 0; i < 8; i++)
        {
            TimerArcher[i] = 5000;
            ArchersGUIDs[i] = 0;
        }
        for (int i = 0; i < 50; i++)
            VillageoisGUIDs[i] = 0;

        for (int i = ArcherPop0; i < Fin; i++)
            m_creature->SummonCreature(NPC_ARCHER, ErisHavenfireEvent[i].X, ErisHavenfireEvent[i].Y, ErisHavenfireEvent[i].Z, ErisHavenfireEvent[i].O, TEMPSUMMON_DEAD_DESPAWN, 0);

        GameObject* pLight = m_creature->FindNearestGameObject(GO_LIGHT, 100.0f);
        if (!pLight)
            m_creature->SummonGameObject(GO_LIGHT, 3327.0f, -2970.0f, 160.034f, 5.2135f, 0, 0, 0, 0, 0);
    }

    void NewVague(bool Paysants)
    {
        int Entry = NPC_GUERRIER;
        int Nombre = GenererVagueNombre(Paysants);
        int Rand = urand(1, 4);
        bool Yell = false;

        for (int i = 0; i < Nombre; i++)
        {
            float X = 0.0f;
            float Y = 0.0f;
            float Z = 0.0f;
            if (Paysants == true)
            {
                Entry = i >= Rand ? NPC_PAYSANT_0 : NPC_PAYSANT_1;
                m_creature->GetRandomPoint(ErisHavenfireEvent[PaysantsSpawn].X, ErisHavenfireEvent[PaysantsSpawn].Y, ErisHavenfireEvent[PaysantsSpawn].Z, 6.0f, X, Y, Z);
                if (Creature* Cre = m_creature->SummonCreature(Entry, X, Y, Z, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    if (Yell == false)
                    {
                        ++Vague;
                        Yell = true;
                        switch (urand(0,3))
                        {
                            case 0:
                                DoScriptText(SAY_PEASANT_SPAWN_1, Cre);
                                break;
                            case 1:
                                DoScriptText(SAY_PEASANT_SPAWN_2, Cre);
                                break;
                            case 2:
                                DoScriptText(SAY_PEASANT_SPAWN_3, Cre);
                                break;
                            case 3:
                                DoScriptText(SAY_PEASANT_SPAWN_4, Cre);
                                break;
                        }
                    }
                }
            }
            else
            {
                int Alea = urand(2, 4);
                m_creature->GetRandomPoint(ErisHavenfireEvent[Alea].X, ErisHavenfireEvent[Alea].Y, ErisHavenfireEvent[Alea].Z, 5.0f, X, Y, Z);
                m_creature->SummonCreature(NPC_GUERRIER, X, Y, Z, 0.0f, TEMPSUMMON_DEAD_DESPAWN, 0);
            }
        }
    }

    int GenererVagueNombre(bool Paysants)
    {
        if (Vague > 4 && Paysants == true)
            return 0;

        int Nombre = 0;
        if (Paysants == true)
        {
            Nombre = 12;
            if (Vague == 3)
                Nombre = 13;
            else if (Vague == 4)
                Nombre = 16;
        }
        else
            Nombre = urand(2, 6);

        return Nombre;
    }

    void SituationFinale(Player* pPlayer)
    {
        if (!pPlayer)
            return;

        if (pPlayer->GetQuestStatus(QUEST_BALANCE_OF_LIGHT) == QUEST_STATUS_INCOMPLETE)
            pPlayer->SetQuestStatus(QUEST_BALANCE_OF_LIGHT, QUEST_STATUS_COMPLETE);

        DoScriptText(SAY_ERIS_END, m_creature);

        if (GameObject* pLight = m_creature->FindNearestGameObject(GO_LIGHT, 30.0f))
            pLight->AddObjectToRemoveList();

        DespawnAll();

        Reset();
    }

    bool IsPlayerInterfering()
    {
        Player* questPlayer = GetPlayer();
        if (!questPlayer)
            return false;

        Map::PlayerList const &pl = m_creature->GetMap()->GetPlayers();
        uint32 myArea = m_creature->GetAreaId();
        if (!pl.isEmpty() && myArea && BeginQuete == true)
        {
            for (Map::PlayerList::const_iterator it = pl.begin(); it != pl.end(); ++it)
            {
                Player* currPlayer =  it->getSource();
                if (currPlayer && m_creature->GetAreaId() == myArea && m_creature->IsWithinDist(currPlayer, 80.0f, false))
                {
                    if (currPlayer->isGameMaster())
                        continue;

                    if (currPlayer->isAlive() && questPlayer != currPlayer)
                        return true;
                }
            }
            return false;
        }
        else
            return false;
    }

    void Cleaning()
    {
        Map::PlayerList const &pl = m_creature->GetMap()->GetPlayers();
        uint32 myArea = m_creature->GetAreaId();
        if (!pl.isEmpty() && myArea && CleanerSpawn == false)
        {
            if (Creature* Crea = m_creature->SummonCreature(NPC_CLEANER, 3358.1096f, -3049.8063f, 166.226f, 1.87f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 1000))
            {
                CleanerSpawn = true;
                BeginQuete = false;
                Player* player = GetPlayer();
                EchecEvent(player, false);

                for (Map::PlayerList::const_iterator it = pl.begin(); it != pl.end(); ++it)
                {
                    Player* currPlayer =  it->getSource();
                    if (currPlayer && m_creature->GetAreaId() == myArea && m_creature->IsWithinDist(currPlayer, 80.0f, false))
                        if (player && player != currPlayer && currPlayer->isAlive() && !currPlayer->isGameMaster())
                            Crea->AddThreat(currPlayer, 1000.0f);
                }
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (BeginQuete == false || CleanerSpawn == true)
            return;

        if (IsPlayerInterfering())
        {
            Cleaning();
            return;
        }
        // Always keep player in combat
        if (Player* playerForQuest = GetPlayer())
            playerForQuest->SetCombatTimer(1500);

        for (int i = 0; i < 2; i++)
        {
            if (Timer[i] < uiDiff)
            {
                if (i == 0)
                {
                    NewVague(true);
                    Timer[i] = 80000;
                }
                else
                {
                    Timer[i] = urand(10000, 14000);
                    if ((rand() % 7) > 0) // 85% chance
                        NewVague(false);

                }
            }
            else Timer[i] -= uiDiff;
        }

        if (BuffTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BUFF) == CAST_OK)
            {
                DoScriptText(SAY_ERIS_HEAL, m_creature);
                BuffTimer = urand(75000, 90000);
            }
        }
        else
            BuffTimer -= uiDiff;

        for (int i = 0; i < 8; i++)
        {
            if (TimerArcher[i] < uiDiff)
            {
                if (ArchersGUIDs[i])
                {
                    if (Creature* Crea = m_creature->GetMap()->GetCreature(ArchersGUIDs[i]))
                    {
                        int Var = 0;
                        int var = 0;
                        int Damage = urand(50, 100);
                        uint64 GUIDs[50];

                        for (int j = 0; j < 50; j++)
                            GUIDs[j] = 0;

                        while (Var < 50)
                        {
                            if (VillageoisGUIDs[Var])
                            {
                                Unit* Villagois = m_creature->GetMap()->GetCreature(VillageoisGUIDs[Var]);
                                if (Villagois && Villagois->isAlive())
                                {
                                    GUIDs[var] = VillageoisGUIDs[Var];
                                    ++var;
                                }
                            }
                            ++Var;
                        }

                        if (var < 1)
                            continue;

                        Unit* Target = m_creature->GetMap()->GetCreature(GUIDs[urand(0, var - 1)]);
                        if (Target)
                            Crea->CastCustomSpell(Target, SPELL_TIR_FLECHE, &Damage, NULL, NULL, true);
                        TimerArcher[i] = urand(3000, 4400);
                    }
                }
            }
            else TimerArcher[i] -= uiDiff;
        }
    }
};

bool QuestAccept_npc_eris_havenfire(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (!pPlayer || !pCreature || !pQuest)
        return true;

    if (pQuest->GetQuestId() == QUEST_BALANCE_OF_LIGHT)
        if (npc_eris_havenfireAI* pErisEventAI = dynamic_cast<npc_eris_havenfireAI*>(pCreature->AI()))
            pErisEventAI->DebutEvent(pPlayer);
    return true;
}

CreatureAI* GetAI_npc_eris_havenfire(Creature* pCreature)
{
    return new npc_eris_havenfireAI(pCreature);
}

struct npc_eris_havenfire_peasantAI : public ScriptedAI
{
    explicit npc_eris_havenfire_peasantAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    float X;
    float Y;
    float Z;
    float cX;
    float cY;
    float cZ;
    bool DeplacementRequis;

    uint32 m_uiSayPeasantTimer;

    void Reset()
    {
        if (X == 0.0f && Y == 0.0f && Z == 0.0f)
            m_creature->GetRandomPoint(ErisHavenfireEvent[PaysantsDest].X, ErisHavenfireEvent[PaysantsDest].Y, ErisHavenfireEvent[PaysantsDest].Z, 5.0f, X, Y, Z);
        cX = 3347.801025f + float(urand(0, 12));
        cY = -3048.161865f + float(urand(0, 12));
        cZ = 163.679321f;
        X = 3324.0f + float(urand(0, 6));
        Y = -2973.0f + float(urand(0, 6));
        Z = 161.0f;
        DeplacementRequis = true;
        SetCombatMovement(false);

        m_uiSayPeasantTimer = urand(10000, 30000);
    }

    void KilledUnit(Unit* victim)
    {
    }


    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (done_by->GetEntry() == NPC_ARCHER)
            damage = urand(80, 105);
    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_TIR_FLECHE)
        {
            if (!urand(0, 10))
                m_creature->CastSpell(m_creature, SPELL_PORTE_MORT, true);
        }
        else if (pCaster && pCaster->GetTypeId() == TYPEID_PLAYER)
        {
            Creature* eris = m_creature->FindNearestCreature(14494, 100.0f, true);
            if (!eris)
                return;

            if (npc_eris_havenfireAI* pErisEventAI = dynamic_cast<npc_eris_havenfireAI*>(eris->AI()))
            {
                if (pCaster->GetGUID() != pErisEventAI->JoueurGUID && pErisEventAI->BeginQuete == true && pErisEventAI->CleanerSpawn == false)
                {
                    if (Creature* Crea = m_creature->SummonCreature(NPC_CLEANER, 3358.1096f, -3049.8063f, 166.226f, 1.87f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 1000))
                    {
                        Crea->AI()->AttackStart(pCaster);
                        pErisEventAI->BeginQuete = false;
                        pErisEventAI->CleanerSpawn = true;
                        pErisEventAI->EchecEvent(pErisEventAI->GetPlayer(), false);
                    }
                }
            }
        }
    }

    void MoveInLineOfSight(Unit* who)
    {
    }

    void MovementInform(uint32 uiType, uint32 uiPointId)
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        if (uiPointId == POINT_DEBUT_COMBAT)
        {
            float Vitesse = m_creature->GetEntry() == NPC_PAYSANT_0 ? 1.0f : 1.7f;
            m_creature->SetWalk(true);
            m_creature->GetMotionMaster()->MovePoint(POINT_FIN_EVENT, X, Y, Z, MOVE_PATHFINDING, Vitesse);
            cX = 0.0f;
            cY = 0.0f;
            cZ = 0.0f;
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (DeplacementRequis == true)
        {
            float Vitesse = m_creature->GetEntry() == NPC_PAYSANT_0 ? 1.0f : 1.7f;
            m_creature->SetWalk(true);
            m_creature->GetMotionMaster()->MovePoint(POINT_DEBUT_COMBAT, cX, cY, cZ, MOVE_PATHFINDING, Vitesse);
            DeplacementRequis = false;
        }

        if (!m_creature->IsWalking())
            m_creature->SetWalk(true);

        if (m_uiSayPeasantTimer < uiDiff)
        {
            switch (rand() % 30)
            {
                case 0:
                    DoScriptText(SAY_PEASANT_RANDOM_1, m_creature);
                    break;
                case 1:
                    DoScriptText(SAY_PEASANT_RANDOM_2, m_creature);
                    break;
                case 2:
                    DoScriptText(SAY_PEASANT_RANDOM_3, m_creature);
                    break;
            }
            m_uiSayPeasantTimer = urand(20000, 50000);
        }
        else
            m_uiSayPeasantTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_eris_havenfire_peasant(Creature* pCreature)
{
    return new npc_eris_havenfire_peasantAI(pCreature);
}

/*****************
*** npc_nathanos
******************/

// UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_nathanos' WHERE `entry` = 11878;

enum
{
    SPELL_BACKHAND          = 6253,
    SPELL_MULTI_SHOT        = 18651,
    SPELL_PSYCHIC_SCREAM    = 13704,
    SPELL_SHADOW_SHOOT      = 18649,
    SPELL_SHOOT             = 16100,
    SPELL_SUMMON_CONQUERED  = 19096
};

struct npc_nathanosAI : public ScriptedAI
{
    explicit npc_nathanosAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        currAddNb=0;//they don't despawn on reset.
        Reset();
    }

    uint32 Backhand_Timer;
    uint32 MultiShot_Timer;
    uint32 PsychicScream_Timer;
    uint32 ShadowShoot_Timer;
    uint32 Shoot_Timer;
    uint8 currAddNb;
    uint8 maxAdds;

    bool Checked;
    uint32 CheckHealth_Timer;
    uint64 PlayerGuids[40];
    uint32 PlayerHealth[40];

    void Reset()
    {
        Backhand_Timer = 8000;
        MultiShot_Timer = 10000;
        PsychicScream_Timer = 12000;
        ShadowShoot_Timer = 6000;
        Shoot_Timer = 4000;

        Checked = false;
        CheckHealth_Timer = 1000;

        for (int i = 0; i < 40; i++)
        {
            PlayerGuids[i] = 0;
            PlayerHealth[i] = 0;
        }
    }

    void Aggro(Unit* pWho)
    {
        Map::PlayerList const &pl = m_creature->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator it = pl.begin(); it != pl.end(); ++it)
        {
            Player* currPlayer = it->getSource();
            if (currPlayer && m_creature->IsWithinDist(currPlayer, 45.0f, false))
            {
                if (currPlayer->isGameMaster())
                    continue;

                m_creature->AddThreat(currPlayer);
                m_creature->SetInCombatWith(currPlayer);
                currPlayer->SetInCombatWith(m_creature);
            }
        }
    }

    void FillPlayerHealthList()
    {
        for (int i = 0; i < 40; i++)
        {
            PlayerGuids[i] = 0;
            PlayerHealth[i] = 0;
        }

        ThreatList const& tList = m_creature->getThreatManager().getThreatList();
        for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
        {
            if (Unit* pPlayer = m_creature->GetMap()->GetPlayer((*i)->getUnitGuid()))
            {
                for (int j = 0; j < 40; j++)
                {
                    if (PlayerGuids[j] == 0)
                    {
                        PlayerGuids[j] = (*i)->getUnitGuid();
                        PlayerHealth[j] = pPlayer->GetHealth();
                        break;
                    }
                }
            }
        }
    }

    bool IsPlayerHealed()
    {
        ThreatList const& tList = m_creature->getThreatManager().getThreatList();
        if (tList.empty())
            return false;

        for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
        {
            for (int j = 0; j < 40; j++)
            {
                if (PlayerGuids[j] == (*i)->getUnitGuid())
                {
                    Unit* pPlayer = m_creature->GetMap()->GetPlayer((*i)->getUnitGuid());

                    if (pPlayer && (pPlayer->GetHealth() > PlayerHealth[j]))
                        return true;
                }
            }
        }

        return false;
    }
    void JustSummoned(Creature*)
    {
        currAddNb++;
    }
    void SummonedCreatureJustDied(Creature* pSummoned)
    {
        currAddNb--;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!Checked)
        {
            FillPlayerHealthList();
            Checked = true;
        }
        else
        {
            if (currAddNb<50 && IsPlayerHealed())
                DoCastSpellIfCan(m_creature, SPELL_SUMMON_CONQUERED);
            Checked = false;
        }

        if (Backhand_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_BACKHAND) == CAST_OK)
                Backhand_Timer = urand(8000, 12000);
        }
        else
            Backhand_Timer -= diff;

        if (PsychicScream_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_PSYCHIC_SCREAM) == CAST_OK)
                PsychicScream_Timer = urand(10000, 20000);
        }
        else
            PsychicScream_Timer -= diff;

        if (MultiShot_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MULTI_SHOT) == CAST_OK)
            {
                MultiShot_Timer = urand(8000, 15000);
                Shoot_Timer = std::max(Shoot_Timer, 1500u);
                ShadowShoot_Timer = std::max(ShadowShoot_Timer, 1500u);
            }
        }
        else
            MultiShot_Timer -= diff;

        if (ShadowShoot_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOW_SHOOT) == CAST_OK)
            {
                ShadowShoot_Timer = urand(8000, 15000);
                Shoot_Timer = std::max(Shoot_Timer, 1500u);
                MultiShot_Timer = std::max(MultiShot_Timer, 1500u);
            }
        }
        else
            ShadowShoot_Timer -= diff;

        if (Shoot_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHOOT) == CAST_OK)
            {
                Shoot_Timer = urand(4000, 6000);
                MultiShot_Timer = std::max(MultiShot_Timer, 1500u);
                ShadowShoot_Timer = std::max(ShadowShoot_Timer, 1500u);
            }
        }
        else
            Shoot_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_npc_nathanos(Creature* pCreature)
{
    return new npc_nathanosAI(pCreature);
}
enum
{
    QUEST_THE_SCARLET_ORACLE_DEMETRIA   = 6148,
    NPC_DEMETRIA                        = 12339,
    NPC_SCARLET_TROOPER                 = 12352,
    SPELL_MIND_BLAST                    = 17194,
    SPELL_DOMINATE_MIND                 = 14515,
    SPELL_SHADOW_WORD_PAIN              = 17146,
    SPELL_MIND_FLAY                     = 17165,
    SPELL_DISPELL_MAGIC_FRIENDLY        = 17201,
    SPELL_DISPELL_MAGIC2                = 19476,
    SPELL_PSYCHIC_SCREAM2               = 13704,
    SPELL_SHADOWFORM                    = 16592
};

bool QuestAccept_npc_nathanos(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_THE_SCARLET_ORACLE_DEMETRIA)
    {
        if (Creature* demetria = pCreature->SummonCreature(NPC_DEMETRIA, 1629.34f, -5492.59f, 100.728f, 1.08793f, TEMPSUMMON_CORPSE_DESPAWN, 0, true))
            demetria->SetActiveObjectState(true);
    }
    return true;
}
struct npc_demetriaAI : public ScriptedAI
{
    npc_demetriaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }
    uint64 guidScarletTrooper[9];
    void MovementInform(uint32 movementType, uint32 moveId)
    {
        if (movementType != WAYPOINT_MOTION_TYPE)
            return;

        if (moveId == 0)
        {
            if (m_creature->FindNearestCreature(NPC_SCARLET_TROOPER, 60.0f, true)) //if another demetria is around, despawn.
                m_creature->ForcedDespawn();
            else
            {
                m_creature->JoinCreatureGroup(m_creature, 0, 0, (OPTION_FORMATION_MOVE | OPTION_AGGRO_TOGETHER | OPTION_EVADE_TOGETHER));
                for (int i = 1; i <= 9; i++)
                {
                    float angle = i * 2 * M_PI / 9;
                    float x, y, z;
                    m_creature->GetPosition(x, y, z);
                    x += 3.0f * cos(angle);
                    y += 3.0f * sin(angle);
                    if (Creature* c = m_creature->SummonCreature(NPC_SCARLET_TROOPER, x, y, z, m_creature->GetOrientation(), TEMPSUMMON_MANUAL_DESPAWN, 0))
                    {
                        c->JoinCreatureGroup(m_creature, 3.0f, angle - m_creature->GetOrientation(), (OPTION_FORMATION_MOVE | OPTION_AGGRO_TOGETHER | OPTION_EVADE_TOGETHER));
                        guidScarletTrooper[i - 1] = c->GetGUID();
                    }
                }
            }
        }
        if (moveId == 99)
        {
            DespawnTroopers();
            m_creature->ForcedDespawn();
        }
    }
    void JustDied(Unit* Killer)
    {
        DespawnTroopers();
    }
    void DespawnTroopers()
    {
        for (int i = 0; i < 9; i++)
        {
            if (Creature* pTrooper = m_creature->GetMap()->GetCreature(guidScarletTrooper[i]))
                pTrooper->AddObjectToRemoveList();
        }
    }

    uint32 MindBlast_Timer;
    uint32 DominateMind_Timer;
    uint32 ShadowWordPain_Timer;
    uint32 MindFlay_Timer;
    uint32 DispelMagic_Timer;
    uint32 Resurrect_Timer;
    uint8  PsychicScream_HealthCheck;

    void UpdateAI(const uint32 diff)
    {
        if (Resurrect_Timer < diff)
        {
            if (Creature* deadTrooper = m_creature->FindNearestCreature(NPC_SCARLET_TROOPER, 40.0f, false))
            {
                DoRessurectUnit(deadTrooper, m_creature->getVictim());
                Resurrect_Timer = 10000;
            }
        }
        else
            Resurrect_Timer -= diff;

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!(m_creature->GetSpellAuraHolder(SPELL_SHADOWFORM)))
            DoCastSpellIfCan(m_creature, SPELL_SHADOWFORM);
        if (MindBlast_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MIND_BLAST) == CAST_OK)
                MindBlast_Timer = urand(4000, 5000);
        }
        else
            MindBlast_Timer -= diff;

        if (ShadowWordPain_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0), SPELL_SHADOW_WORD_PAIN) == CAST_OK)
                ShadowWordPain_Timer = urand(18000, 24000);
        }
        else
            ShadowWordPain_Timer -= diff;

        if (MindFlay_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0), SPELL_MIND_FLAY) == CAST_OK)
                MindFlay_Timer = urand(15000, 18000);
        }
        else
            MindFlay_Timer -= diff;

        if (DominateMind_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1), SPELL_DOMINATE_MIND) == CAST_OK)
                DominateMind_Timer = urand(20000, 25000);
        }
        else
            DominateMind_Timer -= diff;

        if (DispelMagic_Timer < diff)
        {
            std::list<Creature*> pList;
            MaNGOS::FriendlyCCedInRangeCheck u_check(m_creature, 15);
            MaNGOS::CreatureListSearcher<MaNGOS::FriendlyCCedInRangeCheck> searcher(pList, u_check);
            Cell::VisitGridObjects(m_creature, searcher, 15);
            if (!pList.empty())
            {
                if (DoCastSpellIfCan(*(pList.begin()), SPELL_DISPELL_MAGIC_FRIENDLY) == CAST_OK)
                    DispelMagic_Timer = 6000;
            }
            else
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_DISPELL_MAGIC2) == CAST_OK)
                    DispelMagic_Timer = 6000;
            }
        }
        else
            DispelMagic_Timer -= diff;

        if (m_creature->GetHealthPercent() < PsychicScream_HealthCheck)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_PSYCHIC_SCREAM2) == CAST_OK)
                PsychicScream_HealthCheck = 0;
        }
        DoMeleeAttackIfReady();
    }
    void Reset()
    {
        MindBlast_Timer = 3000;
        ShadowWordPain_Timer = 9000;
        MindFlay_Timer = 15000;
        DominateMind_Timer = 6000;
        PsychicScream_HealthCheck = 30;
        DispelMagic_Timer = 0;
        Resurrect_Timer = 10000;
        m_creature->AddAura(SPELL_SHADOWFORM);
    }
    void DoRessurectUnit(Creature* creature, Unit* victim)//from Thekal's script.
    {
        float x, y, z, o;
        creature->GetPosition(x, y, z);
        o = creature->GetOrientation();

        creature->SetStandState(UNIT_STAND_STATE_STAND);
        creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        creature->SetHealth(creature->GetMaxHealth());

        creature->Respawn();
        creature->NearTeleportTo(x, y, z, o);
        creature->Update(0, 0);
        creature->SendSpellGo(creature, 20770);
        if (victim)
            creature->AI()->AttackStart(victim);
    }
};
CreatureAI* GetAI_npc_demetria(Creature* pCreature)
{
    return new npc_demetriaAI(pCreature);
}


/******************************
*** npc_darrowshire_trigger ***
*** Battle of Darrowshire   ***
*******************************/

struct DarrowshireMove
{
    float X;
    float Y;
    float Z;
    float O;
};

static DarrowshireMove DarrowshireEvent[] =
{
    {1500.04f, -3662.67f, 82.832f, 3.70805f},       // Attacker spawn 1
    {1506.17f, -3686.72f, 82.8769f, 5.75945f},      // Attacker spawn 2
    {1512.81f, -3724.64f, 87.12099f, 1.64164f},     // Attacker spawn 3
    {1537.6f, -3677.1f, 88.7f, 3.14884f},           // Attacker spawn Bloodletter

    {1484.68f, -3668.74f, 80.6953f, 0.236567f},     // Defender spawn 1
    {1493.53f, -3695.01f, 80.1347f, 0.264055f},     // Defender spawn 2
    {1505.28f, -3718.83f, 83.343f, 1.36911f},       // Defender spawn 3
    {1446.8f, -3694.27f, 76.5966f, 0.401503f}       // Defender spawn Davil Lightfire / Captain Redpath / Joseph Redpath
};

enum
{
    // Attacker
    NPC_MARAUDING_CORPSE        = 10951,
    NPC_MARAUDING_SKELETON      = 10952,
    NPC_SERVANT_OF_HORGUS       = 10953,
    NPC_BLOODLETTER             = 10954,
    NPC_HORGUS_THE_RAVAGER      = 10946,
    NPC_MARDUK_THE_BLACK        = 10939,
    NPC_REDPATH_THE_CORRUPTED   = 10938,
    NPC_DARROWSHIRE_BETRAYER    = 10947,

    // Defender
    NPC_DARROWSHIRE_DEFENDER    = 10948,
    NPC_SILVERHAND_DISCIPLE     = 10949,
    NPC_REDPATH_MILITIA         = 10950,
    NPC_DAVIL_LIGHTFIRE         = 10944,
    NPC_CAPTAIN_REDPATH         = 10937,
    NPC_JOSEPH_REDPATH          = 10936,
    NPC_DAVIL_CROKFORD          = 10945,

    NPC_DARROWSHIRE_TRIGGER     = 14495, // Spawned by spell (cf spell_scripts for spell #18987)

    SPELL_SUMMON_MARDUK_THE_BLACK = 18650,

    SAY_HORGUS_DIED             = -1900133,
    SAY_LIGHTFIRE_DIED          = -1900134,
    SAY_REDPATH_DIED            = -1900135,
    SAY_SCOURGE_DEFEATED        = -1900136,
    SAY_MILITIA_RANDOM_1        = -1900137,
    SAY_MILITIA_RANDOM_2        = -1900138,
    SAY_MILITIA_RANDOM_3        = -1900139,
    SAY_MILITIA_RANDOM_4        = -1900140,
    SAY_MILITIA_RANDOM_5        = -1900141,
    SAY_MILITIA_RANDOM_6        = -1900142,
    SAY_MILITIA_RANDOM_7        = -1900143,
    SAY_MILITIA_RANDOM_8        = -1900144,
    SAY_DEFENDER_YELL           = -1900145,
    SAY_LIGHTFIRE_YELL          = -1900146,
    SAY_DAVIL_YELL              = -1900147,
    SAY_HORGUS_YELL             = -1900148,
    SAY_DAVIL_DESPAWN           = -1900149,
    SAY_REDPATH_YELL            = -1900150,
    SAY_REDPATH_CORRUPTED       = -1900151,
    SAY_MARDUK_YELL             = -1900152,

    QUEST_BATTLE_DARROWSHIRE    = 5721,
};

struct npc_darrowshire_triggerAI : public ScriptedAI
{
    explicit npc_darrowshire_triggerAI(Creature* pCreature) : ScriptedAI(pCreature), _cleanupDone(false), _initialized(false)
    {
        DefenderFaction = 113;  // Faction Escortee : heal possible mais... n'attaque pas à vue malgré les bons flags :/
        Reset();
        m_creature->SetCreatureSummonLimit(200);
    }

    uint32 PhaseStep;
    uint32 PhaseTimer;
    uint32 MobTimer[7];
    uint32 DefenderFaction;
    std::list<ObjectGuid> summonedMobsList;

    ObjectGuid mardukGuid;
    ObjectGuid redpathGuid;
    ObjectGuid redpathCorruptedGuid;
    ObjectGuid davilGuid;
    ObjectGuid horgusGuid;

    void Reset()
    {
        // Changement de faction nécessaire pour permettre l'aggro à vue
        Map::PlayerList const &pl = m_creature->GetMap()->GetPlayers();
        uint32 myArea = m_creature->GetAreaId();
        if (!pl.isEmpty() && myArea)
        {
            for (Map::PlayerList::const_iterator it = pl.begin(); it != pl.end(); ++it)
            {
                Player* pPlayer =  it->getSource();
                if (pPlayer && pPlayer->isAlive() && !pPlayer->isGameMaster() && m_creature->IsWithinDist(pPlayer, 20.0f, false))
                {
                    if (pPlayer->GetQuestStatus(QUEST_BATTLE_DARROWSHIRE) == QUEST_STATUS_INCOMPLETE)
                    {
                        if (pPlayer->GetTeam() == HORDE)
                            DefenderFaction = 85; // Orgrimmar
                        else
                            DefenderFaction = 57; // Ironforge
                        break;
                    }
                }
            }
        }
        PhaseStep = 0;
        PhaseTimer = 6000;

        MobTimer[0] = 15000;
        MobTimer[1] = 17000;
        MobTimer[2] = MobTimer[3] = MobTimer[4] = MobTimer[5] = MobTimer[6] = 0;
        summonedMobsList.clear();
    }

    bool _cleanupDone;
    bool _initialized;
    void OnRemoveFromWorld()
    {
        if (_cleanupDone || !_initialized)
            return;
        DespawnAll();
    }
    void DespawnGuid(ObjectGuid& g)
    {
        if (Creature* c = m_creature->GetMap()->GetCreature(g))
            c->ForcedDespawn();
        g.Clear();
    }
    void DespawnAll()
    {
        _cleanupDone = true;
        for (int i = 0; i < 7; i++)
            MobTimer[i] = 0;
        PhaseTimer = 0;

        for (std::list<ObjectGuid>::const_iterator itr = summonedMobsList.begin(); itr != summonedMobsList.end(); ++itr)
            if (Creature* creature = m_creature->GetMap()->GetCreature(*itr))
                if (creature->isAlive() && creature->GetEntry() != NPC_JOSEPH_REDPATH && creature->GetEntry() != NPC_DAVIL_CROKFORD)
                    creature->ForcedDespawn(5000);

        summonedMobsList.clear();
        DespawnGuid(mardukGuid);
        DespawnGuid(redpathGuid);
        DespawnGuid(redpathCorruptedGuid);
        DespawnGuid(davilGuid);
        DespawnGuid(horgusGuid);
        m_creature->DespawnNearCreaturesByEntry(NPC_DARROWSHIRE_BETRAYER, 150.0f);
        m_creature->DeleteLater();
    }

    void JustSummoned(Creature* summoned)
    {
        if (!summoned)
            return;

        summonedMobsList.push_back(summoned->GetGUID());

        switch (summoned->GetEntry())
        {
            case NPC_DARROWSHIRE_DEFENDER:
            case NPC_SILVERHAND_DISCIPLE:
            case NPC_REDPATH_MILITIA:
                summoned->setFaction(DefenderFaction);
            // no break
            case NPC_MARAUDING_CORPSE:
            case NPC_MARAUDING_SKELETON:
            case NPC_SERVANT_OF_HORGUS:
                summoned->GetMotionMaster()->MoveRandom();
                break;
            case NPC_BLOODLETTER:
                summoned->SetWalk(true);
                summoned->SetHomePosition(DarrowshireEvent[5].X, DarrowshireEvent[5].Y, DarrowshireEvent[5].Z, DarrowshireEvent[5].O);
                summoned->GetMotionMaster()->MovePoint(0, DarrowshireEvent[5].X, DarrowshireEvent[5].Y, DarrowshireEvent[5].Z, MOVE_PATHFINDING, 5.0f);
                break;
            case NPC_DAVIL_LIGHTFIRE:
            case NPC_CAPTAIN_REDPATH:
                summoned->setFaction(DefenderFaction);
                summoned->SetWalk(false);
                summoned->SetHomePosition(DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, DarrowshireEvent[4].O);
                summoned->GetMotionMaster()->MovePoint(2, DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, MOVE_PATHFINDING, 5.0f);
                break;
            case NPC_MARDUK_THE_BLACK:
                summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_PASSIVE | UNIT_FLAG_NON_ATTACKABLE);
                summoned->ForcedDespawn(12000);
                break;
            default:
                break;
        }
    }

    void SummonedMovementInform(Creature* pSummoned, uint32 uiMotionType, uint32 uiPointId)
    {
        if (uiMotionType != POINT_MOTION_TYPE || !pSummoned)
            return;

        switch (pSummoned->GetEntry())
        {
            case NPC_DARROWSHIRE_DEFENDER:
            {
                if (uiPointId == 0)
                    pSummoned->GetMotionMaster()->MoveRandom();
                break;
            }
            case NPC_DAVIL_LIGHTFIRE:
            case NPC_CAPTAIN_REDPATH:
            case NPC_BLOODLETTER:
            {
                switch (uiPointId)
                {
                    case 0:
                        pSummoned->SetWalk(true);
                        pSummoned->GetMotionMaster()->MovePoint(1, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, MOVE_PATHFINDING, 5.0f);
                        break;
                    case 1:
                        pSummoned->SetWalk(true);
                        pSummoned->GetMotionMaster()->MovePoint(2, DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, MOVE_PATHFINDING, 5.0f);
                        break;
                    case 2:
                        pSummoned->SetWalk(true);
                        pSummoned->GetMotionMaster()->MovePoint(3, DarrowshireEvent[6].X, DarrowshireEvent[6].Y, DarrowshireEvent[6].Z, MOVE_PATHFINDING, 5.0f);
                        break;
                    case 3:
                        pSummoned->SetWalk(true);
                        pSummoned->GetMotionMaster()->MovePoint(0, DarrowshireEvent[5].X, DarrowshireEvent[5].Y, DarrowshireEvent[5].Z, MOVE_PATHFINDING, 5.0f);
                        break;
                    default:
                        break;
                }
                break;
            }
            default:
                break;
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned)
    {
        if (!pSummoned)
            return;

        switch (pSummoned->GetEntry())
        {
            case NPC_HORGUS_THE_RAVAGER:
            {
                if (Creature* Crea = m_creature->FindNearestCreature(NPC_DARROWSHIRE_DEFENDER, 100.0f, true))
                    DoScriptText(SAY_HORGUS_DIED, Crea);
                PhaseStep = 3;
                PhaseTimer = 8000;
                break;
            }
            case NPC_DAVIL_LIGHTFIRE:
            {
                if (PhaseStep < 3)
                {
                    // echec de la quete
                    if (Creature* Crea = m_creature->FindNearestCreature(NPC_DARROWSHIRE_DEFENDER, 100.0f, true))
                        DoScriptText(SAY_LIGHTFIRE_DIED, Crea);
                    DespawnAll();
                }
                break;
            }
            case NPC_CAPTAIN_REDPATH:
            {
                if (PhaseStep < 5)
                {
                    // echec de la quete
                    if (Creature* Crea = m_creature->FindNearestCreature(NPC_DARROWSHIRE_DEFENDER, 100.0f, true))
                        DoScriptText(SAY_REDPATH_DIED, Crea);
                    DespawnAll();
                }
                break;
            }
            case NPC_REDPATH_THE_CORRUPTED:
            {
                if (Creature* Crea = m_creature->FindNearestCreature(NPC_DARROWSHIRE_DEFENDER, 100.0f, true))
                    DoScriptText(SAY_SCOURGE_DEFEATED, Crea);
                m_creature->SummonCreature(NPC_JOSEPH_REDPATH, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
                m_creature->SummonCreature(NPC_DAVIL_CROKFORD, 1465.43f, -3678.48f, 78.0816f, 0.0402176f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                DespawnAll();
                break;
            }
            default:
                break;
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!_initialized)
        {
            // Already summoned ? Do not launch the event twice.
            std::list<Creature*> otherTriggers;
            m_creature->GetCreatureListWithEntryInGrid(otherTriggers, NPC_DARROWSHIRE_TRIGGER, 100.0f);
            if (otherTriggers.size() > 1)
            {
                m_creature->AddObjectToRemoveList();
                return;
            }
            _initialized = true;
        }
        for (int i = 0; i < 7; i++)
        {
            if (MobTimer[i] && MobTimer[i] <= uiDiff)
            {
                switch (i)
                {
                    case 0: // NPC_MARAUDING_CORPSE / NPC_MARAUDING_SKELETON
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            int amount = urand(1, 2);
                            for (int k = 0; k < amount; k++)
                            {
                                float X, Y, Z;
                                uint32 entry = urand(0, 1) ? NPC_MARAUDING_CORPSE : NPC_MARAUDING_SKELETON;
                                m_creature->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 5.0f, X, Y, Z);
                                m_creature->SummonCreature(entry, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                            }
                        }
                        MobTimer[i] = 25000;
                        break;
                    }
                    case 1: // NPC_DARROWSHIRE_DEFENDER
                    {
                        for (int j = 4; j < 7; j++)
                        {
                            float X, Y, Z;
                            m_creature->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 5.0f, X, Y, Z);
                            m_creature->SummonCreature(NPC_DARROWSHIRE_DEFENDER, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                        }
                        MobTimer[i] = 45000;
                        break;
                    }
                    case 2: // NPC_SERVANT_OF_HORGUS
                    {
                        if (PhaseStep != 2)
                        {
                            MobTimer[i] = 0;
                            break;
                        }

                        float X, Y, Z;
                        for (int j = 0; j < 3; j++)
                        {
                            int amount = 0;
                            amount = urand(1, 2);
                            for (int k = 0; k < amount; k++)
                            {
                                m_creature->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 5.0f, X, Y, Z);
                                m_creature->SummonCreature(NPC_SERVANT_OF_HORGUS, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                            }
                        }
                        MobTimer[i] = 35000;
                        break;
                    }
                    case 3: // NPC_SILVERHAND_DISCIPLE
                    {
                        if (PhaseStep <= 2)
                        {
                            MobTimer[i] = 0;
                            break;
                        }

                        for (int j = 4; j < 7; j++)
                        {
                            float X, Y, Z;
                            m_creature->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 5.0f, X, Y, Z);
                            m_creature->SummonCreature(NPC_SILVERHAND_DISCIPLE, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                        }
                        MobTimer[i] = 45000;
                        break;
                    }
                    case 4: // NPC_BLOODLETTER
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            float X, Y, Z;
                            m_creature->GetRandomPoint(DarrowshireEvent[3].X, DarrowshireEvent[3].Y, DarrowshireEvent[3].Z, 5.0f, X, Y, Z);
                            m_creature->SummonCreature(NPC_BLOODLETTER, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000);
                        }
                        MobTimer[i] = 35000;
                        break;
                    }
                    case 5: // NPC_REDPATH_MILITIA
                    {
                        if (PhaseStep <= 4)
                        {
                            MobTimer[i] = 0;
                            break;
                        }

                        bool yelled = false;
                        for (int j = 4; j < 7; j++)
                        {
                            float X, Y, Z;
                            m_creature->GetRandomPoint(DarrowshireEvent[j].X, DarrowshireEvent[j].Y, DarrowshireEvent[j].Z, 6.0f, X, Y, Z);
                            if (Creature* Militia = m_creature->SummonCreature(NPC_REDPATH_MILITIA, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                            {
                                if (!yelled)
                                {
                                    switch (urand(1,8))
                                    {
                                        case 1:
                                            DoScriptText(SAY_MILITIA_RANDOM_1, Militia);
                                            break;
                                        case 2:
                                            DoScriptText(SAY_MILITIA_RANDOM_2, Militia);
                                            break;
                                        case 3:
                                            DoScriptText(SAY_MILITIA_RANDOM_3, Militia);
                                            break;
                                        case 4:
                                            DoScriptText(SAY_MILITIA_RANDOM_4, Militia);
                                            break;
                                        case 5:
                                            DoScriptText(SAY_MILITIA_RANDOM_5, Militia);
                                            break;
                                        case 6:
                                            DoScriptText(SAY_MILITIA_RANDOM_6, Militia);
                                            break;
                                        case 7:
                                            DoScriptText(SAY_MILITIA_RANDOM_7, Militia);
                                            break;
                                        case 8:
                                            DoScriptText(SAY_MILITIA_RANDOM_8, Militia);
                                            break;
                                    }
                                    yelled = true;
                                }
                            }
                        }
                        MobTimer[i] = 45000;
                        break;
                    }
                    case 6: // gestion patrouille NPC_DAVIL_LIGHTFIRE NPC_BLOODLETTER NPC_CAPTAIN_REDPATH
                    {
                        for (std::list<ObjectGuid>::const_iterator itr = summonedMobsList.begin(); itr != summonedMobsList.end(); ++itr)
                        {
                            if (Creature* Crea = m_creature->GetMap()->GetCreature(*itr))
                            {
                                if (Crea->GetEntry() != NPC_BLOODLETTER && Crea->GetEntry() != NPC_DAVIL_LIGHTFIRE && Crea->GetEntry() != NPC_CAPTAIN_REDPATH)
                                    continue;

                                if (Crea->isAlive() && !Crea->isInCombat() && Crea->GetMotionMaster()->GetCurrentMovementGeneratorType() != POINT_MOTION_TYPE)
                                {
                                    int point = 0;
                                    int Rand = 0;
                                    point = urand(0, 3);
                                    switch (point)
                                    {
                                        case 0:
                                            Rand = 5;
                                            break;
                                        case 1:
                                            Rand = 7;
                                            break;
                                        case 2:
                                            Rand = 4;
                                            break;
                                        case 3:
                                            Rand = 6;
                                            break;
                                    }
                                    Crea->GetMotionMaster()->MovePoint(point, DarrowshireEvent[Rand].X, DarrowshireEvent[Rand].Y, DarrowshireEvent[Rand].Z, MOVE_PATHFINDING, 5.0f);
                                }
                            }
                        }
                        MobTimer[i] = 5000;
                        break;
                    }
                    default:
                        break;
                }
            }
            else if (MobTimer[i])
                MobTimer[i] -= uiDiff;
        }

        if (PhaseTimer && PhaseTimer <= uiDiff)
        {
            switch (PhaseStep)
            {
                case 0: // pop d'un premier defenseur
                {
                    if (Creature* Cre = m_creature->SummonCreature(NPC_DARROWSHIRE_DEFENDER, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                    {
                        DoScriptText(SAY_DEFENDER_YELL, Cre);
                        Cre->SetWalk(false);
                        Cre->SetHomePosition(DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, DarrowshireEvent[4].O);
                        Cre->GetMotionMaster()->MovePoint(0, DarrowshireEvent[4].X, DarrowshireEvent[4].Y, DarrowshireEvent[4].Z, MOVE_PATHFINDING, 3.0f);
                        PhaseTimer = urand(120000, 180000);
                        PhaseStep = 1;
                    }
                    break;
                }
                case 1: // 2:30 - 3 mn après que Joueur pose le sac
                {
                    if (Creature* davilLightfire = m_creature->SummonCreature(NPC_DAVIL_LIGHTFIRE, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                    {
                        DoScriptText(SAY_LIGHTFIRE_YELL, davilLightfire);
                        davilGuid = davilLightfire->GetObjectGuid();
                        PhaseTimer = 60000;
                        MobTimer[2] = 4000;
                        MobTimer[3] = 6000;
                        MobTimer[6] = 10000;
                        PhaseStep = 2;
                    }
                    break;
                }
                case 2: // Horgus est spawn
                {
                    Creature* davil = m_creature->GetMap()->GetCreature(davilGuid);
                    if (!davil)
                        break;
                    if (Creature* horgus = m_creature->GetMap()->GetCreature(horgusGuid))
                    {
                        DoScriptText(SAY_DAVIL_YELL, davil);
                        PhaseTimer = 0;
                        break;
                    }

                    float X, Y, Z;
                    m_creature->GetRandomPoint(davil->GetPositionX(), davil->GetPositionY(), davil->GetPositionZ(), 6.0f, X, Y, Z);
                    if (Creature* horgus = m_creature->SummonCreature(NPC_HORGUS_THE_RAVAGER, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                    {
                        horgus->AI()->AttackStart(davil);
                        horgusGuid = horgus->GetObjectGuid();
                        DoScriptText(SAY_HORGUS_YELL, horgus);
                        PhaseTimer = 3000;
                    }
                    break;
                }
                case 3: // Horgus the Ravager est tué, Davil disparait et Redpath pop
                {
                    if (Creature* davil = m_creature->GetMap()->GetCreature(davilGuid))
                    {
                        davil->ForcedDespawn(2000);
                        DoScriptText(SAY_DAVIL_DESPAWN, davil);
                        PhaseTimer = 10000;
                        break;
                    }

                    if (Creature* redpath = m_creature->SummonCreature(NPC_CAPTAIN_REDPATH, DarrowshireEvent[7].X, DarrowshireEvent[7].Y, DarrowshireEvent[7].Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                    {
                        DoScriptText(SAY_REDPATH_YELL, redpath);
                        redpathGuid = redpath->GetObjectGuid();
                        PhaseTimer = urand(300000, 350000);
                        PhaseStep = 4;
                        MobTimer[4] = 4000;
                        MobTimer[5] = 6000;
                    }
                    break;
                }
                case 4: // Marduk spawn, Redpath est tué et Redpath corrompu pop
                {
                    Creature* marduk = m_creature->GetMap()->GetCreature(mardukGuid);
                    if (marduk)
                    {
                        if (Creature* redpath = m_creature->GetMap()->GetCreature(redpathGuid))
                        {
                            PhaseStep = 5;
                            PhaseTimer = 0;
                            marduk->DealDamage(redpath, redpath->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                            if (Creature* redpathCorrupted = m_creature->SummonCreature(NPC_REDPATH_THE_CORRUPTED, redpath->GetPositionX(), redpath->GetPositionY(), redpath->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                            {
                                DoScriptText(SAY_REDPATH_CORRUPTED, redpathCorrupted);
                                redpathCorruptedGuid = redpathCorrupted->GetObjectGuid();
                            }
                        }
                        break;
                    }

                    if (Creature* redpath = m_creature->GetMap()->GetCreature(redpathGuid))
                    {
                        float X, Y, Z;
                        m_creature->GetRandomPoint(redpath->GetPositionX(), redpath->GetPositionY(), redpath->GetPositionZ(), 10.0f, X, Y, Z);
                        if (Creature* marduk = m_creature->SummonCreature(NPC_MARDUK_THE_BLACK, X, Y, Z, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                        {
                            DoScriptText(SAY_MARDUK_YELL, marduk);
                            mardukGuid = marduk->GetObjectGuid();
                            PhaseTimer = 5000;
                        }
                    }
                    break;
                }
                default:
                    break;
            }
        }
        else if (PhaseTimer)
            PhaseTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_darrowshire_trigger(Creature* pCreature)
{
    return new npc_darrowshire_triggerAI(pCreature);
}


/*************************
*** npc_joseph_redpath ***
*************************/

enum
{
    SAY_JOSEPH_1            = -1900153,
    SAY_PAMELA_1            = -1900154,
    SAY_PAMELA_2            = -1900155,
    SAY_PAMELA_3            = -1900156,
    SAY_JOSEPH_2            = -1900157,
    SAY_PAMELA_4            = -1900158,
    SAY_JOSEPH_3            = -1900159,

    NPC_PAMELA_REDPATH      = 10926
};

struct npc_joseph_redpathAI : public ScriptedAI
{
    explicit npc_joseph_redpathAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        EventStarted = false;
        EventTimer = 0;
        Reset();
    }

    bool EventStarted;
    uint32 EventStep;
    uint32 EventTimer;

    void Reset()
    {
    }

    void BeginEvent()
    {
        if (!EventStarted)
        {
            EventTimer = 30000;
            EventStep = 0;
            EventStarted = true;
        }
    }

    void MovementInform(uint32 uiType, uint32 uiPointId)
    {
        if (uiType != POINT_MOTION_TYPE)
            return;
        
        switch(uiPointId)
        {
            case 0:
            {
                m_creature->GetMotionMaster()->MovePoint(1, 1434.22f, -3668.756f, 76.671f, MOVE_PATHFINDING, 1.5f);
                break;
            }
            case 1:
            {
                m_creature->GetMotionMaster()->MovePoint(2, 1438.526f, -3632.733f, 78.268f, MOVE_PATHFINDING, 1.2f);
                DoScriptText(SAY_JOSEPH_1, m_creature);
                EventTimer = 3000;
                break;
            }
            case 2:
            {
                if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                {
                    DoScriptText(SAY_PAMELA_2, pamela);
                    m_creature->SetWalk(false);
                    float x, y, z = 0;
                    pamela->GetContactPoint(m_creature, x, y, z, 1.0f);
                    m_creature->GetMotionMaster()->MovePoint(3, x, y, z, MOVE_PATHFINDING, 4.0f);
                    EventTimer = 0;
                }
                else
                    EventTimer = 1;
                break;
            }
            case 3:
            {
                if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 20.0f, true))
                {
                    m_creature->SetFacingToObject(pamela);
                    pamela->SetFacingToObject(m_creature);
                }
                EventTimer = 2000;
                break;
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (EventTimer && EventTimer <= uiDiff)
        {
            switch (EventStep)
            {
                case 0:
                {
                    m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                    
                    m_creature->GetMotionMaster()->MovePoint(0, 1431.501f, -3684.229f, 75.726f, MOVE_PATHFINDING, 1.5f);
                    ++EventStep;
                    EventTimer = 0;
                    break;
                }
                case 1:
                {
                    if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                    { 
                        DoScriptText(SAY_PAMELA_1, pamela);
                        pamela->GetMotionMaster()->MovePoint(0, 1450.733f, -3599.974f, 85.621f, MOVE_PATHFINDING, 4.0f);
                    }
                    ++EventStep;
                    EventTimer = 0;
                    break;
                }
                case 2:
                {
                    if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                    {
                        DoScriptText(SAY_PAMELA_3, pamela);
                    }
                    ++EventStep;
                    EventTimer = 5000;
                    break;
                }
                case 3:
                {
                    DoScriptText(SAY_JOSEPH_2, m_creature);
                    ++EventStep;
                    EventTimer = 3000;
                    break;
                }
                case 4:
                {
                    if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                    {
                        DoScriptText(SAY_PAMELA_4, pamela);
                    }
                    ++EventStep;
                    EventTimer = 4000;
                    break;
                }
                case 5:
                {
                    DoScriptText(SAY_JOSEPH_3, m_creature);
                    m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                    m_creature->ForcedDespawn(6000);
                    if (Creature* pamela = m_creature->FindNearestCreature(NPC_PAMELA_REDPATH, 150.0f, true))
                        pamela->ForcedDespawn(4000);
                    EventTimer = 0;
                    break;
                }
                default:
                    break;
            }
        }
        else if (EventTimer)
            EventTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_joseph_redpath(Creature* pCreature)
{
    return new npc_joseph_redpathAI(pCreature);
}

bool GossipHello_npc_joseph_redpath(Player* pPlayer, Creature* pCreature)
{
    pPlayer->SEND_GOSSIP_MENU(10935, pCreature->GetGUID());
    if (pPlayer->GetQuestStatus(QUEST_BATTLE_DARROWSHIRE) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->AreaExploredOrEventHappens(QUEST_BATTLE_DARROWSHIRE);
        pCreature->HandleEmote(EMOTE_ONESHOT_BEG);
        if (npc_joseph_redpathAI* pJosephAI = dynamic_cast<npc_joseph_redpathAI*>(pCreature->AI()))
            pJosephAI->BeginEvent();
    }
    return true;
}
enum
{
    QUEST_WHEN_SMOKEY_SINGS__I_GET_VIOLENT  = 6041,
    SPELL_PLACING_SMOKEY_S_EXPLOSIVES       = 19250,
    TRIGGER_SCOURGE_STRUCTURE = 12247
};
bool EffectDummyGameObj_go_mark_of_detonation(Unit* pCaster, uint32 uiSpellId, SpellEffectIndex effIndex, GameObject* pGameObjectTarget)
{
    //always check spellid and effectindex
    if (uiSpellId == SPELL_PLACING_SMOKEY_S_EXPLOSIVES && effIndex == EFFECT_INDEX_0 && pCaster->GetTypeId() == TYPEID_PLAYER)
    {
        if (Creature* pCreature = pGameObjectTarget->FindNearestCreature(TRIGGER_SCOURGE_STRUCTURE, 8.000000, true))
        {
            pCaster->ToPlayer()->KilledMonsterCredit(pCreature->GetEntry(), pCreature->GetObjectGuid());
            pCreature->DealDamage(pCreature, pCreature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }
        //always return true when we are handling this spell and effect
        pGameObjectTarget->Despawn();
        return true;
    }
    return false;
}

void AddSC_eastern_plaguelands()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_augustus_the_touched";
    newscript->pGossipHello = &GossipHello_npc_augustus_the_touched;
    newscript->pGossipSelect = &GossipSelect_npc_augustus_the_touched;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_darrowshire_spirit";
    newscript->GetAI = &GetAI_npc_darrowshire_spirit;
    newscript->pGossipHello = &GossipHello_npc_darrowshire_spirit;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_tirion_fordring";
    newscript->pGossipHello =  &GossipHello_npc_tirion_fordring;
    newscript->pGossipSelect = &GossipSelect_npc_tirion_fordring;
    newscript->RegisterSelf();

    // Nostalrius -- Rockette

    newscript = new Script;
    newscript->Name = "npc_eris_havenfire";
    newscript->GetAI = &GetAI_npc_eris_havenfire;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_eris_havenfire;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_eris_havenfire_peasant";
    newscript->GetAI = &GetAI_npc_eris_havenfire_peasant;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_nathanos";
    newscript->GetAI = &GetAI_npc_nathanos;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_nathanos; //Alita
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_darrowshire_trigger";
    newscript->GetAI = &GetAI_npc_darrowshire_trigger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_joseph_redpath";
    newscript->GetAI = &GetAI_npc_joseph_redpath;
    newscript->pGossipHello = &GossipHello_npc_joseph_redpath;
    newscript->RegisterSelf();

    //Alita
    newscript = new Script;
    newscript->Name = "npc_demetria";
    newscript->GetAI = &GetAI_npc_demetria;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_mark_of_detonation";
    newscript->pEffectDummyGameObj = &EffectDummyGameObj_go_mark_of_detonation;
    newscript->RegisterSelf();
}
