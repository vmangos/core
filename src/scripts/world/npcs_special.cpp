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
#include <array>

/* ContentData
npc_chicken_cluck       100%    support for quest 3861 (Cluck!)
npc_guardian            100%    guardianAI used to prevent players from accessing off-limits areas. Not in use by SD2
npc_garments_of_quests  80%     NPC's related to all Garments of-quests 5621, 5624, 5625, 5648, 5650
npc_injured_patient     100%    patients for triage-quests (6622 and 6624)
npc_doctor              100%    Gustaf Vanhowzen and Gregory Victor, quest 6622 and 6624 (Triage)
npc_lunaclaw_spirit     100%    Appears at two different locations, quest 6001/6002
npc_mount_vendor        100%    Regular mount vendors all over the world. Display gossip if player doesn't meet the requirements to buy
npc_sayge               100%    Darkmoon event fortune teller, buff player based on answers given
npc_event_fireworks     100%    Shoots fireworks every hour. Used for New Year's Eve event.
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
## npc_tonk_mine
######*/

#define SPELL_TONK_MINE_DETONATE 25099
#define NPC_DARKMOON_STEAM_TONK  15328

struct npc_tonk_mineAI : public ScriptedAI
{
    npc_tonk_mineAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiArmTimer;
    bool m_bArmed;

    void Reset()
    {
        m_uiArmTimer = 3000;
        m_bArmed = false;
    }

    void Aggro(Unit* pWho) override {}

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (!m_bArmed || !pWho)
            return;

        if ((m_creature->GetDistance(pWho) < 2.0f) && (pWho->GetEntry()== NPC_DARKMOON_STEAM_TONK))
        {
            m_creature->CastSpell(pWho, SPELL_TONK_MINE_DETONATE, true);
            m_creature->ForcedDespawn();
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_bArmed)
            if (m_uiArmTimer < uiDiff)
            {
                m_bArmed = true;
            }
            else
                m_uiArmTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_tonk_mine(Creature* pCreature)
{
    return new npc_tonk_mineAI(pCreature);
}

/*######
## npc_tonk_mortar
######*/

#define SPELL_TONK_MORTAR_EXPLOSION 27745

struct npc_tonk_mortarAI : public ScriptedAI
{
    npc_tonk_mortarAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiExplosionTimer;
    bool m_bExploded;

    void Reset()
    {
        m_uiExplosionTimer = 1500;
        m_bExploded = false;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiExplosionTimer < uiDiff)
        {
            if (m_bExploded)
                m_creature->ForcedDespawn();

            m_creature->CastSpell(m_creature, SPELL_TONK_MORTAR_EXPLOSION, true);
            m_uiExplosionTimer = 5000;
            m_bExploded = true;
        }
        else
            m_uiExplosionTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_tonk_mortar(Creature* pCreature)
{
    return new npc_tonk_mortarAI(pCreature);
}

/*######
## npc_steam_tonk
######*/

struct npc_steam_tonkAI : public ScriptedAI
{
    npc_steam_tonkAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiPossesedCheck;

    void Reset()
    {
        m_uiPossesedCheck = 3000;
    }

    void Aggro(Unit* /*pWho*/) override {}
    void MoveInLineOfSight(Unit* /*pWho*/) override {}
    void AttackStart(Unit* /*pWho*/) override {}
    void EnterCombat(Unit* /*pWho*/) override {};

    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_uiPossesedCheck < uiDiff)
        {
            if (!m_creature->GetCharmer())
                m_creature->DealDamage(m_creature, m_creature->GetMaxHealth(), nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
        }
        else
            m_uiPossesedCheck -= uiDiff;
    }
};

CreatureAI* GetAI_npc_steam_tonk(Creature* pCreature)
{
    return new npc_steam_tonkAI(pCreature);
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
        if (m_creature->getVictim())
        {
            if (m_uiManaBurnTimer < uiDiff)
            {
                if (m_creature->getVictim()->getPowerType() == POWER_MANA)
                    DoCastSpellIfCan(m_creature->getVictim(), 15980);
                m_uiManaBurnTimer = urand(9800, 15200);
                return;
            }
            else
                m_uiManaBurnTimer -= uiDiff;
        }
        ScriptedPetAI::UpdateAI(uiDiff);
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
            if (DoCastSpellIfCan(m_creature, SPELL_CHICKEN_FURY, CF_TRIGGERED) == CAST_OK)
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
                if (DoCastSpellIfCan(m_creature, SPELL_BATTLE_SQUAWK, CF_TRIGGERED) == CAST_OK)
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
    SPELL_FLAME_BUFFET = 9658,
    SPELL_FLAME_BREATH = 8873
};

struct npc_arcanite_dragonlingAI : ScriptedPetAI
{
    explicit npc_arcanite_dragonlingAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);
        m_creature->GetCharmInfo()->SetReactState(REACT_AGGRESSIVE);
        npc_arcanite_dragonlingAI::Reset();
    }

    uint32 m_firebuffetTimer;
    uint32 m_flamebreathTimer;

    void Reset() override 
    { 
        m_firebuffetTimer = 5000;
        m_flamebreathTimer = urand(10000, 60000);
    }

    void UpdatePetAI(const uint32 uiDiff) override
    {
        if (m_firebuffetTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FLAME_BUFFET) == CAST_OK)
                m_firebuffetTimer = 22500;
        }
        else
            m_firebuffetTimer -= uiDiff;

        if (m_flamebreathTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FLAME_BREATH) == CAST_OK)
                m_flamebreathTimer = urand(10000, 60000);
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
## Emerald Dragon Whelp
######*/

enum
{
    SPELL_ACID_SPIT = 9591
};

struct npc_emerald_dragon_whelpAI : ScriptedPetAI
{
    explicit npc_emerald_dragon_whelpAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        m_creature->SetCanModifyStats(true);

        if (m_creature->GetCharmInfo())
        {
            m_creature->GetCharmInfo()->SetReactState(REACT_DEFENSIVE);
        }

        Reset();
    }

    uint32 m_uiAcidSpitTimer;

    void Reset() override
    {
        m_uiAcidSpitTimer = 1000;
    }

    void UpdatePetAI(const uint32 uiDiff) override
    {
        if (m_uiAcidSpitTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_ACID_SPIT) == CAST_OK)
                m_uiAcidSpitTimer = 2000;
        }
        else
            m_uiAcidSpitTimer -= uiDiff;

        ScriptedPetAI::UpdatePetAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_emerald_dragon_whelp(Creature* pCreature)
{
    return new npc_emerald_dragon_whelpAI(pCreature);
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
        DoCastSpellIfCan(m_creature, SPELL_IMMUNITY, CF_TRIGGERED);
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

    NPC_FIREWORK_CREDIT_MARKER      = 15893,
    NPC_CLUSTER_CREDIT_MARKER       = 15894,
    GO_OMEN_CLUSTER_LAUNCHER        = 180874,

    SPELL_LUNAR_FORTUNE             = 26522
};

struct FireworkStruct
{
    uint32 m_uiNpcEntry;
    uint32 m_uiSpellEntry[5];
    bool m_bIsCluster;
};

const std::array<FireworkStruct, 25> Fireworks =
{ {
    { 15872, {26357, 26303, 26302, 26300, 26301}, true }, // Blue Firework Cluster
    { 15873, {26360, 26308, 26307, 26306, 26305}, true }, // Red Firework Cluster
    { 15874, {26358, 26312, 26311, 26310, 26309}, true }, // Green Firework Cluster
    { 15875, {26359, 26316, 26315, 26314, 26313}, true }, // Purple Firework Cluster
    { 15876, {26361, 26320, 26319, 26318, 26317}, true }, // White Firework Cluster
    { 15877, {26362, 26324, 26323, 26322, 26321}, true }, // Yellow Firework Cluster
    { 15879, {26344, 0,     0,     0,     0},     false}, // Small Blue Rocket
    { 15880, {26345, 0,     0,     0,     0},     false}, // Small Green Rocket
    { 15881, {26346, 0,     0,     0,     0},     false}, // Small Purple Rocket
    { 15882, {26347, 0,     0,     0,     0},     false}, // Small Red Rocket
    { 15883, {26349, 0,     0,     0,     0},     false}, // Small Yellow Rocket
    { 15884, {26348, 0,     0,     0,     0},     false}, // Small White Rocket
    { 15885, {26351, 0,     0,     0,     0},     false}, // Large Blue Rocket
    { 15886, {26352, 0,     0,     0,     0},     false}, // Large Green Rocket
    { 15887, {26353, 0,     0,     0,     0},     false}, // Large Purple Rocket
    { 15888, {26354, 0,     0,     0,     0},     false}, // Large Red Rocket
    { 15889, {26355, 0,     0,     0,     0},     false}, // Large White Rocket
    { 15890, {26356, 0,     0,     0,     0},     false}, // Large Yellow Rocket
    { 15911, {26487, 26486, 26485, 26484, 26483}, true }, // Large Blue Firework Cluster
    { 15912, {26495, 26494, 26493, 26492, 26491}, true }, // Large Green Firework Cluster
    { 15913, {26500, 26499, 26498, 26497, 26496}, true }, // Large Purple Firework Cluster
    { 15914, {26505, 26504, 26503, 26502, 26501}, true }, // Large Red Firework Cluster
    { 15915, {26510, 26509, 26508, 26507, 26506}, true }, // Large White Firework Cluster
    { 15916, {26515, 26514, 26513, 26512, 26511}, true }, // Large Yellow Firework Cluster
    { 15918, {26487, 26509, 26508, 26507, 26483}, true }, // Lucky Rocket Cluster
}};

const std::array<uint32, 7> Launcher = { { 180772, 180859, 180869, 180874, 180771, 180850, 180868 } };

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
        for (uint8 i = 0; i < Fireworks.size(); ++i)
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

        for (uint8 l = 0; l < Launcher.size(); ++l)
        {
            if (auto pGo = GetClosestGameObjectWithEntry(m_creature, Launcher[l], CONTACT_DISTANCE))
            {
                pGo->SendGameObjectCustomAnim();
                break;
            }
        }

        float x, y, z;
        m_creature->GetPosition(x, y, z);

        if (Fireworks[m_uiIndex].m_bIsCluster)
        {
            for (int i = 0; i < 5; ++i)
            {
                switch (i)
                {
                    case 0:
                        m_creature->NearTeleportTo(x, y, z + 7.0f, 0.0f);
                        break;
                    case 1:
                        m_creature->NearTeleportTo(x - 1.5f, y + 1.5f, z + 5.0f, 0.0f);
                        break;
                    case 2:
                        m_creature->NearTeleportTo(x - 1.5f, y - 1.5f, z + 5.0f, 0.0f);
                        break;
                    case 3:
                        m_creature->NearTeleportTo(x + 1.5f, y, z + 5.0f, 0.0f);
                        break;
                    case 4:
                        m_creature->NearTeleportTo(x, y + 1.5f, z + 3.0f, 0.0f);
                        break;
                }
                m_creature->CastSpell(m_creature, Fireworks[m_uiIndex].m_uiSpellEntry[i], true);
            }
        }
        else
            m_creature->CastSpell(m_creature, Fireworks[m_uiIndex].m_uiSpellEntry[0], true);

        if (m_bisLucky)
            m_creature->CastSpell(m_creature, SPELL_LUNAR_FORTUNE, true);

        if (m_creature->IsTemporarySummon())
        {
            if (Player* pSummoner = m_creature->GetMap()->GetPlayer(static_cast<TemporarySummon*>(m_creature)->GetSummonerGuid()))
                if (CreatureInfo const* cInfo = ObjectMgr::GetCreatureTemplate(Fireworks[m_uiIndex].m_bIsCluster ? NPC_CLUSTER_CREDIT_MARKER : NPC_FIREWORK_CREDIT_MARKER))
                    pSummoner->KilledMonster(cInfo, ObjectGuid());
        }

        if (GetClosestGameObjectWithEntry(m_creature, GO_OMEN_CLUSTER_LAUNCHER, INTERACTION_DISTANCE))
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
    bool m_bActive;
    TargetDummySpells m_spawnEffect;
    TargetDummySpells m_passiveSpell;

    explicit npc_target_dummyAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_bActive = true;
        m_uiStayTime = TARGET_DUMMY_DURATION;
        SetCombatMovement(false);

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

        m_creature->AddAura(m_passiveSpell, ADD_AURA_PERMANENT);
        DoCastSpellIfCan(m_creature, m_spawnEffect, false);
    }

    void Reset() override
    {
        
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

            if (shahramSpell && DoCastSpellIfCan(m_creature, shahramSpell, CF_TRIGGERED) == CAST_OK)
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
        SetCombatMovement(false);
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

/*
    New Year's Eve Fireworks Event
*/

enum FireworksZones
{
    STRANGLETHORN_VALE = 33,   // Booty bay
    ORGRIMMAR = 1637,
    UNDERCITY = 1497,
    TELDRASSIL = 141,  // Darnassus
    THUNDERBLUFF = 1638,
    DUN_MOROGH = 1,    // Ironforge
    STORMWIND = 1519
};

static const std::vector<Location> BootyBayPos =
{
    { -14358.03f, 515.058f, 34.2664f,   3.68265f },
    { -14357.49f, 490.8445f, 39.47329f, 0.9773831f },
    { -14355.49f, 518.5656f, 35.36923f, 4.76475f },
    { -14353.66f, 485.8341f, 36.86639f, 4.886924f },
    { -14376.54f, 487.5282f, 44.47044f, 5.899214f },
    { -14337.91f, 555.8661f, 40.04211f,  2.199115f },
    { -14382.42f, 516.2576f, 37.59617f, 5.846854f },
    { -14389.55f, 485.7437f, 36.32653f, 6.0912f },
    { -14376.76f, 507.9842f, 59.56532f, 0.9773831f },
    { -14358.97f, 502.0223f, 43.82631f, 2.199115f },
    { -14385.91f, 544.1411f, 38.2412f, 4.886924f },
    { -14379.15f, 507.237f,  43.95641f, 6.0912f },
    { -14363.28f, 506.7344f, 41.27156f, 5.899214f },
    { -14374.43f, 496.0701f, 31.31265f, 4.76475f },
    { -14360.71f, 493.6036f, 32.06157f, 5.846854f },
    { -14368.91f, 608.1322f, 37.2545f, 3.68265f },
    { -14371.19f, 505.8404f, 28.75178f, 6.0912f },
    { -14356.57f, 494.1887f, 39.58786f, 3.68265f },
    { -14380.02f, 506.3313f, 59.75512f, 6.0912f },
    { -14389.84f, 503.4612f, 37.37088f, 5.899214f },
    { -14353.64f, 485.4063f, 34.11704f, 4.76475f },
    { -14314.71f, 683.2221f, 38.0592f,  2.199115f },
    { -14374.91f, 491.508f,  40.34925f, 4.886924f },
    { -14351.33f, 506.1898f, 28.69684f, 5.846854f },
    { -14378.1f,  473.5608f, 40.16786f, 0.9773831f },
    { -14380.1f,  675.7681f, 32.9524f, 4.846854f },
    { -14380.1f,  706.7681f, 30.9524f, 3.646854f },
    { -14298.1f,  632.1582f, 32.4499f, 2.166812f },
    { -14246.9f,  661.8602f, 28.4499f, 2.166832f },
    { -14327.2f,  547.2762f, 40.7209f, 5.185142f },
    { -14279.6f,  714.5067f, 29.1312f, 1.153117f }
};

static const std::vector<Location> StormwindPos =
{
    { -8823.592f,    470.316f,    169.2295f,   1.239183f },
    { -8883.005f,    590.1927f,   153.1264f,   0.9773831f },
    { -8919.692f,    482.9097f,   175.6471f,   3.735006f },
    { -8907.228f,    551.7864f,   178.68f,     4.729844f },
    { -8979.651f,    639.3976f,   174.4983f,   3.961899f },
    { -8878.851f,    583.1771f,   156.3018f,   3.700105f },
    { -8937.466f,    517.0521f,   173.7207f,   3.68265f },
    { -8919.247f,    562.2882f,   166.1023f,   3.630291f },
    { -8866.37f,     576.0504f,   147.8798f,   3.47321f },
    { -8957.122f,    517.7014f,   151.3226f,   3.630291f },
    { -8957.857f,    521.934f,    148.9058f,   4.729844f },
    { -8851.988f,    486.5625f,   169.6635f,   4.258607f },
    { -8972.651f,    531.0799f,   166.6744f,   4.886924f },
    { -8986.207f,    560.9792f,   169.1758f,   5.550147f },
    { -8848.866f,    488.8281f,   174.9777f,   3.961899f },
    { -8946.897f,    521.3976f,   183.4021f,   0.9424766f },
    { -8876.854f,    593.6771f,   161.0399f,   0.1396245f },
    { -8828.743f,    463.0382f,   175.7672f,   0.9424766f },
    { -8968.125f,    525.1285f,   171.9304f,   3.054327f },
    { -8952.893f,    629.2743f,   178.2722f,   0.9424766f },
    { -8882.172f,    574.4219f,   171.7124f,   6.0912f },
    { -8980.363f,    546.7934f,   170.4686f,   4.66003f },
    { -8874.944f,    575.5f,      165.7746f,   0.9075702f },
    { -8945.109f,    496.3715f,   143.2825f,   6.073746f },
    { -8953.094f,    513.5521f,   170.9165f,   3.735006f },
    { -8955.02f,     623.7621f,   183.7679f,   0.9424766f },
    { -8977.524f,    644.9097f,   187.926f,    3.961899f },
    { -8985.639f,    653.9809f,   190.0452f,   3.630291f },
    { -8985.639f,    653.9809f,   190.0452f,   3.630291f },
    { -8849.723f,    624.1337f,   134.0357f,   0.8552105f },
    { -8938.404f,    511.8854f,   169.5132f,   0.4712385f },
    { -8815.946f,    571.0833f,   156.8412f,   0.8552105f },
    { -8968.125f,    525.1285f,   170.6735f,   3.054327f },
    { -8887.63f,     582.0261f,   170.219f,    3.787367f },
    { -8962.538f,    541.4132f,   159.8063f,   0.6283169f },
    { -8854.854f,    503.4115f,   184.6336f,   3.630291f },
    { -8810.004f,    589.0504f,   140.2928f,   0.8552105f },
    { -8921.13f,     570.2153f,   176.4456f,   3.857183f },
    { -8957.076f,    538.8073f,   155.0997f,   0.5235979f },
    { -8954.139f,    507.5695f,   168.861f,    3.595379f },
    { -8817.174f,    577.4948f,   142.5639f,   0.8552105f },
    { -8808.778f,    582.6389f,   148.5705f,   0.8552105f },
    { -8898.136f,    566.4236f,   176.5282f,   6.0912f },
    { -8877.205f,    598.0347f,   154.5646f,   0.1396245f },
    { -8815.911f,    460.2049f,   169.4585f,   3.926996f },
    { -8836.877f,    574.1649f,   158.0506f,   0.8552105f },
    { -8883.005f,    590.1927f,   147.0154f,   0.9773831f },
    { -8942.71f,     561.3316f,   188.328f,    3.630291f },
    { -8949.616f,    617.007f,    187.4469f,   3.630291f },
    { -8939.357f,    507.9288f,   145.7625f,   0.6457717f },
    { -8976.667f,    558.6233f,   160.7597f,   5.550147f },
    { -8871.924f,    609.7327f,   141.6364f,   0.8552105f },
    { -8829.264f,    551.5052f,   127.5144f,   0.8552105f },
    { -8859.802f,    567.184f,    152.9909f,   3.47321f },
    { -8864.504f,    604.0816f,   134.7161f,   0.8552105f },
    { -8854.042f,    616.0121f,   136.4188f,   0.8552105f },
    { -8839.778f,    576.8004f,   153.2873f,   0.8552105f },
    { -8863.049f,    497.7986f,   169.2041f,   3.926996f },
    { -8951.743f,    611.4948f,   175.3027f,   3.630291f },
    { -8976.063f,    535.0504f,   168.1283f,   4.66003f },
    { -8937.466f,    517.0521f,   160.561f,    3.68265f },
    { -8940.363f,    490.4288f,   170.8207f,   3.996807f },
    { -8838.177f,    541.6476f,   158.6789f,   0.8552105f },
    { -8825.467f,    450.7708f,   186.6236f,   3.630291f },
    { -8878.851f,    583.1771f,   155.5726f,   3.700105f },
    { -8822.146f,    557.2292f,   137.8244f,   0.8552105f },
    { -8953.243f,    523.8958f,   148.0031f,   3.630291f },
    { -8983.514f,    659.493f,    188.6248f,   3.630291f },
    { -8939.941f,    499.6163f,   148.6714f,   3.944446f },
    { -8925.567f,    542.2158f,   116.1619f,   6.0912f },
    { -8964.125f,    634.6736f,   172.0301f,   0.6283169f },
    { -8930.696f,    491.8021f,   175.6471f,   3.944446f },
    { -8882.172f,    574.4219f,   155.4764f,   6.0912f },
    { -8943.316f,    516.0191f,   145.9438f,   5.846854f },
    { -8871.973f,    589.2795f,   149.1132f,   0.4712385f },
    { -8883.328f,    579.6736f,   162.1912f,   0.6283169f },
    { -8961.998f,    640.1858f,   178.2798f,   0.6283169f },
    { -8912.467f,    506.625f,    165.9382f,   5.846854f },
    { -8843.524f,    481.7865f,   169.664f,    0.9250238f },
    { -8964.986f,    535.2136f,   153.4313f,   4.886924f },
    { -8833.341f,    484.1042f,   182.8578f,   0.6283169f },
    { -8861.382f,    574.7413f,   152.1575f,   3.47321f },
    { -8973.627f,    631.7726f,   182.3904f,   0.6283169f },
    { -8878.851f,    583.1771f,   156.149f,    3.700105f },
    { -8902.143f,    527.5035f,   177.1883f,   3.630291f },
    { -8956.248f,    514.2257f,   151.3226f,   3.630291f },
    { -8835.826f,    488.0764f,   169.2099f,   0.9250238f },
    { -8961.319f,    533.3333f,   152.5372f,   3.961899f },
    { -8947.649f,    516.0955f,   153.2207f,   3.68265f },
    { -8949.186f,    504.1337f,   170.9165f,   3.804818f },
    { -8945.564f,    511.5156f,   154.3801f,   5.899214f },
    { -8969.266f,    543.882f,    170.4686f,   4.66003f },
    { -8874.156f,    586.6302f,   151.5547f,   0.9773831f },
    { -8919.748f,    552.2986f,   166.0453f,   3.996807f },
    { -8971.5f,      637.2847f,   187.926f,    0.6283169f },
    { -8965.389f,    525.8906f,   160.2664f,   2.199115f },
    { -8885.1768f,   584.675781f, 141.623886f, 0.62527f },
    { -8880.427734f, 576.678406f, 141.62886f,  0.69819f },
    { -8873.7005f,   570.2418f,   139.33889f,  0.762973f },
    { -8888.692383f, 571.265015f, 120.36886f,  0.601966f },
    { -8870.9571f,   575.9952f,   120.811226f, 0.880780f },
    { -8875.3905f,   582.87028f,  120.81226f,  0.76898f },
    { -8887.0238f,   594.304871f, 120.81226f,  0.700139f },
    { -8887.0238f,   594.3041f,   132.571243f, 5.30658f },
    { -8874.3430f,   584.368164f, 131.409271f, 5.428242f },
    { -8856.23049f,  573.789795f, 131.861237f, 5.707060f },
    { -8881.462891f, 592.391418f, 110.883751f, 0.464518f },
    { -8871.443359f, 582.234802f, 109.030724f, 0.562685f },
    { -8884.809570f, 576.020081f, 110.489868f, 0.621592f },
    { -8871.830078f, 585.984314f, 110.492371f, 0.696206f },
    { -8871.830078f, 585.984314f, 119.252373f, 0.700133f },
    { -8875.578125f, 563.403931f, 114.059372f, 4.521095f },
    { -8896.128906f, 584.406311f, 117.437462f, 2.922810f },
    { -8873.742188f, 599.873718f, 117.512787f, 3.001356f },
    { -8885.817383f, 586.529175f, 118.614265f,  0.437024f },
    { -8872.734375f, 573.338440f, 117.723770f,  1.831103f },
    { -8913.418945f, 567.573669f, 146.223907f, 1.453024f },
    { -8894.599609f, 556.861877f, 145.843689f, 2.113046f },
    { -8900.843751f, 563.691650f, 152.798584f, 5.223581f }
};

static const std::vector<Location> OrgrimmarPos =
{
    { 1609.075f,    -4383.707f,     80.23414f,  0.3665176f },
    { 1469.648f,    -4371.285f,    103.8313f,   6.073746f },
    { 1391.792f,    -4371.f,       135.0406f,   3.630291f },
    { 1405.918f,    -4504.896f,    113.1683f,   3.700105f },
    { 1610.016f,    -4386.493f,    82.81187f,   3.909541f },
    { 1523.767f,    -4385.934f,    90.7948f,   4.572764f },
    { 1486.345f,    -4493.087f,    136.1718f,   0.1396245f },
    { 1606.724f,    -4414.668f,    111.4687f,   5.550147f },
    { 1647.043f,    -4402.644f,    111.7353f,   1.570796f },
    { 1573.078f,    -4426.342f,    94.5087f,   5.550147f },
    { 1600.927f,    -4367.731f,     87.9886f,   3.874631f },
    { 1558.359f,    -4368.33f,     110.0258f,   4.363324f },
    { 1377.49f,     -4298.74f,     136.4911f,   5.846854f },
    { 1395.439f,    -4403.583f,    150.1769f,   3.68265f },
    { 1394.175f,    -4390.438f,    146.5045f,   5.550147f },
    { 1389.752f,    -4352.681f,    130.5359f,   3.228859f },
    { 1471.724f,    -4393.083f,    129.966f,    3.159062f },
    { 1586.208f,    -4334.78f,     94.248f,    2.617989f },
    { 1590.582f,    -4338.588f,    100.6812f,   0.2094394f },
    { 1601.163f,    -4367.491f,    95.1535f,   0.5410506f },
    { 1493.476f,    -4448.524f,    132.9773f,   3.630291f },
    { 1481.592f,    -4421.177f,    146.4658f,   0.1396245f },
    { 1382.604f,    -4319.927f,    133.5185f,   3.298687f },
    { 1647.483f,    -4404.724f,    103.3714f,   2.617989f },
    { 1567.398f,    -4423.649f,    98.9948f,   4.206246f },
    { 1560.326f,    -4372.816f,    102.5343f,   6.19592f },
    { 1521.741f,    -4390.443f,    93.8611f,   5.550147f },
    { 1479.924f,    -4424.903f,    146.0753f,   3.054327f },
    { 1387.427f,    -4334.854f,    140.2641f,   0.9773831f },
    { 1481.771f,    -4466.378f,    128.0009f,   3.47321f },
    { 1390.512f,    -4372.778f,    144.748f,    3.071766f },
    { 1605.115f,    -4411.217f,    102.0536f,   0.06981169f },
    { 1466.144f,    -4341.917f,    130.5263f,   2.548179f },
    { 1479.922f,    -4467.948f,    119.9536f,   3.33359f },
    { 1397.09f,     -4405.764f,    139.5936f,   2.199115f },
    { 1404.153f,    -4497.729f,    111.3236f,   6.0912f },
    { 1493.337f,    -4441.268f,    127.3894f,   3.211419f },
    { 1469.385f,    -4340.427f,    140.2859f,   2.548179f },
    { 1385.043f,    -4317.056f,    135.6198f,   3.194002f },
    { 1472.734f,    -4398.983f,    125.9285f,   3.47321f },
    { 1469.135f,    -4380.587f,    107.5022f,   0.1396245f },
    { 1389.047f,    -4339.42f,     140.2229f,   4.76475f },
    { 1476.245f,    -4420.931f,    149.4286f,   3.630291f },
    { 1479.87f,     -4421.628f,    151.0234f,   3.054327f },
    { 1391.415f,    -4370.76f,     151.9061f,   3.089183f },
    { 1394.175f,    -4385.715f,    143.2316f,   5.899214f },
    { 1396.132f,    -4411.295f,    151.1071f,   4.66003f },
    { 1403.262f,    -4474.733f,    103.9363f,   4.886924f },
    { 1488.257f,    -4491.f,       120.442f,    0.03490625f },
    { 1467.707f,    -4361.327f,    105.1312f,   3.700105f },
    { 1375.649f,    -4366.401f,    132.1661f,   0.1745321f },
    { 1389.922f,    -4375.253f,    77.87833f,   6.0912f },
    { 1392.398f,    -4379.628f,    152.5377f,   2.199115f },
    { 1394.943f,    -4388.257f,    156.3171f,   3.246347f },
    { 1481.833f,    -4466.399f,    140.8109f,   3.630291f },
    { 1469.816f,    -4366.597f,    115.6296f,   3.159062f },
    { 1379.802f,    -4309.967f,    136.3039f,   2.984498f },
    { 1388.002f,    -4353.233f,    138.1396f,   5.899214f },
    { 1378.589f,    -4296.118f,    134.691f,    5.846854f },
    { 1470.207f,    -4395.868f,    123.8257f,   6.073746f },
    { 1406.467f,    -4511.327f,    113.2332f,   0.1396245f },
    { 1395.04f,     -4390.569f,    147.5848f,   3.228859f },
    { 1480.908f,    -4422.219f,    144.6776f,   3.194002f },
    { 1486.033f,    -4493.719f,    134.937f,    3.47321f },
    { 1403.845f,    -4488.743f,    124.8069f,   3.700105f },
    { 1494.733f,    -4446.885f,    130.0633f,   6.248279f },
    { 1481.875f,    -4428.431f,    151.3601f,   3.316144f },
    { 1384.299f,    -4332.253f,    136.5117f,   3.194002f },
    { 1468.939f,    -4346.42f,     133.6888f,   3.054327f },
    { 1393.356f,    -4478.347f,    125.5958f,   6.0912f },
    { 1384.672f,    -4449.229f,    136.3165f,   4.886924f },
    { 1486.5393f,   -4372.5333f,   107.014f,    5.951700f },
    { 1489.1738f,   -4415.65091f,  100.5526f,   1.309994f },
    { 1501.63171f,  -4454.74668f,  97.716637f, 0.387151f },
    { 1518.3159f,   -4438.94873f,   72.9114f,   1.891189f },
    { 1511.754272f, -4423.58203f,   65.781662f, 6.1763f },
    { 1508.1212f,   -4399.4312f,    65.781662f, 3.575869f },
    { 1515.1198f,   -4356.886719f,  71.859f,    5.87775f },
    { 1553.78795f,  -4387.95084f,   62.565178f, 1.372812f },
    { 1549.74023f,  -4413.03227f,   64.2219f,   0.42641f },
    { 1528.63644f,  -4408.71850f,  98.7224f,   0.23985f },
    { 1532.7171f,   -4399.64944f,   50.62704f,  0.13188f },
    { 1509.3391f,   -4422.2905f,    55.24475f,  0.1554f },
    { 1501.4160f,   -4413.1782f,    52.63250f,  0.347852f },
    { 1499.258179f, -4395.1628f,    62.230198f, 6.02282f },
    { 1485.33571f,  -4397.560547f,  61.07567f,  3.2190f },
    { 1495.2693f,   -4417.2910f,    60.232471f, 3.31666f },
    { 1498.65912f,  -4439.20613f,   59.07176f,  3.7643f },
    { 1523.45699f,  -4393.04395f,   49.775066f, 3.71542f },
    { 1536.62665f,  -4419.85963f,   50.4508f,   3.46193f },
    { 1497.2632f,   -4401.54637f,   33.805511f, 2.60181f },
    { 1497.9363f,   -4437.58008f,   32.326393f, 4.96205f },
    { 1493.26253f,  -4402.19919f,   69.147816f, 2.2917f }
};

static const std::vector<Location> IronforgePos =
{
    { -5196.038f, -858.4618f, 525.0447f, 6.073746f },
    { -5195.734f, -887.6441f, 534.168f,  3.68265f },
    { -5195.063f, -762.2795f, 510.0929f, 4.66003f },
    { -5164.59f,  -858.3264f, 540.0117f, 5.899214f },
    { -5130.776f, -791.1945f, 523.2938f, 5.846854f },
    { -5127.663f, -827.1771f, 534.2573f, 4.76475f },
    { -5227.184f, -754.8802f, 500.0329f, 5.550147f },
    { -5197.655f, -857.8889f, 525.5248f, 2.199115f },
    { -5227.705f, -859.0052f, 513.9084f, 6.0912f },
    { -5227.f,    -821.7795f, 471.7424f, 3.700105f },
    { -5131.42f,  -791.9445f, 537.8198f, 3.054327f },
    { -5223.59f,  -889.6302f, 509.3725f, 4.886924f },
    { -5164.124f, -825.3795f, 525.2161f, 0.9773831f },
    { -5196.168f, -826.6163f, 517.4463f, 2.111848f },
    { -5227.393f, -757.1059f, 501.0704f, 3.47321f },
    { -5192.556f, -784.4583f, 506.9716f, 4.729844f },
    { -5227.965f, -792.184f,  509.1933f, 0.1396245f },
    { -5182.054f, -782.283f,  514.0707f, 4.886924f },
    { -5152.384f, -819.2031f, 508.2252f, 0.9773831f },
    { -5220.162f, -722.941f,  501.573f,  3.700105f },
    { -5218.438f, -879.0486f, 534.1289f, 2.111848f },
    { -5186.096f, -846.5903f, 526.4001f, 3.054327f },
    { -5182.972f, -816.2309f, 522.7172f, 5.550147f },
    { -5172.745f, -854.6077f, 541.5695f, 2.548179f },
    { -5126.936f, -816.5712f, 506.1032f, 4.76475f },
    { -5214.637f, -850.4496f, 524.1501f, 4.729844f },
    { -5156.693f, -818.3021f, 532.9488f, 4.66003f },
    { -5188.997f, -876.8524f, 544.1463f, 6.073746f },
    { -5216.222f, -817.3351f, 498.4872f, 3.630291f },
    { -5190.08f,  -758.6545f, 507.9708f, 6.0912f },
    { -5156.724f, -844.0851f, 529.4639f, 5.899214f },
    { -5215.002f, -754.8802f, 488.5055f, 0.1396245f },
    { -5137.646f, -787.2882f, 502.1171f, 5.846854f },
    { -5183.194f, -817.217f,  508.4071f, 3.68265f },
    { -5183.191f, -848.6163f, 518.0361f, 2.199115f },
    { -5215.972f, -785.0452f, 494.1193f, 3.47321f },
    { -5117.396f, -791.4796f, 483.5854f, 6.0912f },
    { -5153.132f, -781.2309f, 539.7031f, 5.899214f },
    { -5209.993f, -710.1337f, 501.9293f, 5.846854f },
    { -5172.809f, -848.1094f, 520.4458f, 6.0912f },
    { -5120.552f, -812.3004f, 547.9608f, 3.68265f },
    { -5142.92f,  -811.507f,  526.748f,  4.886924f },
    { -5208.391f, -773.4583f, 497.451f,  4.729844f },
    { -5181.903f, -779.1979f, 518.5895f, 0.9773831f },
    { -5208.097f, -843.934f, 514.2054f,  3.47321f },
    { -5118.309f, -783.3246f, 545.3275f, 2.199115f },
    { -5213.969f, -715.6684f, 493.5344f, 6.073746f },
    { -5211.384f, -872.493f,  523.3142f, 0.1396245f },
    { -5215.563f, -812.7205f, 501.1313f, 2.548179f },
    { -5159.971f, -819.0695f, 523.9502f, 5.550147f },
    { -5243.21f,  -741.7934f, 479.6208f, 2.111848f },
    { -5158.577f, -784.243f,  515.7791f, 3.054327f },
    { -5210.179f, -809.2413f, 507.136f,  3.630291f },
    { -5182.26f,  -818.6476f, 519.5022f, 4.66003f },
    { -5178.493f, -870.8143f, 539.2921f, 3.700105f },
    { -5206.622f, -741.5938f, 511.1593f, 4.76475f },
    { -5194.976f, -759.9896f, 517.6288f, 3.630291f }
};

static const std::vector<Location> ThunderBluffPos =
{
    { -1234.804f, -19.72239f, 206.5436f, 0.1396245f },
    { -1244.442f, -35.88308f, 206.82f,   4.729844f },
    { -1239.212f, -11.25857f, 208.6352f, 3.700105f },
    { -1217.165f, -15.58898f, 207.4553f, 3.68265f },
    { -1229.332f,  -6.54617f, 208.2537f, 2.548179f },
    { -1227.353f, -14.30225f, 206.6192f, 3.054327f },
    { -1234.8f,   -14.12402f, 208.0964f, 6.0912f },
    { -1246.791f, -38.59223f, 206.846f,  6.073746f },
    { -1229.818f, -6.788249f, 209.4552f, 4.886924f },
    { -1223.867f, -10.67551f, 205.7558f, 0.9773831f },
    { -1229.833f, -6.403429f, 208.6842f, 4.76475f },
    { -1239.199f, -23.20622f, 207.0188f, 3.47321f },
    { -1246.258f, -37.36089f, 208.2598f, 2.199115f },
    { -1223.363f, -12.2462f,  201.3805f, 4.66003f },
    { -1218.116f, -16.37305f, 199.9185f, 5.550147f },
    { -1239.709f, -42.34294f, 204.2466f, 2.111848f },
    { -1219.295f, -12.87424f, 206.2387f, 5.899214f },
    { -1251.241f, -33.18164f, 209.7986f, 3.630291f },
    { -1219.549f, -12.32769f, 207.9862f, 3.47321f },
    { -1251.181f, -34.52919f, 206.8795f, 4.66003f },
    { -1235.567f, -15.02116f, 205.3759f, 2.199115f },
    { -1241.148f, -41.8049f,  205.8436f, 0.1396245f },
    { -1241.41f,  -23.09136f, 206.5933f, 3.054327f },
    { -1235.885f, -19.49116f, 206.4422f, 3.68265f },
    { -1234.823f, -13.99685f, 210.1406f, 6.073746f },
    { -1220.117f, -10.93815f, 204.8297f, 4.76475f },
    { -1219.087f, -6.230252f, 206.5717f, 5.899214f },
    { -1235.053f, -20.39225f, 206.5732f, 3.630291f },
    { -1239.364f, -22.23714f, 207.2047f, 4.886924f },
    { -1245.448f, -37.35639f, 208.0733f, 3.700105f },
    { -1222.941f, -10.68441f, 208.3044f, 0.9773831f },
    { -1238.765f, -11.7156f,  203.8905f, 2.111848f },
    { -1251.638f, -34.5931f,  207.4821f, 6.0912f },
    { -1229.332f,  -6.54617f, 205.5314f, 4.729844f },
    { -1245.196f, -37.02111f, 208.2277f, 5.550147f },
    { -1235.227f, -19.88525f, 206.9543f, 2.548179f },
    { -1249.993f, -35.97727f, 206.9852f, 5.846854f },
    { -1238.741f, -11.55127f, 216.4102f, 4.76475f },
    { -1242.702f, -23.95698f, 215.8784f, 2.199115f },
    { -1223.998f, -11.75629f, 187.3124f, 6.0912f },
    { -1220.138f, -16.90701f, 218.7182f, 2.111848f },
    { -1239.351f, -23.36654f, 218.1057f, 5.550147f },
    { -1222.544f, -11.58713f, 218.9956f, 3.630291f },
    { -1234.379f, -19.82167f, 211.3573f, 5.899214f },
    { -1224.649f, -16.73172f, 217.2839f, 6.073746f },
    { -1219.856f, -11.69358f, 218.5711f, 0.1396245f },
    { -1223.967f, -8.415148f, 219.2347f, 3.47321f },
    { -1252.266f, -33.21897f, 215.823f,  3.68265f },
    { -1244.304f, -41.49599f, 214.7235f, 3.700105f },
    { -1245.102f, -34.69542f, 215.4592f, 4.886924f },
    { -1239.761f, -41.99474f, 211.7772f, 6.0912f },
    { -1219.803f, -11.18414f, 219.6471f, 4.729844f },
    { -1219.832f, -12.19803f, 219.4899f, 5.846854f },
    { -1236.825f, -18.4617f,  220.2076f, 4.66003f },
    { -1239.635f, -11.55973f, 220.694f,  2.548179f },
    { -1233.765f, -15.5765f,  216.1068f, 3.054327f },
    { -1233.56f,  -15.80257f, 215.6199f, 0.9773831f },
    { -1240.617f, -41.39486f, 205.0362f, 5.846854f }
};

static const std::vector<Location> UndercityPos =
{
    { 1850.231f, 257.0156f, 124.1743f, 4.729844f },
    { 1863.302f, 193.9063f, 114.5829f, 0.9773831f },
    { 1851.997f, 212.7726f, 127.959f,  5.550147f },
    { 1862.474f, 288.1528f, 118.4504f, 6.0912f },
    { 1851.906f, 267.6267f, 131.5442f, 3.054327f },
    { 1868.905f, 323.2587f, 131.801f,  0.1396245f },
    { 1849.677f, 196.5052f, 119.4152f, 2.548179f },
    { 1870.382f, 155.8438f, 135.8888f, 5.846854f },
    { 1863.309f, 211.9219f, 117.2065f, 5.899214f },
    { 1849.877f, 215.7413f, 120.1931f, 6.073746f },
    { 1864.762f, 170.5399f, 108.2692f, 4.76475f },
    { 1839.986f, 288.4306f, 126.1348f, 3.47321f },
    { 1875.91f,  230.566f,  125.1612f, 2.199115f },
    { 1854.146f, 238.7622f, 131.7162f, 4.66003f },
    { 1863.307f, 264.4583f, 123.374f,  4.886924f },
    { 1871.578f, 266.8681f, 108.0443f, 4.66003f },
    { 1836.901f, 185.5868f, 113.362f,  3.630291f },
    { 1871.545f, 191.2622f, 105.8294f, 6.073746f },
    { 1863.307f, 211.816f,  114.3906f, 4.76475f },
    { 1841.543f, 205.1754f, 102.9691f, 3.47321f },
    { 1843.304f, 273.4757f, 104.6566f, 6.0912f },
    { 1870.818f, 167.0938f, 126.3066f, 4.729844f },
    { 1840.653f, 227.6319f, 106.8095f, 0.1396245f },
    { 1863.299f, 282.1806f, 110.9902f, 2.199115f },
    { 1875.688f, 230.5278f, 112.7081f, 3.054327f },
    { 1872.264f, 311.1458f, 119.7756f, 3.68265f },
    { 1871.248f, 297.1684f, 113.6078f, 5.550147f },
    { 1863.293f, 186.4896f, 114.6143f, 5.846854f },
    { 1838.384f, 252.3264f, 103.8479f, 3.700105f },
    { 1886.804f, 166.3976f, 125.2679f, 2.111848f },
    { 1863.363f, 237.5417f, 125.3641f, 0.9773831f },
    { 1863.307f, 267.875f,  113.7794f, 5.899214f },
    { 1845.602f, 299.4445f, 120.9578f, 4.886924f },
    { 1871.884f, 217.2656f, 108.2966f, 2.548179f },
    { 1867.459f, 240.2357f, 106.0639f, 6.0912f },
    { 1863.326f, 298.4879f, 121.1103f, 3.054327f },
    { 1844.776f, 287.776f,  131.6692f, 4.76475f },
    { 1842.595f, 299.8854f, 132.9048f, 5.846854f },
    { 1843.754f, 233.0833f, 122.607f,  3.68265f },
    { 1865.563f, 238.7674f, 127.128f,  5.550147f },
    { 1863.302f, 282.6076f, 117.6718f, 2.548179f },
    { 1850.063f, 218.7344f, 116.5234f, 4.886924f },
    { 1852.528f, 257.8333f, 125.5587f, 5.899214f },
    { 1870.385f, 321.809f,  123.7424f, 4.66003f },
    { 1864.694f, 167.474f,  111.3632f, 0.1396245f },
    { 1846.231f, 194.2656f, 108.0038f, 3.700105f },
    { 1876.434f, 227.1129f, 116.7266f, 4.729844f },
    { 1839.993f, 245.0399f, 120.8441f, 2.199115f },
    { 1864.042f, 204.4774f, 105.6403f, 3.630291f },
    { 1875.594f, 246.9271f, 110.0379f, 2.111848f },
    { 1850.892f, 273.6059f, 133.6044f, 0.9773831f },
    { 1863.3f,   186.2188f, 118.3104f, 3.47321f },
    { 1851.578f, 203.2604f, 118.5638f, 6.0912f },
    { 1863.307f, 259.8038f, 116.5421f, 6.073746f },
    { 1877.592f, 247.3872f, 128.022f,  3.68265f },
    { 1850.288f, 267.309f,  125.0537f, 3.630291f }
};

static const std::vector<Location> DarnassusPos =
{
    { 8578.888f, 975.2604f, 42.48742f, 5.846854f },
    { 8574.236f, 944.2083f, 44.71943f, 4.76475f },
    { 8517.067f, 986.0851f, 66.32562f, 4.729844f },
    { 8553.734f, 780.0504f, 63.21661f, 4.886924f },
    { 8537.763f, 877.8924f, 76.7791f,  3.054327f },
    { 8572.691f, 814.7379f, 72.4253f,  3.68265f },
    { 8572.691f, 814.7379f, 72.4253f,  3.68265f },
    { 8494.191f, 943.868f,  59.0681f,  6.073746f },
    { 8536.576f, 873.7222f, 45.29478f, 0.1396245f },
    { 8550.191f, 850.7222f, 57.6362f,  3.700105f },
    { 8554.281f, 875.8316f, 48.10747f, 5.550147f },
    { 8590.731f, 846.9427f, 56.89664f, 2.199115f },
    { 8519.5f,   949.7708f, 63.29575f, 3.630291f },
    { 8508.24f,  838.3646f, 77.00415f, 4.66003f },
    { 8588.622f, 912.0434f, 49.60857f, 0.9773831f },
    { 8538.786f, 820.7361f, 67.0003f,  6.0912f },
    { 8488.077f, 983.2379f, 59.87747f, 2.111848f },
    { 8494.68f,  911.783f,  72.29862f, 2.548179f },
    { 8556.297f, 920.9479f, 42.13089f, 3.47321f },
    { 8571.629f, 880.1511f, 53.78056f, 5.899214f },
    { 8544.278f, 885.059f,  70.3073f,  0.1396245f },
    { 8551.224f, 947.6059f, 60.74737f, 6.0912f },
    { 8586.716f, 913.4774f, 42.5911f,  4.76475f },
    { 8617.442f, 917.658f,  41.92455f, 4.886924f },
    { 8519.375f, 917.842f,  74.22758f, 2.111848f },
    { 8550.322f, 910.9809f, 52.84513f, 3.700105f },
    { 8582.255f, 848.0608f, 53.87154f, 5.899214f },
    { 8547.279f, 964.1684f, 45.09663f, 5.550147f },
    { 8581.158f, 881.2344f, 54.83494f, 0.9773831f },
    { 8550.932f, 817.2396f, 60.80384f, 3.630291f },
    { 8550.214f, 787.1684f, 66.42948f, 4.729844f },
    { 8583.88f,  948.4114f, 41.32378f, 5.846854f },
    { 8550.997f, 848.8594f, 70.56313f, 3.47321f },
    { 8517.45f,  879.5555f, 83.80603f, 6.073746f },
    { 8558.55f,  838.934f,  56.89937f, 4.66003f },
    { 8617.526f, 851.5955f, 37.39491f, 3.68265f },
    { 8579.229f, 911.8906f, 44.37334f, 3.054327f },
    { 8581.771f, 817.0295f, 30.07061f, 2.199115f },
    { 8514.054f, 848.6059f, 59.20383f, 2.548179f },
    { 8570.65f,  885.1719f, 59.11485f, 2.548179f },
    { 8576.803f, 814.3611f, 50.15007f, 4.66003f },
    { 8697.891f, 991.0841f, 39.18531f, 6.0912f },
    { 8547.403f, 974.4879f, 63.7893f,  5.846854f },
    { 8553.929f, 853.6476f, 84.47609f, 0.1396245f },
    { 8507.603f, 878.8854f, 70.23988f, 5.899214f },
    { 8570.95f,  854.1406f, 65.7302f,  3.054327f },
    { 8560.618f, 777.342f,  79.87446f, 4.886924f },
    { 8542.07f,  852.0174f, 64.99033f, 3.700105f },
    { 8514.364f, 940.0868f, 64.65899f, 4.76475f },
    { 8526.2f,   848.8542f, 63.1242f,  2.199115f },
    { 8571.85f,  913.1511f, 43.11662f, 6.073746f },
    { 8591.914f, 901.6493f, 26.83536f, 5.550147f },
    { 8539.892f, 914.3368f, 45.99331f, 3.630291f },
    { 8578.143f, 948.3264f, 62.56763f, 2.111848f },
    { 8539.493f, 887.2274f, 79.56437f, 3.47321f },
    { 8538.561f, 951.6632f, 69.08958f, 4.729844f },
    { 8523.006f, 907.7413f, 72.85262f, 0.9773831f },
    { 8520.907f, 813.0208f, 81.70242f, 3.68265f },
    { 8554.825f, 813.0746f, 78.88226f, 6.0912f }
};

struct FireworkLocations
{
    uint32 m_zoneId;
    std::vector<Location> m_pPositions;
};

const std::array<FireworkLocations, 7> FireworkLoc 
{{

    { STRANGLETHORN_VALE, BootyBayPos },
    { ORGRIMMAR, OrgrimmarPos },
    { UNDERCITY, UndercityPos },
    { TELDRASSIL, DarnassusPos },
    { THUNDERBLUFF, ThunderBluffPos },
    { DUN_MOROGH, IronforgePos },
    { STORMWIND, StormwindPos }
}};

struct npc_event_fireworksAI : public ScriptedAI
{
    npc_event_fireworksAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool m_bExist;
    uint8 m_uiCounter;
    uint8 m_uiIndex;
    uint32 m_uiFireworksTimer;

    uint32 GetTimeUntilNextShow()
    {
        time_t theTime = time(NULL);
        struct tm *aTime = localtime(&theTime);
        int min = aTime->tm_min;
        int hour = aTime->tm_hour;
        return ((hour > 6) && (hour < 18)) ? ((18 - hour) * HOUR * IN_MILLISECONDS - min * MINUTE * IN_MILLISECONDS) : (min > 0) ? ((MINUTE - min) * MINUTE * IN_MILLISECONDS + 1) : 1000;
    }

    void IsUsable()
    {
        for (auto i = 0; i < FireworkLoc.size(); ++i)
        {
            if (FireworkLoc[i].m_zoneId == m_creature->GetZoneId())
            {
                m_bExist = true;
                m_uiIndex = static_cast<uint8>(i);
                break;
            }
        }
    }

    void Reset()
    {
        m_bExist = false;
        m_uiIndex = 0;
        m_uiCounter = 0;
        m_uiFireworksTimer = GetTimeUntilNextShow();
        IsUsable();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_bExist)
            return;

        if (m_uiFireworksTimer <= uiDiff)
        {
            if (m_uiCounter < 90)
            {
                uint8 i = 0;
                uint8 max = urand(1, 3);
                Location currentPosition;

                while (i < max)
                {
                    i++;
                    currentPosition = FireworkLoc[m_uiIndex].m_pPositions[urand(0, FireworkLoc[m_uiIndex].m_pPositions.size()-1)];

                    if (urand(0,4))
                        m_creature->SummonCreature(Fireworks[urand(6, 11)].m_uiNpcEntry, currentPosition.x, currentPosition.y, currentPosition.z, currentPosition.o, TEMPSUMMON_TIMED_DESPAWN, 10000, true);
                    else
                        m_creature->SummonCreature(Fireworks[urand(12, 17)].m_uiNpcEntry, currentPosition.x, currentPosition.y, currentPosition.z, currentPosition.o, TEMPSUMMON_TIMED_DESPAWN, 10000, true);
                }

                m_uiFireworksTimer = urand(1, 2)*IN_MILLISECONDS;
                m_uiCounter++;
            }
            else
            {
                m_uiCounter = 0;
                m_uiFireworksTimer = GetTimeUntilNextShow();
            }
        }
        else
            m_uiFireworksTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_event_fireworks(Creature* pCreature)
{
    return new npc_event_fireworksAI(pCreature);
}

enum
{
    EVENT_VALENTINE_KWEE = 140,

    SPELL_SMITTEN = 27572,
    QUEST_GIFT_H = 8981,
    QUEST_GIFT_A = 8993,

    VAR_KWEE_THRALL = 2200,
    VAR_KWEE_CAIRNE = 2201,
    VAR_KWEE_SYLVANAS = 2202,
    VAR_KWEE_HORDE = 2207,

    VAR_KWEE_BOLVAR = 2203,
    VAR_KWEE_MAGNI = 2204,
    VAR_KWEE_TYRANDE = 2205,
    VAR_KWEE_ALLIANCE = 2206,

    TEXT_ID_VICTORY_A = 8315,
    TEXT_ID_VICTORY_H = 8316,
    TEXT_ID_TIE = 8318,

};

const uint32 CityZones[6] =
{
    1637, // Orgrimmar
    1638, // Thunder Bluff
    1497, // Undercity
    1519, // Stormwind
    1537, // Ironforge
    1657  // Darnassus
};

struct npc_kwee_peddlefeetAI : public ScriptedAI
{
    npc_kwee_peddlefeetAI(Creature* pCreature) : ScriptedAI(pCreature), winningFaction(0), winningZone(0)
    {
        if (sGameEventMgr.CheckOneGameEvent(EVENT_VALENTINE_KWEE, time(nullptr)))
        {
            SetVariables();
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            if (m_creature->GetZoneId() != winningZone && winningZone != 0)
                m_creature->DespawnOrUnsummon();
        }
        Reset();
    }

    uint32 winningFaction;
    uint32 winningZone;

    void Reset() { }

    void SetVariables()
    {
        uint32 firstBoss = 0;
        uint32 horde = sObjectMgr.GetSavedVariable(VAR_KWEE_HORDE, 0);
        uint32 alliance = sObjectMgr.GetSavedVariable(VAR_KWEE_ALLIANCE, 0);

        if (horde > alliance)
        {
            winningFaction = VAR_KWEE_HORDE;
            firstBoss = VAR_KWEE_THRALL;
        }
        else if (alliance > horde)
        {
            winningFaction = VAR_KWEE_ALLIANCE;
            firstBoss = VAR_KWEE_BOLVAR;
        }

        if (firstBoss)
        {
            uint32 count = 0;
            for (uint32 i = firstBoss; i < firstBoss + 3; i++)
            {
                uint32 savedVar = sObjectMgr.GetSavedVariable(i, 0);
                if (savedVar > count)
                {
                    count = savedVar;
                    winningZone = CityZones[i - VAR_KWEE_THRALL];
                }
            }
        }
    }

    void ReceiveEmote(Player* pPlayer, uint32 uiEmote)
    {
        if (uiEmote == TEXTEMOTE_KISS)
        {
            if (pPlayer)
                m_creature->CastSpell(pPlayer, SPELL_SMITTEN, false);
        }
    }
};

CreatureAI* GetAI_npc_kwee_peddlefeet(Creature* pCreature)
{
    return new npc_kwee_peddlefeetAI(pCreature);
}

bool GossipHello_npc_kwee_peddlefeet(Player* pPlayer, Creature* pCreature)
{
    pPlayer->SendUpdateWorldState(VAR_KWEE_THRALL, sObjectMgr.GetSavedVariable(VAR_KWEE_THRALL, 0));
    pPlayer->SendUpdateWorldState(VAR_KWEE_CAIRNE, sObjectMgr.GetSavedVariable(VAR_KWEE_CAIRNE, 0));
    pPlayer->SendUpdateWorldState(VAR_KWEE_SYLVANAS, sObjectMgr.GetSavedVariable(VAR_KWEE_SYLVANAS, 0));
    pPlayer->SendUpdateWorldState(VAR_KWEE_HORDE, sObjectMgr.GetSavedVariable(VAR_KWEE_HORDE, 0));
    pPlayer->SendUpdateWorldState(VAR_KWEE_BOLVAR, sObjectMgr.GetSavedVariable(VAR_KWEE_BOLVAR, 0));
    pPlayer->SendUpdateWorldState(VAR_KWEE_MAGNI, sObjectMgr.GetSavedVariable(VAR_KWEE_MAGNI, 0));
    pPlayer->SendUpdateWorldState(VAR_KWEE_TYRANDE, sObjectMgr.GetSavedVariable(VAR_KWEE_TYRANDE, 0));
    pPlayer->SendUpdateWorldState(VAR_KWEE_ALLIANCE, sObjectMgr.GetSavedVariable(VAR_KWEE_ALLIANCE, 0));

    if (sGameEventMgr.IsActiveEvent(EVENT_VALENTINE_KWEE))
    {
        if (npc_kwee_peddlefeetAI* kweeAI = dynamic_cast<npc_kwee_peddlefeetAI*>(pCreature->AI()))
        {
            uint32 faction = kweeAI->winningFaction;
            uint32 textId = faction == VAR_KWEE_HORDE ? TEXT_ID_VICTORY_H : faction == VAR_KWEE_ALLIANCE ? TEXT_ID_VICTORY_A : TEXT_ID_TIE;
            pPlayer->PlayerTalkClass->SendGossipMenu(textId, pCreature->GetObjectGuid());
            return true;
        }
    }

    return false;
}

bool QuestRewarded_npc_kwee_peddlefeet(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() != QUEST_GIFT_A && pQuest->GetQuestId() != QUEST_GIFT_H)
        return true;

    uint32 bossVar = 0, factionVar = 0;
    for (uint32 i = VAR_KWEE_THRALL; i <= VAR_KWEE_TYRANDE; i++)
    {
        if (pCreature->GetZoneId() == CityZones[i - VAR_KWEE_THRALL])
        {
            bossVar = i;
            factionVar = i < VAR_KWEE_BOLVAR ? VAR_KWEE_HORDE : VAR_KWEE_ALLIANCE;
        }
    }

    if (bossVar)
    {
        uint32 count = sObjectMgr.GetSavedVariable(bossVar, 0);
        count += pQuest->ReqItemCount[0];
        sObjectMgr.SetSavedVariable(bossVar, count, true);
    }

    if (factionVar)
    {
        uint32 count = sObjectMgr.GetSavedVariable(factionVar, 0);
        count += pQuest->ReqItemCount[0];
        sObjectMgr.SetSavedVariable(factionVar, count, true);
    }

    return true;
}

enum
{
    OBJECT_DARK_IRON_MUG = 165578,
    SPELL_DARK_IRON_MUG = 14813,
    EMOTE_GUZZLE_ALE = 10167,
};

struct npc_oozeling_jubjubAI : public ScriptedPetAI
{
    npc_oozeling_jubjubAI(Creature* pCreature) : ScriptedPetAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiReturnTimer;
    void Reset()
    {
        m_uiReturnTimer = 0;
    }

    void SpellHit(Unit* pUnit, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_DARK_IRON_MUG)
            m_uiReturnTimer = 10000;
    }

    void MovementInform(uint32 type, uint32 id)
    {
        if (type == POINT_MOTION_TYPE && id == 1)
        {
            m_creature->MonsterTextEmote(EMOTE_GUZZLE_ALE);
            m_creature->addUnitState(UNIT_STAT_ROOT);
            m_uiReturnTimer = 3000;
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiReturnTimer > 0)
        {
            if (m_uiReturnTimer <= uiDiff)
            {
                m_uiReturnTimer = 0;
                m_creature->clearUnitState(UNIT_STAT_ROOT);

                if (GameObject* pMug = m_creature->FindNearestGameObject(OBJECT_DARK_IRON_MUG, 1.0f))
                {
                    pMug->SetLootState(GO_JUST_DEACTIVATED);
                    pMug->AddObjectToRemoveList();
                }
            }
            else
                m_uiReturnTimer -= uiDiff;
        }
        else
        {
            ScriptedPetAI::UpdateAI(uiDiff);
        }
    }
};

CreatureAI* GetAI_npc_oozeling_jubjub(Creature* pCreature)
{
    return new npc_oozeling_jubjubAI(pCreature);
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
    newscript->Name = "npc_tonk_mine";
    newscript->GetAI = &GetAI_npc_tonk_mine;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_tonk_mortar";
    newscript->GetAI = &GetAI_npc_tonk_mortar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_steam_tonk";
    newscript->GetAI = &GetAI_npc_steam_tonk;
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
    newscript->Name = "npc_emerald_dragon_whelp";
    newscript->GetAI = &GetAI_npc_emerald_dragon_whelp;
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

    newscript = new Script;
    newscript->Name = "npc_event_fireworks";
    newscript->GetAI = &GetAI_npc_event_fireworks;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_kwee_peddlefeet";
    newscript->GetAI = &GetAI_npc_kwee_peddlefeet;
    newscript->pGossipHello = &GossipHello_npc_kwee_peddlefeet;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_kwee_peddlefeet;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_oozeling_jubjub";
    newscript->GetAI = &GetAI_npc_oozeling_jubjub;
    newscript->RegisterSelf();
}
