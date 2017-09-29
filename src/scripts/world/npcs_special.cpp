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
SDName: Npcs_Special
SD%Complete: 100
SDComment: To be used for special NPCs that are located globally.
SDCategory: NPCs
EndScriptData
*/

#include "scriptPCH.h"
#include "../kalimdor/moonglade/boss_omen.h"

/* ContentData
npc_chicken_cluck       100%    support for quest 3861 (Cluck!)
npc_guardian            100%    guardianAI used to prevent players from accessing off-limits areas. Not in use by SD2
npc_garments_of_quests  80%     NPC's related to all Garments of-quests 5621, 5624, 5625, 5648, 5650
npc_injured_patient     100%    patients for triage-quests (6622 and 6624)
npc_doctor              100%    Gustaf Vanhowzen and Gregory Victor, quest 6622 and 6624 (Triage)
npc_lunaclaw_spirit     100%    Appears at two different locations, quest 6001/6002
npc_mount_vendor        100%    Regular mount vendors all over the world. Display gossip if player doesn't meet the requirements to buy
npc_sayge               100%    Darkmoon event fortune teller, buff player based on answers given
EndContentData */

/*########
# npc_chicken_cluck
#########*/

enum
{
    EMOTE_A_HELLO           = -1000204,
    EMOTE_H_HELLO           = -1000205,
    EMOTE_CLUCK_TEXT2       = -1000206,

    QUEST_CLUCK             = 3861,
    FACTION_FRIENDLY        = 35,
    FACTION_CHICKEN         = 31
};

struct npc_chicken_cluckAI : public ScriptedAI
{
    npc_chicken_cluckAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiResetFlagTimer;

    void Reset()
    {
        m_uiResetFlagTimer = 120000;

        m_creature->setFaction(FACTION_CHICKEN);
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
    }

    void ReceiveEmote(Player* pPlayer, uint32 uiEmote)
    {
        if (uiEmote == TEXTEMOTE_CHICKEN)
        {
            if (!urand(0, 29))
            {
                if (pPlayer->GetQuestStatus(QUEST_CLUCK) == QUEST_STATUS_NONE)
                {
                    m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                    m_creature->setFaction(FACTION_FRIENDLY);

                    DoScriptText(EMOTE_A_HELLO, m_creature);

                    /* are there any difference in texts, after 3.x ?
                    if (pPlayer->GetTeam() == HORDE)
                        DoScriptText(EMOTE_H_HELLO, m_creature);
                    else
                        DoScriptText(EMOTE_A_HELLO, m_creature);
                    */
                }
            }
        }

        if (uiEmote == TEXTEMOTE_CHEER)
        {
            if (pPlayer->GetQuestStatus(QUEST_CLUCK) == QUEST_STATUS_COMPLETE)
            {
                m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                m_creature->setFaction(FACTION_FRIENDLY);
                DoScriptText(EMOTE_CLUCK_TEXT2, m_creature);
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        // Reset flags after a certain time has passed so that the next player has to start the 'event' again
        if (m_creature->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER))
        {
            if (m_uiResetFlagTimer < uiDiff)
                EnterEvadeMode();
            else
                m_uiResetFlagTimer -= uiDiff;
        }

        if (m_creature->SelectHostileTarget() && m_creature->getVictim())
            DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_chicken_cluck(Creature* pCreature)
{
    return new npc_chicken_cluckAI(pCreature);
}

bool QuestAccept_npc_chicken_cluck(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_CLUCK)
    {
        if (npc_chicken_cluckAI* pChickenAI = dynamic_cast<npc_chicken_cluckAI*>(pCreature->AI()))
            pChickenAI->Reset();
    }

    return true;
}

bool QuestComplete_npc_chicken_cluck(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_CLUCK)
    {
        if (npc_chicken_cluckAI* pChickenAI = dynamic_cast<npc_chicken_cluckAI*>(pCreature->AI()))
            pChickenAI->Reset();
    }

    return true;
}


/*######
## Triage quest
######*/

enum
{
    SAY_DOC1                    = -1000201,
    SAY_DOC2                    = -1000202,
    SAY_DOC3                    = -1000203,

    QUEST_TRIAGE_H              = 6622,
    QUEST_TRIAGE_A              = 6624,

    DOCTOR_ALLIANCE             = 12939,
    DOCTOR_HORDE                = 12920,
    ALLIANCE_COORDS             = 7,
    HORDE_COORDS                = 6
};

struct Location
{
    float x, y, z, o;
};

static Location AllianceCoords[] =
{
    { -3757.38f, -4533.05f, 14.16f, 3.62f},                 // Top-far-right bunk as seen from entrance
    { -3754.36f, -4539.13f, 14.16f, 5.13f},                 // Top-far-left bunk
    { -3749.54f, -4540.25f, 14.28f, 3.34f},                 // Far-right bunk
    { -3742.10f, -4536.85f, 14.28f, 3.64f},                 // Right bunk near entrance
    { -3755.89f, -4529.07f, 14.05f, 0.57f},                 // Far-left bunk
    { -3749.51f, -4527.08f, 14.07f, 5.26f},                 // Mid-left bunk
    { -3746.37f, -4525.35f, 14.16f, 5.22f},                 // Left bunk near entrance
};

//alliance run to where
#define A_RUNTOX -3742.96f
#define A_RUNTOY -4531.52f
#define A_RUNTOZ 11.91f

static Location HordeCoords[] =
{
    { -1013.75f, -3492.59f, 62.62f, 4.34f},                 // Left, Behind
    { -1017.72f, -3490.92f, 62.62f, 4.34f},                 // Right, Behind
    { -1015.77f, -3497.15f, 62.82f, 4.34f},                 // Left, Mid
    { -1019.51f, -3495.49f, 62.82f, 4.34f},                 // Right, Mid
    { -1017.25f, -3500.85f, 62.98f, 4.34f},                 // Left, front
    { -1020.95f, -3499.21f, 62.98f, 4.34f}                  // Right, Front
};

//horde run to where
#define H_RUNTOX -1016.44f
#define H_RUNTOY -3508.48f
#define H_RUNTOZ 62.96f

const uint32 AllianceSoldierId[3] =
{
    12938,                                                  // 12938 Injured Alliance Soldier
    12936,                                                  // 12936 Badly injured Alliance Soldier
    12937                                                   // 12937 Critically injured Alliance Soldier
};

const uint32 HordeSoldierId[3] =
{
    12923,                                                  //12923 Injured Soldier
    12924,                                                  //12924 Badly injured Soldier
    12925                                                   //12925 Critically injured Soldier
};

/*######
## npc_doctor (handles both Gustaf Vanhowzen and Gregory Victor)
######*/

bool GossipHello_npc_doctor(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetObjectGuid());

    if ((pPlayer->GetTeam() == ALLIANCE && pPlayer->GetQuestStatus(QUEST_TRIAGE_A) == QUEST_STATUS_COMPLETE) || (pPlayer->GetTeam() == HORDE && pPlayer->GetQuestStatus(QUEST_TRIAGE_H) == QUEST_STATUS_COMPLETE))
    {
        if (pPlayer->GetSkillValue(SKILL_FIRST_AID) >= 240 && !pPlayer->HasSpell(10841))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, -3100005, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        if (pPlayer->GetSkillValue(SKILL_FIRST_AID) >= 260 && !pPlayer->HasSpell(18629))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, -3100006, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        if (pPlayer->GetSkillValue(SKILL_FIRST_AID) >= 290 && !pPlayer->HasSpell(18630))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, -3100007, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
    }

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetObjectGuid());
    return true;
}

bool GossipSelect_npc_doctor(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    pPlayer->PlayerTalkClass->ClearMenus();

    switch (uiAction)
    {
    case GOSSIP_ACTION_INFO_DEF + 1:
        pPlayer->CastSpell(pPlayer, 10843, true);
        pPlayer->CLOSE_GOSSIP_MENU();
        break;
    case GOSSIP_ACTION_INFO_DEF + 2:
        pPlayer->CastSpell(pPlayer, 18631, true);
        pPlayer->CLOSE_GOSSIP_MENU();
        break;
    case GOSSIP_ACTION_INFO_DEF + 3:
        pPlayer->CastSpell(pPlayer, 18632, true);
        pPlayer->CLOSE_GOSSIP_MENU();
        break;
    }
    return true;
}

struct npc_doctorAI : public ScriptedAI
{
    npc_doctorAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint64 Playerguid;

    uint32 SummonPatient_Timer;
    uint32 SummonPatientCount;
    uint32 PatientDiedCount;
    uint32 PatientSavedCount;

    bool Event;

    std::list<uint64> Patients;
    std::vector<Location*> Coordinates;

    void Reset()
    {
        Playerguid = 0;

        SummonPatient_Timer = 10000;
        SummonPatientCount = 0;
        PatientDiedCount = 0;
        PatientSavedCount = 0;

        Patients.clear();
        Coordinates.clear();

        Event = false;

        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    }

    void BeginEvent(Player* pPlayer);
    void PatientDied(Location* Point);
    void PatientSaved(Creature* soldier, Player* pPlayer, Location* Point);
    void UpdateAI(const uint32 diff);
};

/*#####
## npc_injured_patient (handles all the patients, no matter Horde or Alliance)
#####*/

struct npc_injured_patientAI : public ScriptedAI
{
    npc_injured_patientAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint64 Doctorguid;
    Location* Coord;
    bool Pvloss;
    uint32 _healthModTimer;

    void Reset()
    {
        Doctorguid = 0;
        Coord = nullptr;
        Pvloss = false;
        if (!m_creature->GetDBTableGUIDLow())
            Pvloss = true;

        //no select
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        //no regen health
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
        //to make them lay with face down
        m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
        _healthModTimer = 2000;

        uint32 mobId = m_creature->GetEntry();

        switch (mobId)
        {
            //lower max health
            case 12923:
            case 12938:                                     //Injured Soldier
                m_creature->SetHealth(uint32(m_creature->GetMaxHealth()*.75));
                break;
            case 12924:
            case 12936:                                     //Badly injured Soldier
                m_creature->SetHealth(uint32(m_creature->GetMaxHealth()*.50));
                break;
            case 12925:
            case 12937:                                     //Critically injured Soldier
                m_creature->SetHealth(uint32(m_creature->GetMaxHealth()*.25));
                break;
        }
    }

    void SpellHit(Unit *caster, const SpellEntry *spell)
    {
        if (caster->GetTypeId() == TYPEID_PLAYER && m_creature->isAlive() && spell->Id == 20804)
        {
            if ((((Player*)caster)->GetQuestStatus(6624) == QUEST_STATUS_INCOMPLETE) || (((Player*)caster)->GetQuestStatus(6622) == QUEST_STATUS_INCOMPLETE))
            {
                if (Doctorguid)
                {
                    if (Creature* Doctor = (m_creature->GetMap()->GetCreature(Doctorguid)))
                        ((npc_doctorAI*)Doctor->AI())->PatientSaved(m_creature, ((Player*)caster), Coord);
                }
            }
            //make not selectable
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            //regen health
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
            //Maxinus bool pour désactiver la perte de pv
            Pvloss = false;
            //stand up
            m_creature->SetStandState(UNIT_STAND_STATE_STAND);

            switch (urand(0, 2))
            {
                case 0:
                    DoScriptText(SAY_DOC1, m_creature);
                    break;
                case 1:
                    DoScriptText(SAY_DOC2, m_creature);
                    break;
                case 2:
                    DoScriptText(SAY_DOC3, m_creature);
                    break;
            }

            m_creature->SetWalk(false);

            uint32 mobId = m_creature->GetEntry();

            switch (mobId)
            {
                case 12923:
                case 12924:
                case 12925:
                    m_creature->GetMotionMaster()->MovePoint(0, H_RUNTOX, H_RUNTOY, H_RUNTOZ);
                    break;
                case 12936:
                case 12937:
                case 12938:
                    m_creature->GetMotionMaster()->MovePoint(0, A_RUNTOX, A_RUNTOY, A_RUNTOZ);
                    break;
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (_healthModTimer > diff)
        {
            _healthModTimer -= diff;
            return;
        }
        _healthModTimer = 2000; // TODO: Timer ?
        if (!m_creature->isAlive() || !Pvloss)
            return;

        if (m_creature->GetHealth() <= 100)
        {
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            m_creature->SetDeathState(JUST_DIED);
            m_creature->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);

            if (Doctorguid)
                if (Creature* Doctor = (m_creature->GetMap()->GetCreature(Doctorguid)))
                    ((npc_doctorAI*)Doctor->AI())->PatientDied(Coord);
        }
        else
            m_creature->SetHealth(uint32(m_creature->GetHealth() - 100));
    }
};

CreatureAI* GetAI_npc_injured_patient(Creature* pCreature)
{
    return new npc_injured_patientAI(pCreature);
}

/*
npc_doctor (continue)
*/

void npc_doctorAI::BeginEvent(Player* pPlayer)
{
    Playerguid = pPlayer->GetGUID();

    SummonPatient_Timer = 10000;
    SummonPatientCount = 0;
    PatientDiedCount = 0;
    PatientSavedCount = 0;

    switch (m_creature->GetEntry())
    {
        case DOCTOR_ALLIANCE:
            for (uint8 i = 0; i < ALLIANCE_COORDS; ++i)
                Coordinates.push_back(&AllianceCoords[i]);
            break;
        case DOCTOR_HORDE:
            for (uint8 i = 0; i < HORDE_COORDS; ++i)
                Coordinates.push_back(&HordeCoords[i]);
            break;
    }

    Event = true;
    m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
}

void npc_doctorAI::PatientDied(Location* Point)
{
    Player* pPlayer = (m_creature->GetMap()->GetPlayer(Playerguid));

    if (pPlayer)
    {
        if ((pPlayer->GetQuestStatus(6624) == QUEST_STATUS_INCOMPLETE) || (pPlayer->GetQuestStatus(6622) == QUEST_STATUS_INCOMPLETE))
        {
            ++PatientDiedCount;

            if (PatientDiedCount > 5 && Event)
            {
                if (pPlayer->GetQuestStatus(QUEST_TRIAGE_A) == QUEST_STATUS_INCOMPLETE)
                    pPlayer->FailQuest(QUEST_TRIAGE_A);
                else if (pPlayer->GetQuestStatus(QUEST_TRIAGE_H) == QUEST_STATUS_INCOMPLETE)
                    pPlayer->FailQuest(QUEST_TRIAGE_H);
                pPlayer->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);                
                Reset();
                return;
            }

            Coordinates.push_back(Point);
        }
        else
        {
            // If no player or player abandon quest in progress
            pPlayer->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);        
            Reset();
        }
    }
}

void npc_doctorAI::PatientSaved(Creature* soldier, Player* pPlayer, Location* Point)
{
    if (pPlayer && Playerguid == pPlayer->GetGUID())
    {
        if ((pPlayer->GetQuestStatus(QUEST_TRIAGE_A) == QUEST_STATUS_INCOMPLETE) || (pPlayer->GetQuestStatus(QUEST_TRIAGE_H) == QUEST_STATUS_INCOMPLETE))
        {
            ++PatientSavedCount;

            if (PatientSavedCount == 15)
            {
                if (!Patients.empty())
                {
                    std::list<uint64>::iterator itr;
                    for (itr = Patients.begin(); itr != Patients.end(); ++itr)
                    {
                        if (Creature* Patient = (m_creature->GetMap()->GetCreature(*itr)))
                            Patient->SetDeathState(JUST_DIED);
                    }
                }

                if (pPlayer->GetQuestStatus(QUEST_TRIAGE_A) == QUEST_STATUS_INCOMPLETE)
                    pPlayer->GroupEventHappens(QUEST_TRIAGE_A, m_creature);
                else if (pPlayer->GetQuestStatus(QUEST_TRIAGE_H) == QUEST_STATUS_INCOMPLETE)
                    pPlayer->GroupEventHappens(QUEST_TRIAGE_H, m_creature);

                Reset();
                return;
            }

            Coordinates.push_back(Point);
        }
    }
}

void npc_doctorAI::UpdateAI(const uint32 diff)
{
    if (!Event)
        return;
    if (SummonPatientCount >= 20)
    {
        Reset();
        return;
    }

    if (SummonPatient_Timer < diff)
    {
        Creature* Patient = nullptr;
        Location* Point = nullptr;

        if (Coordinates.empty())
        {
            Reset();
            return;
        }

        std::vector<Location*>::iterator itr = Coordinates.begin() + rand() % Coordinates.size();
        uint32 patientEntry = 0;

        switch (m_creature->GetEntry())
        {
            case DOCTOR_ALLIANCE:
                patientEntry = AllianceSoldierId[urand(0, 2)];
                break;
            case DOCTOR_HORDE:
                patientEntry = HordeSoldierId[urand(0, 2)];
                break;
            default:
                sLog.outError("Invalid entry for Triage doctor. Please check your database");
                return;
        }

        Point = *itr;

        Patient = m_creature->SummonCreature(patientEntry, Point->x, Point->y, Point->z, Point->o, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);

        if (Patient)
        {
            Patients.push_back(Patient->GetGUID());
            ((npc_injured_patientAI*)Patient->AI())->Doctorguid = m_creature->GetGUID();
            ((npc_injured_patientAI*)Patient->AI())->Coord = Point;
            Coordinates.erase(itr);
        }
        SummonPatient_Timer = 10000;
        ++SummonPatientCount;
    }
    else
        SummonPatient_Timer -= diff;
}

bool QuestAccept_npc_doctor(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if ((pQuest->GetQuestId() == QUEST_TRIAGE_A) || (pQuest->GetQuestId() == QUEST_TRIAGE_H))
    {
        pPlayer->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);
        if (npc_doctorAI* pDocAI = dynamic_cast<npc_doctorAI*>(pCreature->AI()))
            pDocAI->BeginEvent(pPlayer);
    }

    return true;
}

bool QuestRewarded_npc_doctor(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if ((pQuest->GetQuestId() == QUEST_TRIAGE_A) || (pQuest->GetQuestId() == QUEST_TRIAGE_H))
        pPlayer->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);

    return true;
}

CreatureAI* GetAI_npc_doctor(Creature* pCreature)
{
    return new npc_doctorAI(pCreature);
}

/*######
## npc_garments_of_quests
######*/

//TODO: get text for each NPC

enum
{
    SPELL_LESSER_HEAL_R2    = 2052,
    SPELL_FORTITUDE_R1      = 1243,

    QUEST_MOON              = 5621,
    QUEST_LIGHT_1           = 5624,
    QUEST_LIGHT_2           = 5625,
    QUEST_SPIRIT            = 5648,
    QUEST_DARKNESS          = 5650,

    ENTRY_SHAYA             = 12429,
    ENTRY_ROBERTS           = 12423,
    ENTRY_DOLF              = 12427,
    ENTRY_KORJA             = 12430,
    ENTRY_DG_KEL            = 12428,

    SAY_COMMON_HEALED       = -1000231,
    SAY_DG_KEL_THANKS       = -1000232,
    SAY_DG_KEL_GOODBYE      = -1000233,
    SAY_ROBERTS_THANKS      = -1000256,
    SAY_ROBERTS_GOODBYE     = -1000257,
    SAY_KORJA_THANKS        = -1000258,
    SAY_KORJA_GOODBYE       = -1000259,
    SAY_DOLF_THANKS         = -1000260,
    SAY_DOLF_GOODBYE        = -1000261,
    SAY_SHAYA_THANKS        = -1000262,
    SAY_SHAYA_GOODBYE       = -1000263,
};

struct npc_garments_of_questsAI : public npc_escortAI
{
    npc_garments_of_questsAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        Reset();
    }

    uint64 caster;

    bool bIsHealed;
    bool bCanRun;

    uint32 RunAwayTimer;

    void Reset()
    {
        caster = 0;

        bIsHealed = false;
        bCanRun = false;

        RunAwayTimer = 5000;

        m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
        //expect database to have RegenHealth=0
        m_creature->SetHealth(int(m_creature->GetMaxHealth() * 0.7));
    }

    void SpellHit(Unit* pCaster, const SpellEntry *Spell)
    {
        if (Spell->Id == SPELL_LESSER_HEAL_R2 || Spell->Id == SPELL_FORTITUDE_R1)
        {
            //not while in combat
            if (m_creature->isInCombat())
                return;

            //nothing to be done now
            if (bIsHealed && bCanRun)
                return;

            if (pCaster->GetTypeId() == TYPEID_PLAYER)
            {
                switch (m_creature->GetEntry())
                {
                    case ENTRY_SHAYA:
                        if (((Player*)pCaster)->GetQuestStatus(QUEST_MOON) == QUEST_STATUS_INCOMPLETE)
                        {
                            if (bIsHealed && !bCanRun && Spell->Id == SPELL_FORTITUDE_R1)
                            {
                                DoScriptText(SAY_SHAYA_THANKS, m_creature, pCaster);
                                bCanRun = true;
                            }
                            else if (!bIsHealed && Spell->Id == SPELL_LESSER_HEAL_R2)
                            {
                                caster = pCaster->GetGUID();
                                m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                                DoScriptText(SAY_COMMON_HEALED, m_creature, pCaster);
                                bIsHealed = true;
                            }
                        }
                        break;
                    case ENTRY_ROBERTS:
                        if (((Player*)pCaster)->GetQuestStatus(QUEST_LIGHT_1) == QUEST_STATUS_INCOMPLETE)
                        {
                            if (bIsHealed && !bCanRun && Spell->Id == SPELL_FORTITUDE_R1)
                            {
                                DoScriptText(SAY_ROBERTS_THANKS, m_creature, pCaster);
                                bCanRun = true;
                            }
                            else if (!bIsHealed && Spell->Id == SPELL_LESSER_HEAL_R2)
                            {
                                caster = pCaster->GetGUID();
                                m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                                DoScriptText(SAY_COMMON_HEALED, m_creature, pCaster);
                                bIsHealed = true;
                            }
                        }
                        break;
                    case ENTRY_DOLF:
                        if (((Player*)pCaster)->GetQuestStatus(QUEST_LIGHT_2) == QUEST_STATUS_INCOMPLETE)
                        {
                            if (bIsHealed && !bCanRun && Spell->Id == SPELL_FORTITUDE_R1)
                            {
                                DoScriptText(SAY_DOLF_THANKS, m_creature, pCaster);
                                bCanRun = true;
                            }
                            else if (!bIsHealed && Spell->Id == SPELL_LESSER_HEAL_R2)
                            {
                                caster = pCaster->GetGUID();
                                m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                                DoScriptText(SAY_COMMON_HEALED, m_creature, pCaster);
                                bIsHealed = true;
                            }
                        }
                        break;
                    case ENTRY_KORJA:
                        if (((Player*)pCaster)->GetQuestStatus(QUEST_SPIRIT) == QUEST_STATUS_INCOMPLETE)
                        {
                            if (bIsHealed && !bCanRun && Spell->Id == SPELL_FORTITUDE_R1)
                            {
                                DoScriptText(SAY_KORJA_THANKS, m_creature, pCaster);
                                bCanRun = true;
                            }
                            else if (!bIsHealed && Spell->Id == SPELL_LESSER_HEAL_R2)
                            {
                                caster = pCaster->GetGUID();
                                m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                                DoScriptText(SAY_COMMON_HEALED, m_creature, pCaster);
                                bIsHealed = true;
                            }
                        }
                        break;
                    case ENTRY_DG_KEL:
                        if (((Player*)pCaster)->GetQuestStatus(QUEST_DARKNESS) == QUEST_STATUS_INCOMPLETE)
                        {
                            if (bIsHealed && !bCanRun && Spell->Id == SPELL_FORTITUDE_R1)
                            {
                                DoScriptText(SAY_DG_KEL_THANKS, m_creature, pCaster);
                                bCanRun = true;
                            }
                            else if (!bIsHealed && Spell->Id == SPELL_LESSER_HEAL_R2)
                            {
                                caster = pCaster->GetGUID();
                                m_creature->SetStandState(UNIT_STAND_STATE_STAND);
                                DoScriptText(SAY_COMMON_HEALED, m_creature, pCaster);
                                bIsHealed = true;
                            }
                        }
                        break;
                }

                //give quest credit, not expect any special quest objectives
                if (bCanRun)
                    ((Player*)pCaster)->TalkedToCreature(m_creature->GetEntry(), m_creature->GetGUID());
            }
        }
    }

    void WaypointReached(uint32 uiPoint)
    {
    }

    void UpdateEscortAI(const uint32 diff)
    {
        if (bCanRun && !m_creature->isInCombat())
        {
            if (RunAwayTimer <= diff)
            {
                if (Unit *pUnit = m_creature->GetMap()->GetUnit(caster))
                {
                    switch (m_creature->GetEntry())
                    {
                        case ENTRY_SHAYA:
                            DoScriptText(SAY_SHAYA_GOODBYE, m_creature, pUnit);
                            break;
                        case ENTRY_ROBERTS:
                            DoScriptText(SAY_ROBERTS_GOODBYE, m_creature, pUnit);
                            break;
                        case ENTRY_DOLF:
                            DoScriptText(SAY_DOLF_GOODBYE, m_creature, pUnit);
                            break;
                        case ENTRY_KORJA:
                            DoScriptText(SAY_KORJA_GOODBYE, m_creature, pUnit);
                            break;
                        case ENTRY_DG_KEL:
                            DoScriptText(SAY_DG_KEL_GOODBYE, m_creature, pUnit);
                            break;
                    }

                    Start(true);
                }
                else
                    EnterEvadeMode();                       //something went wrong

                RunAwayTimer = 30000;
            }
            else RunAwayTimer -= diff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_garments_of_quests(Creature* pCreature)
{
    return new npc_garments_of_questsAI(pCreature);
}

/*######
## npc_guardian
######*/

#define SPELL_DEATHTOUCH                5

struct npc_guardianAI : public ScriptedAI
{
    npc_guardianAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_creature->isAttackReady())
        {
            m_creature->CastSpell(m_creature->getVictim(), SPELL_DEATHTOUCH, true);
            m_creature->resetAttackTimer();
        }
    }
};

CreatureAI* GetAI_npc_guardian(Creature* pCreature)
{
    return new npc_guardianAI(pCreature);
}


/*######
## npc_lunaclaw_spirit
######*/

enum
{
    QUEST_BODY_HEART_A      = 6001,
    QUEST_BODY_HEART_H      = 6002,

    TEXT_ID_DEFAULT         = 4714,
    TEXT_ID_PROGRESS        = 4715
};

#define GOSSIP_ITEM_GRANT   "You have thought well, spirit. I ask you to grant me the strength of your body and the strength of your heart."

bool GossipHello_npc_lunaclaw_spirit(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_BODY_HEART_A) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(QUEST_BODY_HEART_H) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_GRANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    pPlayer->SEND_GOSSIP_MENU(TEXT_ID_DEFAULT, pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_lunaclaw_spirit(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pPlayer->SEND_GOSSIP_MENU(TEXT_ID_PROGRESS, pCreature->GetGUID());
        pPlayer->AreaExploredOrEventHappens((pPlayer->GetTeam() == ALLIANCE) ? QUEST_BODY_HEART_A : QUEST_BODY_HEART_H);
    }
    return true;
}

/*######
## npc_mount_vendor
######*/


#define GOSSIP_ACTION_YESMOUNT (GOSSIP_ACTION_INFO_DEF + 1)

bool GossipHello_npc_mount_vendor(Player* pPlayer, Creature* pCreature)
{
    bool canBuy;
    canBuy = false;
    uint32 vendor = pCreature->GetEntry();
    uint8 race = pPlayer->getRace();

    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    switch (vendor)
    {
        case 384:                                           //Katie Hunter
        case 1460:                                          //Unger Statforth
        case 2357:                                          //Merideth Carlson
        case 4885:                                          //Gregor MacVince
            if (pPlayer->GetReputationRank(72) != REP_EXALTED && race != RACE_HUMAN)
                pPlayer->SEND_GOSSIP_MENU(5855, pCreature->GetGUID());
            else canBuy = true;
            break;
        case 1261:                                          //Veron Amberstill
            if (pPlayer->GetReputationRank(47) != REP_EXALTED && race != RACE_DWARF)
                pPlayer->SEND_GOSSIP_MENU(5856, pCreature->GetGUID());
            else canBuy = true;
            break;
        case 3362:                                          //Ogunaro Wolfrunner
            if (pPlayer->GetReputationRank(76) != REP_EXALTED && race != RACE_ORC)
                pPlayer->SEND_GOSSIP_MENU(5841, pCreature->GetGUID());
            else canBuy = true;
            break;
        case 3685:                                          //Harb Clawhoof
            if (pPlayer->GetReputationRank(81) != REP_EXALTED && race != RACE_TAUREN)
                pPlayer->SEND_GOSSIP_MENU(5843, pCreature->GetGUID());
            else canBuy = true;
            break;
        case 4730:                                          //Lelanai
            if (pPlayer->GetReputationRank(69) != REP_EXALTED && race != RACE_NIGHTELF)
                pPlayer->SEND_GOSSIP_MENU(5844, pCreature->GetGUID());
            else canBuy = true;
            break;
        case 4731:                                          //Zachariah Post
            if (pPlayer->GetReputationRank(68) != REP_EXALTED && race != RACE_UNDEAD)
                pPlayer->SEND_GOSSIP_MENU(5840, pCreature->GetGUID());
            else canBuy = true;
            break;
        case 7952:                                          //Zjolnir
            if (pPlayer->GetReputationRank(530) != REP_EXALTED && race != RACE_TROLL)
                pPlayer->SEND_GOSSIP_MENU(5842, pCreature->GetGUID());
            else canBuy = true;
            break;
        case 7955:                                          //Milli Featherwhistle
            if (pPlayer->GetReputationRank(54) != REP_EXALTED && race != RACE_GNOME)
                pPlayer->SEND_GOSSIP_MENU(5857, pCreature->GetGUID());
            else canBuy = true;
            break;
    }

    if (canBuy)
    {
        if (pCreature->isVendor())
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    }
    return true;
}

bool GossipSelect_npc_mount_vendor(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_TRADE:
            pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
            break;
    }
    return true;
}

/*######
## npc_sayge
######*/

#define SPELL_DMG       23768                               //dmg
#define SPELL_RES       23769                               //res
#define SPELL_ARM       23767                               //arm
#define SPELL_SPI       23738                               //spi
#define SPELL_INT       23766                               //int
#define SPELL_STM       23737                               //stm
#define SPELL_STR       23735                               //str
#define SPELL_AGI       23736                               //agi
#define SPELL_FORTUNE   23765                               //faire fortune

bool GossipHello_npc_sayge(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->HasSpellCooldown(SPELL_INT) ||
            pPlayer->HasSpellCooldown(SPELL_ARM) ||
            pPlayer->HasSpellCooldown(SPELL_DMG) ||
            pPlayer->HasSpellCooldown(SPELL_RES) ||
            pPlayer->HasSpellCooldown(SPELL_STR) ||
            pPlayer->HasSpellCooldown(SPELL_AGI) ||
            pPlayer->HasSpellCooldown(SPELL_STM) ||
            pPlayer->HasSpellCooldown(SPELL_SPI))
        pPlayer->SEND_GOSSIP_MENU(7393, pCreature->GetGUID());
    else
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Yes", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        pPlayer->SEND_GOSSIP_MENU(7339, pCreature->GetGUID());
    }

    return true;
}

void SendAction_npc_sayge(Player* pPlayer, Creature* pCreature, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Slay the Man",                      GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Turn him over to liege",            GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Confiscate the corn",               GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Let him go and have the corn",      GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->SEND_GOSSIP_MENU(7340, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Execute your friend painfully",     GOSSIP_SENDER_MAIN + 1, GOSSIP_ACTION_INFO_DEF);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Execute your friend painlessly",    GOSSIP_SENDER_MAIN + 2, GOSSIP_ACTION_INFO_DEF);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Let your friend go",                GOSSIP_SENDER_MAIN + 3, GOSSIP_ACTION_INFO_DEF);
            pPlayer->SEND_GOSSIP_MENU(7341, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Confront the diplomat",             GOSSIP_SENDER_MAIN + 4, GOSSIP_ACTION_INFO_DEF);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Show not so quiet defiance",        GOSSIP_SENDER_MAIN + 5, GOSSIP_ACTION_INFO_DEF);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Remain quiet",                      GOSSIP_SENDER_MAIN + 2, GOSSIP_ACTION_INFO_DEF);
            pPlayer->SEND_GOSSIP_MENU(7361, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Speak against your brother openly", GOSSIP_SENDER_MAIN + 6, GOSSIP_ACTION_INFO_DEF);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Help your brother in",              GOSSIP_SENDER_MAIN + 7, GOSSIP_ACTION_INFO_DEF);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Keep your brother out without letting him know", GOSSIP_SENDER_MAIN + 8, GOSSIP_ACTION_INFO_DEF);
            pPlayer->SEND_GOSSIP_MENU(7362, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+5:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Take credit, keep gold",            GOSSIP_SENDER_MAIN + 5, GOSSIP_ACTION_INFO_DEF);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Take credit, share the gold",       GOSSIP_SENDER_MAIN + 4, GOSSIP_ACTION_INFO_DEF);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Let the knight take credit",        GOSSIP_SENDER_MAIN + 3, GOSSIP_ACTION_INFO_DEF);
            pPlayer->SEND_GOSSIP_MENU(7363, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Thanks",                            GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
            pPlayer->SEND_GOSSIP_MENU(7364, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+6:
            pCreature->CastSpell(pPlayer, SPELL_FORTUNE, true);
            pPlayer->SEND_GOSSIP_MENU(7365, pCreature->GetGUID());
            break;
    }
}

bool GossipSelect_npc_sayge(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiSender)
    {
        case GOSSIP_SENDER_MAIN:
            SendAction_npc_sayge(pPlayer, pCreature, uiAction);
            break;
        case GOSSIP_SENDER_MAIN+1:
            pCreature->CastSpell(pPlayer, SPELL_DMG, true);
            pPlayer->AddSpellCooldown(SPELL_DMG, 0, time(nullptr) + 7200);
            SendAction_npc_sayge(pPlayer, pCreature, uiAction);
            break;
        case GOSSIP_SENDER_MAIN+2:
            pCreature->CastSpell(pPlayer, SPELL_RES, true);
            pPlayer->AddSpellCooldown(SPELL_RES, 0, time(nullptr) + 7200);
            SendAction_npc_sayge(pPlayer, pCreature, uiAction);
            break;
        case GOSSIP_SENDER_MAIN+3:
            pCreature->CastSpell(pPlayer, SPELL_ARM, true);
            pPlayer->AddSpellCooldown(SPELL_ARM, 0, time(nullptr) + 7200);
            SendAction_npc_sayge(pPlayer, pCreature, uiAction);
            break;
        case GOSSIP_SENDER_MAIN+4:
            pCreature->CastSpell(pPlayer, SPELL_SPI, true);
            pPlayer->AddSpellCooldown(SPELL_SPI, 0, time(nullptr) + 7200);
            SendAction_npc_sayge(pPlayer, pCreature, uiAction);
            break;
        case GOSSIP_SENDER_MAIN+5:
            pCreature->CastSpell(pPlayer, SPELL_INT, true);
            pPlayer->AddSpellCooldown(SPELL_INT, 0, time(nullptr) + 7200);
            SendAction_npc_sayge(pPlayer, pCreature, uiAction);
            break;
        case GOSSIP_SENDER_MAIN+6:
            pCreature->CastSpell(pPlayer, SPELL_STM, true);
            pPlayer->AddSpellCooldown(SPELL_STM, 0, time(nullptr) + 7200);
            SendAction_npc_sayge(pPlayer, pCreature, uiAction);
            break;
        case GOSSIP_SENDER_MAIN+7:
            pCreature->CastSpell(pPlayer, SPELL_STR, true);
            pPlayer->AddSpellCooldown(SPELL_STR, 0, time(nullptr) + 7200);
            SendAction_npc_sayge(pPlayer, pCreature, uiAction);
            break;
        case GOSSIP_SENDER_MAIN+8:
            pCreature->CastSpell(pPlayer, SPELL_AGI, true);
            pPlayer->AddSpellCooldown(SPELL_AGI, 0, time(nullptr) + 7200);
            SendAction_npc_sayge(pPlayer, pCreature, uiAction);
            break;
    }
    return true;
}

/*
 * Rat of the depths
 */

enum
{
    QUEST_CHASSE_AU_RAT        = 6661,
    SPELL_EXTASE_MELODIEUSE    = 21050,
    SPELL_EXTASE_MELO_VISU     = 21051,
    SPELL_MONTY_FRAPPE_RATS    = 21052,
    NPC_RAT_PROFONDEURS        = 13016,
    NPC_RAT_ENSORCELE          = 13017,
    NPC_MONTY                  = 12997,
};

struct rat_des_profondeursAI : public ScriptedAI
{
    rat_des_profondeursAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    ObjectGuid m_FollowingPlayerGuid;
    uint32 QuestFinishCheck_Timer;

    void Reset()
    {
        QuestFinishCheck_Timer = 0;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_FollowingPlayerGuid)
            return;
        Player* pPlayer = m_creature->GetMap()->GetPlayer(m_FollowingPlayerGuid);
        if (!pPlayer || !pPlayer->IsInWorld() ||
                (pPlayer->GetQuestStatus(QUEST_CHASSE_AU_RAT) != QUEST_STATUS_INCOMPLETE && pPlayer->GetQuestStatus(QUEST_CHASSE_AU_RAT) != QUEST_STATUS_COMPLETE))
        {
            m_FollowingPlayerGuid.Clear();
            m_creature->RemoveAurasDueToSpell(SPELL_EXTASE_MELO_VISU);
            m_creature->UpdateEntry(NPC_RAT_PROFONDEURS);
            m_creature->DisappearAndDie();
            return;
        }
        // La quete est-elle terminee ?
        if (QuestFinishCheck_Timer < uiDiff)
        {
            Creature* pMonty = m_creature->FindNearestCreature(NPC_MONTY, 20.0f, true);
            if (!pMonty || pPlayer->GetQuestStatus(QUEST_CHASSE_AU_RAT) != QUEST_STATUS_COMPLETE)
            {
                QuestFinishCheck_Timer = 5000;
                return;
            }
            // Quete finie.
            pPlayer->GroupEventHappens(QUEST_CHASSE_AU_RAT, m_creature);        // Complete la quete
            pMonty->CastSpell(m_creature, SPELL_MONTY_FRAPPE_RATS, true);       // Monty frappe le rat
            // Et on ".die" les autres rats.
            std::list<Creature*> pCreaList;
            m_creature->GetCreatureListWithEntryInGrid(pCreaList, NPC_RAT_ENSORCELE, 100.0f);
            for (std::list<Creature*>::iterator it = pCreaList.begin(); it != pCreaList.end(); ++it)
            {
                if ((*it)->AI()->GetData(0) == m_FollowingPlayerGuid.GetCounter())
                    (*it)->DisappearAndDie();
            }
        }
        else
            QuestFinishCheck_Timer -= uiDiff;
    }

    void SpellHit(Unit* pCaster, SpellEntry const* pSpellInfo)
    {
        // Ce rat est deja pris !
        if (!m_FollowingPlayerGuid.IsEmpty())
            return;
        if (!pSpellInfo || pSpellInfo->Id != SPELL_EXTASE_MELODIEUSE)
            return;
        if (!pCaster->IsPlayer())
            return;
        if (pCaster->ToPlayer()->GetQuestStatus(QUEST_CHASSE_AU_RAT) != QUEST_STATUS_INCOMPLETE)
            return;
        m_FollowingPlayerGuid = pCaster->GetObjectGuid();
        m_creature->UpdateEntry(NPC_RAT_ENSORCELE);
        m_creature->CastSpell(m_creature, SPELL_EXTASE_MELO_VISU, true);
        m_creature->GetMotionMaster()->Clear(false);
        m_creature->GetMotionMaster()->MoveFollow(pCaster, 1.0f, M_PI_F);
        pCaster->ToPlayer()->RewardPlayerAndGroupAtCast(m_creature, SPELL_EXTASE_MELODIEUSE);
    }

    void JustDied(Unit* pKiller)
    {
        if (!m_FollowingPlayerGuid)
            return;
        Player* pQuestPlayer = m_creature->GetMap()->GetPlayer(m_FollowingPlayerGuid);
        if (!pQuestPlayer || !pQuestPlayer->IsInWorld())
            return;
        pQuestPlayer->FailQuest(QUEST_CHASSE_AU_RAT);
        m_FollowingPlayerGuid.Clear();
    }

    uint32 GetData(uint32 dataType)
    {
        return dataType == 0 ? m_FollowingPlayerGuid.GetCounter() : 0;
    }
};

CreatureAI* GetAI_rat_des_profondeurs(Creature* pCreature)
{
    return new rat_des_profondeursAI(pCreature);
}

/*######
## npc_felhound_minion
######*/

struct npc_felhound_minionAI : public ScriptedPetAI
{
    npc_felhound_minionAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);

        if (m_creature->GetCharmInfo())
            m_creature->GetCharmInfo()->SetReactState(REACT_AGGRESSIVE);

        Reset();
    }

    uint32 m_uiManaBurnTimer;

    void Reset()
    {
        m_uiManaBurnTimer = urand(1000, 2500);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->getVictim())
            return;

        if (m_uiManaBurnTimer < uiDiff)
        {
            if (m_creature->getVictim()->getPowerType() == POWER_MANA)
                DoCastSpellIfCan(m_creature->getVictim(), 15980);
            m_uiManaBurnTimer = urand(9800, 15200);
            return;
        }
        else
            m_uiManaBurnTimer -= uiDiff;

        ScriptedPetAI::UpdatePetAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_felhound_minion(Creature* pCreature)
{
    return new npc_felhound_minionAI(pCreature);
}

/*########
# npc_gnomish_battle_chicken
#########*/

enum
{
    SPELL_BATTLE_SQUAWK = 23060,
    SPELL_CHICKEN_FURY  = 13168
};

struct npc_gnomish_battle_chickenAI : ScriptedPetAI
{
    explicit npc_gnomish_battle_chickenAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);

        if (m_creature->GetCharmInfo())
            m_creature->GetCharmInfo()->SetReactState(REACT_AGGRESSIVE);

        m_bSquawkDone = false;
        m_bFuryReady = true;

        m_uiBattleSquawkTimer = urand(30000, 80000);
        m_uiChickenFuryTimer = 0;

        npc_gnomish_battle_chickenAI::Reset();
    }

    uint32 m_uiBattleSquawkTimer;
    uint32 m_uiChickenFuryTimer;

    bool m_bSquawkDone;
    bool m_bFuryReady;

    void Reset() override
    {

    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage) override
    {
        if (pDoneBy && m_bFuryReady)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_CHICKEN_FURY, CAST_TRIGGERED) == CAST_OK)
            {
                m_uiChickenFuryTimer = 25000;
                m_bFuryReady = false;
            }
        }

        ScriptedPetAI::DamageTaken(pDoneBy, uiDamage);
    }

    void UpdatePetAI(const uint32 uiDiff) override
    {
        if (!m_bSquawkDone)
        {
            if (m_uiBattleSquawkTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_BATTLE_SQUAWK, CAST_TRIGGERED) == CAST_OK)
                    m_bSquawkDone = true;
            }
            else
                m_uiBattleSquawkTimer -= uiDiff;
        }

        if (!m_bFuryReady)
        {
            if (m_uiChickenFuryTimer < uiDiff)
            {
                m_bFuryReady = true;
            }
            else
                m_uiChickenFuryTimer -= uiDiff;
        }

        ScriptedPetAI::UpdatePetAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_gnomish_battle_chicken(Creature* pCreature)
{
    return new npc_gnomish_battle_chickenAI(pCreature);
}


/*######
## arcanite dragonling
######*/

enum
{
    SPELL_Flame_Buffet = 9574,
    SPELL_Flame_Breath = 20712
};

struct npc_arcanite_dragonlingAI : ScriptedPetAI
{
    explicit npc_arcanite_dragonlingAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);

        if (m_creature->GetCharmInfo())
        {
            if (sWorld.GetWowPatch() < WOW_PATCH_109)
                m_creature->GetCharmInfo()->SetReactState(REACT_DEFENSIVE);
            else 
                m_creature->GetCharmInfo()->SetReactState(REACT_AGGRESSIVE);
        }


        m_firebuffetTimer = urand(0, 10000);
        m_flamebreathTimer = urand(0, 20000);

        npc_arcanite_dragonlingAI::Reset();
    }

    uint32 m_firebuffetTimer;
    uint32 m_flamebreathTimer;


    void Reset() override { }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage) override
    {
        ScriptedPetAI::DamageTaken(pDoneBy, uiDamage);
    }

    void UpdatePetAI(const uint32 uiDiff) override
    {
        if (m_firebuffetTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_Flame_Buffet) == CAST_OK)
                m_firebuffetTimer = urand(5000, 10000);
        }
        else
            m_firebuffetTimer -= uiDiff;

        if (m_flamebreathTimer < uiDiff)
        {
            int32 damage = 300;
            m_creature->CastCustomSpell(m_creature->getVictim(), SPELL_Flame_Breath, &damage, nullptr, nullptr, true);
            m_flamebreathTimer = urand(5000, 20000);
        }
        else
            m_flamebreathTimer -= uiDiff;



        ScriptedPetAI::UpdatePetAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_arcanite_dragonling(Creature* pCreature)
{
    return new npc_arcanite_dragonlingAI(pCreature);
}

/*######
## Timbermaw Ancestor
######*/
enum
{
    SPELL_HEALING_TOUCH = 26097,
    SPELL_LIGHTNING_BOLT = 9532
};

struct npc_timbermaw_ancestorAI : ScriptedPetAI
{
    explicit npc_timbermaw_ancestorAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);

        if (m_creature->GetCharmInfo())
            m_creature->GetCharmInfo()->SetReactState(REACT_DEFENSIVE);

        m_healingTouchTimer = 0;

        npc_timbermaw_ancestorAI::Reset();
    }

    uint32 m_healingTouchTimer;

    void Reset() override {}

    void UpdatePetAI(const uint32 uiDiff) override
    {
        if (m_healingTouchTimer < uiDiff)
        {
            if (m_creature->GetOwner()->HealthBelowPct(50))
            {
                if (DoCastSpellIfCan(m_creature->GetOwner(), SPELL_HEALING_TOUCH, false) == CAST_OK)
                    m_healingTouchTimer = 7000;
            }
            else if (Unit* pTarget = m_creature->SelectRandomFriendlyTarget(m_creature->GetOwner(), 30.0f))
            {
                if (pTarget->HealthBelowPct(50))
                {
                    if (DoCastSpellIfCan(pTarget, SPELL_HEALING_TOUCH, false) == CAST_OK)
                        m_healingTouchTimer = 7000;
                }
            }
        }
        else
            m_healingTouchTimer -= uiDiff;

        if (!m_creature->IsNonMeleeSpellCasted(false))
        {
            if (Unit * pTarget = m_creature->getVictim())
            {
                if (!pTarget->HasBreakableByDamageCrowdControlAura() && !pTarget->IsImmuneToSchoolMask(SPELL_SCHOOL_MASK_NATURE))
                    DoCastSpellIfCan(pTarget, SPELL_LIGHTNING_BOLT, false);
            }
        }

        ScriptedPetAI::UpdatePetAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_timbermaw_ancestor(Creature* pCreature)
{
    return new npc_timbermaw_ancestorAI(pCreature);
}

/*######
## Cannonball Runner
######*/
enum
{
    SPELL_CANNON_FIRE = 17501
};

struct npc_cannonball_runnerAI : ScriptedPetAI
{
    explicit npc_cannonball_runnerAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);

        if (m_creature->GetCharmInfo())
            m_creature->GetCharmInfo()->SetReactState(REACT_AGGRESSIVE);

        if (m_creature->GetOwner())
            m_creature->SetOrientation(m_creature->GetOwner()->GetOrientation());

        m_creature->addUnitState(UNIT_STAT_NO_COMBAT_MOVEMENT);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_ROTATE);

        npc_cannonball_runnerAI::Reset();
    }

    void AttackStart(Unit* /*pWho*/) override {}

    void Reset() override
    {
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->IsNonMeleeSpellCasted())
            if (Unit * pTarget = m_creature->SelectRandomUnfriendlyTarget((Unit *) nullptr, 40.0f, true))
                DoCastSpellIfCan(pTarget, SPELL_CANNON_FIRE, false);
    }
};

CreatureAI* GetAI_npc_cannonball_runner(Creature* pCreature)
{
    return new npc_cannonball_runnerAI(pCreature);
}

/*######
## npc_the_cleaner
######*/
enum
{
    SPELL_IMMUNITY      = 29230,
    SAY_CLEANER_AGGRO   = -1289010
};

struct npc_the_cleanerAI : public ScriptedAI
{
    npc_the_cleanerAI(Creature* pCreature) : ScriptedAI(pCreature) { Reset(); }

    uint32 m_uiDespawnTimer;

    void Reset()
    {
        DoCastSpellIfCan(m_creature, SPELL_IMMUNITY, CAST_TRIGGERED);
        m_uiDespawnTimer = 3000;
    }

    void Aggro(Unit* pWho) override
    {
        DoScriptText(SAY_CLEANER_AGGRO, m_creature);
    }

    void EnterEvadeMode() override
    {
        ScriptedAI::EnterEvadeMode();

        m_creature->ForcedDespawn();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiDespawnTimer < uiDiff)
        {
            if (m_creature->getThreatManager().getThreatList().empty())
                m_creature->ForcedDespawn();
        }
        else
            m_uiDespawnTimer -= uiDiff;

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_the_cleaner(Creature* pCreature)
{
    return new npc_the_cleanerAI(pCreature);
}

/*
 * Fireworks
 */

enum
{
    NPC_FIREWORK_GUY_ELUNE          = 15918,

    GO_FIREWORK_LAUNCHER            = 180771,
    GO_CLUSTER_LAUNCHER             = 180772,
    GO_OMEN_CLUSTER_LAUNCHER        = 180874,
    GO_FIREWORK_ROCKET_WHITE_BIG    = 180864,

    SPELL_LUNAR_FORTUNE             = 26522
};

struct FireworkStruct
{
    uint32 m_uiNpcEntry;
    uint32 m_uiGoEntry;
    bool m_bIsCluster;
};

const FireworkStruct Fireworks[] =
{
    { 15872, 180854,  true }, // Blue Firework Cluster
    { 15873, 180851,  true }, // Red Firework Cluster
    { 15874, 180855,  true }, // Green Firework Cluster
    { 15875, 180856,  true }, // Purple Firework Cluster
    { 15876, 180857,  true }, // White Firework Cluster
    { 15877, 180858,  true }, // Yellow Firework Cluster
    { 15879, 180854, false }, // Small Blue Rocket
    { 15880, 180855, false }, // Small Green Rocket
    { 15881, 180856, false }, // Small Purple Rocket
    { 15882, 180851, false }, // Small Red Rocket
    { 15883, 180858, false }, // Small Yellow Rocket
    { 15884, 180857, false }, // Small White Rocket
    { 15885, 180861, false }, // Large Blue Rocket
    { 15886, 180862, false }, // Large Green Rocket
    { 15887, 180863, false }, // Large Purple Rocket
    { 15888, 180860, false }, // Large Red Rocket
    { 15889, 180864, false }, // Large White Rocket
    { 15890, 180865, false }, // Large Yellow Rocket
    { 15911, 180861,  true }, // Large Blue Firework Cluster
    { 15912, 180862,  true }, // Large Green Firework Cluster
    { 15913, 180863,  true }, // Large Purple Firework Cluster
    { 15914, 180860,  true }, // Large Red Firework Cluster
    { 15915, 180864,  true }, // Large White Firework Cluster
    { 15916, 180865,  true }, // Large Yellow Firework Cluster
    { 15918, 180861,  true }, // Large Yellow Firework Cluster
};

const uint32 Launcher[] = { 180772, 180859, 180869, 180874, 180771, 180850, 180868 };

struct npc_pats_firework_guyAI : ScriptedAI
{
    explicit npc_pats_firework_guyAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_pats_firework_guyAI::Reset();
        npc_pats_firework_guyAI::ResetCreature();

        IsUsable();
    }

    bool m_bExist;
    bool m_bisLucky;
    bool m_bDone;
    uint8 m_uiIndex;

    void Reset() override
    {

    }

    void ResetCreature() override
    {
        m_bExist = false;
        m_bisLucky = false;
        m_bDone = false;
        m_uiIndex = 0;
    }

    void IsUsable()
    {
        for (uint8 i = 0; i < 25; ++i)
        {
            if (Fireworks[i].m_uiNpcEntry == m_creature->GetEntry())
            {
                m_bExist = true;
                m_bisLucky = m_creature->GetEntry() == NPC_FIREWORK_GUY_ELUNE;
                m_uiIndex = i;
                break;
            }
        }
    }

    void UpdateAI(const uint32 /*diff*/) override
    {
        if (!m_bExist || m_bDone)
            return;

        for (uint8 l = 0; l < 7; ++l)
        {
            if (auto pGo = GetClosestGameObjectWithEntry(m_creature, Launcher[l], CONTACT_DISTANCE))
            {
                pGo->SendGameObjectCustomAnim(pGo->GetObjectGuid());
                break;
            }
        }

        float x, y, z;
        m_creature->GetPosition(x, y, z);
        m_creature->SummonGameObject(Fireworks[m_uiIndex].m_uiGoEntry, x, y, z, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1);

        if (Fireworks[m_uiIndex].m_bIsCluster)
        {
            m_creature->SummonGameObject(Fireworks[m_uiIndex].m_uiGoEntry, x, y, z + 10.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1);

            for (int i = 0; i < 3; ++i)
            {
                uint32 entry = i && m_bisLucky ? uint32(GO_FIREWORK_ROCKET_WHITE_BIG) : Fireworks[m_uiIndex].m_uiGoEntry;

                m_creature->GetNearPoint2D(x, y, i ? 2.0f : 1.0f, i * 2.0f * M_PI_F / 3.0f + M_PI_F / 2.0f);
                m_creature->SummonGameObject(entry, x, y, z + 5.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1);
            }
        }

        if (m_bisLucky)
            m_creature->CastSpell(m_creature, SPELL_LUNAR_FORTUNE, true);

        if (m_creature->IsTemporarySummon())
        {
            Player* pSummoner = m_creature->GetMap()->GetPlayer(static_cast<TemporarySummon*>(m_creature)->GetSummonerGuid());

            if (pSummoner)
                pSummoner->CastedCreatureOrGO(Fireworks[m_uiIndex].m_bIsCluster ? GO_CLUSTER_LAUNCHER : GO_FIREWORK_LAUNCHER, ObjectGuid(), 0);
        }

        if (GetClosestGameObjectWithEntry(m_creature, GO_OMEN_CLUSTER_LAUNCHER, CONTACT_DISTANCE))
            boss_omenAI::OnFireworkLaunch(m_creature);

        m_bDone = true;
    }
};

CreatureAI* GetAI_npc_pats_firework_guy(Creature* creature)
{
    return new npc_pats_firework_guyAI(creature);
}

/*
 * Huge Firework Show support
 */

const uint32 FireBoxPlayer[] =
{
    180854,180851,180855,180858,180857,
    180861,180862,180863,180860,180864,
    180865
};

enum FireworkColor
{
    COLOR_WHITE = 0,
    COLOR_RED = 1,
    COLOR_BLUE = 2,
    COLOR_GREEN = 3,
    COLOR_PURPLE = 4,
    COLOR_YELLOW = 5
};

struct FireworkShowStruct
{
    uint32 entry;
    uint8 type;
    FireworkColor color;
    bool big;
};

const FireworkShowStruct FireboxShow[] =
{
    { 180728, 1, COLOR_WHITE,   false },
    { 180729, 1, COLOR_WHITE,   true  },
    { 180730, 2, COLOR_WHITE,   false },
    { 180731, 2, COLOR_WHITE,   true  },
    { 180703, 1, COLOR_RED,     false },
    { 180704, 2, COLOR_RED,     false },
    { 180707, 1, COLOR_RED,     true  },
    { 180708, 2, COLOR_RED,     true  },
    { 180720, 1, COLOR_BLUE,    false },
    { 180721, 2, COLOR_BLUE,    false },
    { 180722, 1, COLOR_BLUE,    true  },
    { 180723, 2, COLOR_BLUE,    true  },
    { 180724, 1, COLOR_GREEN,   false },
    { 180725, 2, COLOR_GREEN,   true  },
    { 180726, 1, COLOR_GREEN,   true  },
    { 180727, 2, COLOR_GREEN,   false },
    { 180733, 2, COLOR_PURPLE,  true  }, // missing one purple?
    { 180740, 2, COLOR_PURPLE,  false },
    { 180741, 1, COLOR_PURPLE,  true  },
    { 180736, 1, COLOR_YELLOW,  false },
    { 180737, 1, COLOR_YELLOW,  true  },
    { 180738, 2, COLOR_YELLOW,  false },
    { 180739, 2, COLOR_YELLOW,  true  },
};

#define INTENSITY 7

struct npc_holiday_firestarterAI : ScriptedAI
{
    explicit npc_holiday_firestarterAI(Creature* pCreature, bool regular) : ScriptedAI(pCreature)
    {
        npc_holiday_firestarterAI::Reset();
        npc_holiday_firestarterAI::ResetCreature();

        m_bRegular = regular;
    }

    bool m_bRegular;

    void Reset() override
    {

    }

    void DoRegularFirework(uint8 amount = 1) const
    {
        float x, y, z;
        m_creature->GetPosition(x, y, z);

        for (uint8 i = 0; i < amount; ++i)
        {
            m_creature->SummonGameObject(
                FireBoxPlayer[urand(0, 10)],
                x + frand(-150, 150),
                y + frand(-150, 150),
                z + frand(30, 90),
                0, 0, 0, 0, 0,
                1);
        }
    }

    void DoShowFirework(uint8 amount = 1) const
    {
        float x, y, z;
        m_creature->GetPosition(x, y, z);

        for (uint8 i = 0; i < amount; ++i)
        {
            if (auto pGo = m_creature->SummonGameObject(
                FireboxShow[urand(0, 22)].entry,
                x + frand(-150, 150),
                y + frand(-150, 150),
                z + frand(30, 90),
                frand(0, M_PI_F),
                0, 0, 0, 0,
                1))
            {
                pGo->UseDoorOrButton();
            }
        }
    }

    void UpdateAI(const uint32 /*uiDiff*/) override
    {
        if (m_bRegular)
            DoRegularFirework(INTENSITY);
        else
            DoShowFirework(INTENSITY);
    }
};

CreatureAI* GetAI_npc_firestarter_show(Creature* pCreature)
{
    return new npc_holiday_firestarterAI(pCreature, false);
}

CreatureAI* GetAI_npc_firestarter_regular(Creature* pCreature)
{
    return new npc_holiday_firestarterAI(pCreature, true);
}

/*
 * Summon possessed mobs
 */

enum
{
    SPELL_SUMMON_EYE_OF_KILROGG     = 126,
    SPELL_SUMMON_DREAM_VISION       = 11403
};

struct npc_summon_possessedAI : ScriptedAI
{
    explicit npc_summon_possessedAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_summon_possessedAI::Reset();
    }

    void Reset() override
    {

    }

    void JustDied(Unit* pKiller) override
    {
        if (auto pOwner = m_creature->GetOwner())
        {
            if (auto pPlayer = pOwner->ToPlayer())
            {
                pPlayer->RemoveAurasDueToSpell(SPELL_SUMMON_EYE_OF_KILROGG);
                pPlayer->RemoveAurasDueToSpell(SPELL_SUMMON_DREAM_VISION);
            } 
        }

        ScriptedAI::JustDied(pKiller);
    }
};

CreatureAI* GetAI_npc_summon_possessed(Creature* pCreature)
{
    return new npc_summon_possessedAI(pCreature);
}

/*
 * Riggle Bassbait
 */

enum
{
    QUEST_MASTER_ANGLER     = 8193,

    EVENT_TOURNAMENT        = 15,

    YELL_BEGIN              = -1900100,
    YELL_WINNER             = -1900101,
    YELL_OVER               = -1900102,
};

struct npc_riggle_bassbaitAI : ScriptedAI
{
    explicit npc_riggle_bassbaitAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_uiTimer = 0;

        npc_riggle_bassbaitAI::Reset();
    }

    uint32 m_uiTimer;

    void Reset() override
    {

    }

    void CheckTournamentState() const
    {
        // complex system to keep things safe in case of crashes/restarts during the event
        // yells should not be repeatable, quest credit should go to a single person per week
        if (sGameEventMgr.IsActiveEvent(EVENT_TOURNAMENT))
        {
            if (!m_creature->isQuestGiver())
            {
                auto prevWinTime = sObjectMgr.GetSavedVariable(VAR_TOURNAMENT);

                if (time(nullptr) - prevWinTime > DAY)
                {
                    m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

                    auto startedAlready = sObjectMgr.GetSavedVariable(VAR_TOURN_GOES);

                    if (startedAlready) return;

                    m_creature->MonsterYellToZone(YELL_BEGIN);
                    sObjectMgr.SetSavedVariable(VAR_TOURN_GOES, 1, true);
                    sObjectMgr.SetSavedVariable(VAR_TOURN_OVER, 0, true);
                }
            }
        }
        else
        {
            if (m_creature->isQuestGiver())
            {
                m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                sObjectMgr.SetSavedVariable(VAR_TOURN_GOES, 0, true);
            }

            auto isOver = sObjectMgr.GetSavedVariable(VAR_TOURN_OVER);

            if (isOver) return;

            m_creature->MonsterYellToZone(YELL_OVER);
            sObjectMgr.SetSavedVariable(VAR_TOURN_OVER, 1, true);
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiTimer < uiDiff)
        {
            CheckTournamentState();
            m_uiTimer = 1000;
        }
        else
            m_uiTimer -= uiDiff;

        ScriptedAI::UpdateAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_riggle_bassbait(Creature* pCreature)
{
    return new npc_riggle_bassbaitAI(pCreature);
}

bool QuestRewarded_npc_riggle_bassbait(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_MASTER_ANGLER)
    {
        sObjectMgr.SetSavedVariable(VAR_TOURNAMENT, time(nullptr), true);
        sObjectMgr.SetSavedVariable(VAR_TOURN_GOES, 0, true);
        pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        pCreature->MonsterYellToZone(YELL_WINNER, 0, pPlayer);
    }

    return true;
}

/*
 * Target Dummy
 */

enum
{
    TARGET_DUMMY_DURATION = 15000,
};

enum TargetDummySpells
{
    TARGET_DUMMY_PASSIVE = 4044,
    ADVANCED_TARGET_DUMMY_PASSIVE = 4048,
    MASTER_TARGET_DUMMY_PASSIVE = 19809,
    TARGET_DUMMY_SPAWN_EFFECT = 4507,
    ADVANCED_TARGET_DUMMY_SPAWN_EFFECT = 4092,
};

enum TargetDummyEntry
{
    TARGET_DUMMY = 2673,
    ADVANCED_TARGET_DUMMY = 2674,
    MASTER_TARGET_DUMMY = 12426
};

struct npc_target_dummyAI : ScriptedAI
{
    uint32 m_uiStayTime;
    uint32 m_uiAggroTimer;
    bool m_bActive;
    bool m_bIsAggro;
    TargetDummySpells m_spawnEffect;
    TargetDummySpells m_passiveSpell;

    explicit npc_target_dummyAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_bActive = true;
        m_uiStayTime = TARGET_DUMMY_DURATION;
        m_creature->addUnitState(UNIT_STAT_ROOT);

        switch (m_creature->GetEntry())
        {
            case ADVANCED_TARGET_DUMMY:
            {
                m_spawnEffect = ADVANCED_TARGET_DUMMY_SPAWN_EFFECT;
                m_passiveSpell = ADVANCED_TARGET_DUMMY_PASSIVE;
                break;
            }
            case MASTER_TARGET_DUMMY:
            {
                m_spawnEffect = ADVANCED_TARGET_DUMMY_SPAWN_EFFECT;
                m_passiveSpell = MASTER_TARGET_DUMMY_PASSIVE;
                break;
            }
            case TARGET_DUMMY:
            default:
            {
                m_spawnEffect = TARGET_DUMMY_SPAWN_EFFECT;
                m_passiveSpell = TARGET_DUMMY_PASSIVE;
                break;
            }
        }

        DoCastSpellIfCan(m_creature, m_spawnEffect, false);
    }

    void Reset() override
    {
        m_bIsAggro = false;
        m_uiAggroTimer = 3000;
    }

    void Aggro(Unit* /*pWho*/) override
    {

    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_bActive)
            return;

        if (m_uiStayTime < diff)
        {
            // Dummy should leave a corpse after expiring
            m_creature->CombatStop();
            m_creature->DoKillUnit(m_creature);
            m_bActive = false;
            return;
        }
        else
            m_uiStayTime -= diff;

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);

        if (!m_creature->hasUnitState(UNIT_STAT_ROOT))
            m_creature->addUnitState(UNIT_STAT_ROOT);

        if (m_uiAggroTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), m_passiveSpell, false) == CAST_OK)
            {
                m_uiAggroTimer = 3000;
                m_bIsAggro = true;
            }
        }
        else
            m_uiAggroTimer -= diff;
    }
};

CreatureAI* GetAI_npc_target_dummy(Creature* pCreature)
{
    return new npc_target_dummyAI(pCreature);
}

/*########
# npc_shahram
#########*/

enum
{
    SPELL_BLESSING_OF_SHAHRAM = 16599,
    SPELL_CURSE_OF_SHAHRAM    = 16597,
    SPELL_FIST_OF_SHAHRAM     = 16601,
    SPELL_FLAMES_OF_SHAHRAM   = 16596,
    SPELL_MIGHT_OF_SHAHRAM    = 16600,
    SPELL_WILL_OF_SHAHRAM     = 16598
};

struct npc_shahramAI : ScriptedPetAI
{
    explicit npc_shahramAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);

        m_creature->ToPet()->InitStatsForLevel(63);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

        if (m_creature->GetCharmInfo())
            m_creature->GetCharmInfo()->SetReactState(REACT_AGGRESSIVE);

        despawnTimer = 10000;
        combatDespawnTimer = 5000;

        hasCastBuff = false;
        hasCastDebuff = false;

        npc_shahramAI::Reset();
    }

    uint32 despawnTimer;
    uint32 combatDespawnTimer;

    bool hasCastBuff;
    bool hasCastDebuff;

    void Reset() override
    {

    }

    void UpdatePetAI(const uint32 uiDiff) override
    {
        ScriptedPetAI::UpdatePetAI(uiDiff);

        if (combatDespawnTimer > uiDiff)
        {
            uint32 shahramSpell = 0;

            if (!hasCastDebuff)
            {
                switch(urand(0,2))
                {

                case 0:
                    shahramSpell = SPELL_CURSE_OF_SHAHRAM;
                    break;

                case 1:
                    shahramSpell = SPELL_FLAMES_OF_SHAHRAM;
                    if (!urand(0, 99))
                        DoScriptText(-1409006, m_creature);

                    break;

                default:
                    shahramSpell = SPELL_MIGHT_OF_SHAHRAM;
                }

                Unit* victim = m_creature->getVictim();

                if (!victim || !m_creature->IsInRange(victim, 0, 10.0f))
                    shahramSpell = 0;

            }
            else if (!hasCastBuff)
            {
                switch(urand(0,3))
                {
                case  0:
                    shahramSpell = SPELL_BLESSING_OF_SHAHRAM;
                    break;

                case 1:
                    shahramSpell = SPELL_FIST_OF_SHAHRAM;
                    break;

                default:
                    shahramSpell = SPELL_WILL_OF_SHAHRAM;
                }
            }

            if (shahramSpell && DoCastSpellIfCan(m_creature, shahramSpell, CAST_TRIGGERED) == CAST_OK)
            {
                if (!hasCastDebuff)
                    hasCastDebuff = true;
                else
                    hasCastBuff = true;
            }

            combatDespawnTimer -= uiDiff;
        }
        else
            DespawnShahram();
    }

    // Ensure Shahram despawns after a max of 10s
    void UpdateAI(const uint32 uiDiff) override
    {
        ScriptedPetAI::UpdateAI(uiDiff);

        if (despawnTimer > uiDiff)
            despawnTimer -= uiDiff;
        else
            DespawnShahram();
    }

    void DespawnShahram() const
    {
        m_creature->ToPet()->Unsummon(PET_SAVE_AS_DELETED);
    }
};

CreatureAI* GetAI_npc_shahram(Creature* pCreature)
{
    return new npc_shahramAI(pCreature);
}

/*
 * Goblin Land Mine
 */

enum
{
    SPELL_DETONATION = 4043,
};

struct npc_goblin_land_mineAI : ScriptedAI
{
    explicit npc_goblin_land_mineAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_goblin_land_mineAI::Reset();

        m_bDetonation = false;
        m_bArmed = false;
        m_bDespawn = false;
        m_uiDetonationTimer = 500;
        m_uiArmTimer = 10000;
        m_uiDespawnTimer = 70000;
    }

    bool m_bDetonation;
    bool m_bArmed;
    bool m_bDespawn;
    uint32 m_uiDetonationTimer;
    uint32 m_uiArmTimer;
    uint32 m_uiDespawnTimer;

    void Reset() override
    {
        m_creature->GetMotionMaster()->MoveIdle();
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (!m_bArmed || m_bDetonation || m_bDespawn)
            return;

        if (m_creature->GetDistance(pWho) < 5.0f && pWho->IsHostileTo(m_creature))
            m_bDetonation = true;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        // self-despawn in 60 + 10 (live + arming) seconds or in 0.5 second after triggering
        if (!m_bDespawn)
        {
            if (m_uiDespawnTimer < uiDiff)
            {
                m_bDespawn = true;
            }
            else
                m_uiDespawnTimer -= uiDiff;
        }

        // once placed, it first armes itself for 10 seconds
        if (!m_bArmed)
        {
            if (m_uiArmTimer < uiDiff)
            {
                m_bArmed = true;
            }
            else
                m_uiArmTimer -= uiDiff;

            return;
        }

        if (m_bDetonation && !m_bDespawn)
        {
            DoStartNoMovement(m_creature->getVictim());

            if (m_uiDetonationTimer < uiDiff)
            {
                m_creature->CastSpell(m_creature, SPELL_DETONATION, false);
                m_bDespawn = true;
                m_uiDespawnTimer = 500;
                m_bDetonation = false;
            }
            else
                m_uiDetonationTimer -= uiDiff;
        }

        // if triggered despawn with a little delay to allow spell go first
        if (m_bDespawn)
        {
            if (m_uiDespawnTimer < uiDiff)
            {
                if (auto pOwner = m_creature->GetOwner())
                    pOwner->RemoveGuardian(m_creature->ToPet());

                m_creature->RemoveFromWorld();
            }
            else
                m_uiDespawnTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_npc_goblin_land_mine(Creature * pCreature)
{
    return new npc_goblin_land_mineAI(pCreature);
}

/*
 * Critter
 */

enum
{
    ESCAPE_TIMER    = 12000
};

struct npc_critterAI : ScriptedAI
{
    explicit npc_critterAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_critterAI::Reset();
    }

    uint32 m_uiCombatTimer;

    void Reset() override
    {
        m_uiCombatTimer = ESCAPE_TIMER;
    }

    void AttackStart(Unit* /*pWho*/) override {}

    void DamageTaken(Unit* pWho, uint32& uiDamage) override
    {
        if (uiDamage < m_creature->GetHealth())
        {
            m_creature->GetMotionMaster()->MoveFleeing(pWho, ESCAPE_TIMER);
            m_uiCombatTimer = ESCAPE_TIMER;
        }
    }

    void SpellHit(Unit* pWho, const SpellEntry* pSpell) override
    {
        if (SpellAuraHolder* holder = m_creature->GetSpellAuraHolder(pSpell->Id))
        {
            if (!holder->IsPositive())
            {
                m_creature->GetMotionMaster()->MoveFleeing(pWho, ESCAPE_TIMER);
                m_uiCombatTimer = ESCAPE_TIMER;
            }
        }
    }

    void UpdateAI(const uint32 diff) override
    {
        if (m_creature->isInCombat())
        {
            if (m_uiCombatTimer <= diff)
            {
                EnterEvadeMode();
                m_uiCombatTimer = ESCAPE_TIMER;
            }
            else
                m_uiCombatTimer -= diff;
        }
    }
};

CreatureAI* GetAI_npc_critter(Creature* pCreature)
{
    return new npc_critterAI(pCreature);
}

/*
 * Curing the Sick
 */

enum
{
    SPELL_APPLY_SALVE           = 19512,
    SPELL_SICKY_CRITTER_AURA    = 19502,

    NPC_SICKLY_DEER             = 12298,
    NPC_SICKLY_GAZELLE          = 12296,

    NPC_CURED_DEER              = 12299,
    NPC_CURED_GAZELLE           = 12297,

    MODEL_CURED_DEER            = 347,
    MODEL_CURED_GAZELLE         = 1547,
};

struct npc_sickly_critterAI : npc_critterAI
{
    explicit npc_sickly_critterAI(Creature* pCreature) : npc_critterAI(pCreature)
    {
        npc_sickly_critterAI::Reset();
        npc_sickly_critterAI::ResetCreature();
    }

    bool m_bIsHit;
    bool m_bModify;
    uint32 m_uiTimer;
    Team team;
    ObjectGuid m_PlayerGuid;

    void Reset() override
    {

    }

    void ResetCreature() override
    {
        m_bIsHit = false;
        m_bModify = false;
        m_uiTimer = 1500;
    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell) override
    {
        if (pSpell->Id != SPELL_APPLY_SALVE)
        {
            npc_critterAI::SpellHit(pCaster, pSpell);
            return;
        }

        if (m_bIsHit)
            return;

        auto pPlayer = pCaster->ToPlayer();

        if (!pPlayer)
            return;

        m_PlayerGuid = pPlayer->GetObjectGuid();

        if (m_creature->GetEntry() != NPC_SICKLY_DEER && m_creature->GetEntry() != NPC_SICKLY_GAZELLE)
            return;

        team = pPlayer->GetTeam();
        m_bModify = true;

        m_creature->GetMotionMaster()->Clear();
        m_creature->GetMotionMaster()->MoveFleeing(pPlayer);
        m_creature->ForcedDespawn(10 * IN_MILLISECONDS);

        m_bIsHit = true;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_bModify)
        {
            if (m_uiTimer < uiDiff)
            {
                switch (team)
                {
                case ALLIANCE:
                    m_creature->SetEntry(NPC_CURED_DEER);
                    m_creature->SetDisplayId(MODEL_CURED_DEER);
                    break;
                case HORDE:
                    m_creature->SetEntry(NPC_CURED_GAZELLE);
                    m_creature->SetDisplayId(MODEL_CURED_GAZELLE);
                    break;
                }

                m_creature->RemoveAurasDueToSpell(SPELL_SICKY_CRITTER_AURA);
                m_bModify = false;

                if (auto pPlayer = m_creature->GetMap()->GetPlayer(m_PlayerGuid))
                    pPlayer->RewardPlayerAndGroupAtCast(m_creature, SPELL_APPLY_SALVE);
            }
            else
                m_uiTimer -= uiDiff;
        }

        npc_critterAI::UpdateAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_sickly_critter(Creature* pCreature)
{
    return new npc_sickly_critterAI(pCreature);
}

/*
 * Goblin Bomb Dispenser
 */

enum
{
    SPELL_EXPLOSION         = 13259,
    SPELL_PET_BOMB_PASSIVE  = 13260,
    SPELL_MALFUNCTION_EXPL  = 13261,
    SPELL_QUIET_SUICIDE     = 3617
};

struct npc_goblin_bomb_dispenserAI : ScriptedPetAI
{
    explicit npc_goblin_bomb_dispenserAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);

        if (m_creature->GetCharmInfo())
            m_creature->GetCharmInfo()->SetReactState(REACT_AGGRESSIVE);

        npc_goblin_bomb_dispenserAI::Reset();
        npc_goblin_bomb_dispenserAI::ResetCreature();
    }

    bool m_bExploded;
    uint32 m_uiAliveTimer;

    void Reset() override
    {

    }

    void ResetCreature() override
    {
        m_bExploded = false;
        m_uiAliveTimer = MINUTE * IN_MILLISECONDS;

        m_creature->CastSpell(m_creature, SPELL_PET_BOMB_PASSIVE, true);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (auto pPet = m_creature->ToPet())
            pPet->DelayedUnsummon(5000, PET_SAVE_AS_DELETED);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_bExploded)
        {
            if (m_uiAliveTimer <= uiDiff)
            {
                m_creature->CastSpell(m_creature, SPELL_EXPLOSION, true);
                m_bExploded = true;
            }
            else
                m_uiAliveTimer -= uiDiff;

            ScriptedPetAI::UpdateAI(uiDiff);
        }
    }
};

CreatureAI* GetAI_npc_goblin_bomb_dispenser(Creature* pCreature)
{
    return new npc_goblin_bomb_dispenserAI(pCreature);
}

/*
 * Explosive Sheep
 */

enum
{
    SPELL_EXPLOSIVE_SHEEP_PASSIVE   = 4051,
    SPELL_EXPLOSIVE_SHEEP           = 4050
};

struct npc_explosive_sheepAI : ScriptedPetAI
{
    explicit npc_explosive_sheepAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);

        if (m_creature->GetCharmInfo())
            m_creature->GetCharmInfo()->SetReactState(REACT_AGGRESSIVE);

        npc_explosive_sheepAI::Reset();
        npc_explosive_sheepAI::ResetCreature();
    }

    bool m_bExploded;
    uint32 m_uiAliveTimer;

    void Reset() override
    {

    }

    void ResetCreature() override
    {
        m_bExploded = false;
        m_uiAliveTimer = 3 * MINUTE * IN_MILLISECONDS;

        m_creature->CastSpell(m_creature, SPELL_EXPLOSIVE_SHEEP_PASSIVE, true);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (auto pPet = m_creature->ToPet())
            pPet->DelayedUnsummon(5000, PET_SAVE_AS_DELETED);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_bExploded)
        {
            if (m_uiAliveTimer <= uiDiff)
            {
                m_creature->CastSpell(m_creature, SPELL_EXPLOSIVE_SHEEP, true);
                m_bExploded = true;
            }
            else
                m_uiAliveTimer -= uiDiff;

            ScriptedPetAI::UpdateAI(uiDiff);
        }
    }
};

CreatureAI* GetAI_npc_explosive_sheep(Creature* pCreature)
{
    return new npc_explosive_sheepAI(pCreature);
}

void AddSC_npcs_special()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_chicken_cluck";
    newscript->GetAI = &GetAI_npc_chicken_cluck;
    newscript->pQuestAcceptNPC =   &QuestAccept_npc_chicken_cluck;
    newscript->pQuestComplete = &QuestComplete_npc_chicken_cluck;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_injured_patient";
    newscript->GetAI = &GetAI_npc_injured_patient;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_doctor";
    newscript->GetAI = &GetAI_npc_doctor;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_doctor;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_doctor;
    newscript->pGossipHello = &GossipHello_npc_doctor;
    newscript->pGossipSelect = &GossipSelect_npc_doctor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_garments_of_quests";
    newscript->GetAI = &GetAI_npc_garments_of_quests;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_guardian";
    newscript->GetAI = &GetAI_npc_guardian;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_lunaclaw_spirit";
    newscript->pGossipHello =  &GossipHello_npc_lunaclaw_spirit;
    newscript->pGossipSelect = &GossipSelect_npc_lunaclaw_spirit;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_mount_vendor";
    newscript->pGossipHello =  &GossipHello_npc_mount_vendor;
    newscript->pGossipSelect = &GossipSelect_npc_mount_vendor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_sayge";
    newscript->pGossipHello = &GossipHello_npc_sayge;
    newscript->pGossipSelect = &GossipSelect_npc_sayge;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "rat_des_profondeurs";
    newscript->GetAI = &GetAI_rat_des_profondeurs;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_felhound_minion";
    newscript->GetAI = &GetAI_npc_felhound_minion;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_gnomish_battle_chicken";
    newscript->GetAI = &GetAI_npc_gnomish_battle_chicken;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_arcanite_dragonling";
    newscript->GetAI = &GetAI_npc_arcanite_dragonling;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_timbermaw_ancestor";
    newscript->GetAI = &GetAI_npc_timbermaw_ancestor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_cannonball_runner";
    newscript->GetAI = &GetAI_npc_cannonball_runner;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_the_cleaner";
    newscript->GetAI = &GetAI_npc_the_cleaner;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_pats_firework_guy";
    newscript->GetAI = &GetAI_npc_pats_firework_guy;
    newscript->RegisterSelf();
    /*
    newscript = new Script;
    newscript->Name = "npc_firestarter_regular";
    newscript->GetAI = &GetAI_npc_firestarter_regular;
    newscript->RegisterSelf();
    */
    newscript = new Script;
    newscript->Name = "npc_firestarter_show";
    newscript->GetAI = &GetAI_npc_firestarter_show;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_summon_possessed";
    newscript->GetAI = &GetAI_npc_summon_possessed;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_riggle_bassbait";
    newscript->GetAI = &GetAI_npc_riggle_bassbait;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_riggle_bassbait;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_target_dummy";
    newscript->GetAI = &GetAI_npc_target_dummy;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_shahram";
    newscript->GetAI = &GetAI_npc_shahram;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_goblin_land_mine";
    newscript->GetAI = &GetAI_npc_goblin_land_mine;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_critter";
    newscript->GetAI = &GetAI_npc_critter;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_sickly_critter";
    newscript->GetAI = &GetAI_npc_sickly_critter;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_goblin_bomb_dispenser";
    newscript->GetAI = &GetAI_npc_goblin_bomb_dispenser;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_explosive_sheep";
    newscript->GetAI = &GetAI_npc_explosive_sheep;
    newscript->RegisterSelf();
}
