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
#include "CritterAI.h"
#include <array>
#include "Utilities/EventMap.h"

/* ContentData
npc_chicken_cluck       100%    support for quest 3861 (Cluck!)
npc_injured_patient     100%    patients for triage-quests (6622 and 6624)
npc_doctor              100%    Gustaf Vanhowzen and Gregory Victor, quest 6622 and 6624 (Triage)
npc_mount_vendor        100%    Regular mount vendors all over the world. Display gossip if player doesn't meet the requirements to buy
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

struct npc_chicken_cluckAI : public CritterAI
{
    npc_chicken_cluckAI(Creature* pCreature) : CritterAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiResetFlagTimer;

    void JustRespawned() override
    {
        Reset();
        CritterAI::JustRespawned();
    }

    void OnCombatStop() override
    {
        Reset();
        CritterAI::OnCombatStop();
    }

    void Reset()
    {
        m_uiResetFlagTimer = 120000;

        m_creature->SetFactionTemplateId(FACTION_CHICKEN);
        m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
    }

    void ReceiveEmote(Player* pPlayer, uint32 uiEmote) override
    {
        if (uiEmote == TEXTEMOTE_CHICKEN)
        {
            if (!urand(0, 29))
            {
                if (pPlayer->GetQuestStatus(QUEST_CLUCK) == QUEST_STATUS_NONE)
                {
                    m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                    m_creature->SetFactionTemplateId(FACTION_FRIENDLY);

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
                m_creature->SetFactionTemplateId(FACTION_FRIENDLY);
                DoScriptText(EMOTE_CLUCK_TEXT2, m_creature);
            }
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        // Reset flags after a certain time has passed so that the next player has to start the 'event' again
        if (m_creature->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER))
        {
            if (m_uiResetFlagTimer < uiDiff)
                EnterEvadeMode();
            else
                m_uiResetFlagTimer -= uiDiff;
        }

        CritterAI::UpdateAI(uiDiff);
    }
};

CreatureAI* GetAI_npc_chicken_cluck(Creature* pCreature)
{
    return new npc_chicken_cluckAI(pCreature);
}

bool QuestAccept_npc_chicken_cluck(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_CLUCK)
    {
        if (npc_chicken_cluckAI* pChickenAI = dynamic_cast<npc_chicken_cluckAI*>(pCreature->AI()))
            pChickenAI->Reset();
    }

    return true;
}

bool QuestComplete_npc_chicken_cluck(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
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

static std::vector<Position> const AllianceCoords =
{
    { -3757.38f, -4533.05f, 14.16f, 3.62f},                 // Top-far-right bunk as seen from entrance
    { -3754.36f, -4539.13f, 14.16f, 5.13f},                 // Top-far-left bunk
    { -3749.54f, -4540.25f, 14.28f, 3.34f},                 // Far-right bunk
    { -3742.10f, -4536.85f, 14.28f, 3.64f},                 // Right bunk near entrance
    { -3755.89f, -4529.07f, 14.05f, 0.57f},                 // Far-left bunk
    { -3749.51f, -4527.08f, 14.07f, 5.26f},                 // Mid-left bunk
    { -3746.37f, -4525.35f, 14.16f, 5.22f},                 // Left bunk near entrance
};

// alliance run to where
#define A_RUNTOX -3742.96f
#define A_RUNTOY -4531.52f
#define A_RUNTOZ 11.91f

static std::vector<Position> const HordeCoords =
{
    { -1013.75f, -3492.59f, 62.62f, 4.34f},                 // Left, Behind
    { -1017.72f, -3490.92f, 62.62f, 4.34f},                 // Right, Behind
    { -1015.77f, -3497.15f, 62.82f, 4.34f},                 // Left, Mid
    { -1019.51f, -3495.49f, 62.82f, 4.34f},                 // Right, Mid
    { -1017.25f, -3500.85f, 62.98f, 4.34f},                 // Left, front
    { -1020.95f, -3499.21f, 62.98f, 4.34f}                  // Right, Front
};

// horde run to where
#define H_RUNTOX -1016.44f
#define H_RUNTOY -3508.48f
#define H_RUNTOZ 62.96f

uint32 const AllianceSoldierId[3] =
{
    12938,                                                  // 12938 Injured Alliance Soldier
    12936,                                                  // 12936 Badly injured Alliance Soldier
    12937                                                   // 12937 Critically injured Alliance Soldier
};

uint32 const HordeSoldierId[3] =
{
    12923,                                                  // 12923 Injured Soldier
    12924,                                                  // 12924 Badly injured Soldier
    12925                                                   // 12925 Critically injured Soldier
};

/*######
## npc_doctor (handles both Gustaf Vanhowzen and Gregory Victor)
######*/

struct npc_doctorAI : public ScriptedAI
{
    npc_doctorAI(Creature* pCreature) : ScriptedAI(pCreature), m_vPatientSummonCoordinates(pCreature->GetEntry() == DOCTOR_ALLIANCE ? AllianceCoords : HordeCoords)
    {
        Reset();
    }

    ObjectGuid m_playerGuid;

    uint32 m_uiSummonPatientTimer;
    uint32 m_uiSummonPatientCount;
    uint32 m_uiPatientDiedCount;
    uint32 m_uiPatientSavedCount;

    ObjectGuidSet m_patientGuids;
    std::vector<Position> const& m_vPatientSummonCoordinates;

    void Reset() override
    {
        m_playerGuid.Clear();

        m_uiSummonPatientTimer = 10000;
        m_uiPatientDiedCount = 0;
        m_uiPatientSavedCount = 0;

        m_patientGuids.clear();
    }

    void EndEvent(bool success);
    void BeginEvent(Player* pPlayer);
    void PatientDied(Creature* pSoldier);
    void PatientSaved(Creature* pSoldier, Player* pPlayer);
    Position const* GetPatientSpawnPosition();
    void UpdateAI(uint32 const uiDiff) override;
};

/*#####
## npc_injured_patient (handles all the patients, no matter Horde or Alliance)
#####*/

struct npc_injured_patientAI : public ScriptedAI
{
    npc_injured_patientAI(Creature* pCreature) : ScriptedAI(pCreature), isSaved(false) {Reset();}

    ObjectGuid m_doctorGuid;
    bool isSaved;

    void EnterEvadeMode() override
    {
        if (isSaved)
            ScriptedAI::EnterEvadeMode();
    }

    void Reset() override
    {
        m_doctorGuid.Clear();

        // no select
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        // no regen health
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
        // to make them lay with face down
        m_creature->SetStandState(UNIT_STAND_STATE_DEAD);

        switch (m_creature->GetEntry())
        {
            // lower max health
            case 12923:
            case 12938:                                     // Injured Soldier
                m_creature->SetHealth(uint32(m_creature->GetMaxHealth()*.75));
                break;
            case 12924:
            case 12936:                                     // Badly injured Soldier
                m_creature->SetHealth(uint32(m_creature->GetMaxHealth()*.50));
                break;
            case 12925:
            case 12937:                                     // Critically injured Soldier
                m_creature->SetHealth(uint32(m_creature->GetMaxHealth()*.25));
                break;
        }
    }

    void SpellHit(SpellCaster* pCaster, SpellEntry const* pSpell) override
    {
        if (pCaster->GetTypeId() == TYPEID_PLAYER && m_creature->IsAlive() && pSpell->Id == 20804)
        {
            Player* pPlayer = static_cast<Player*>(pCaster);
            if (pPlayer->GetQuestStatus(QUEST_TRIAGE_A) == QUEST_STATUS_INCOMPLETE || pPlayer->GetQuestStatus(QUEST_TRIAGE_H) == QUEST_STATUS_INCOMPLETE)
            {
                if (Creature* pDoctor = m_creature->GetMap()->GetCreature(m_doctorGuid))
                {
                    if (npc_doctorAI* pDocAI = dynamic_cast<npc_doctorAI*>(pDoctor->AI()))
                        pDocAI->PatientSaved(m_creature, pPlayer);
                }
            }
            // make not selectable
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            // regen health
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
            // stand up
            m_creature->SetStandState(UNIT_STAND_STATE_STAND);

            switch (urand(0, 2))
            {
                case 0: DoScriptText(SAY_DOC1, m_creature); break;
                case 1: DoScriptText(SAY_DOC2, m_creature); break;
                case 2: DoScriptText(SAY_DOC3, m_creature); break;
            }

            m_creature->SetWalk(false);
            isSaved = true;

            switch (m_creature->GetEntry())
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

    void UpdateAI(uint32 const uiDiff) override
    {
        // Don't reduce health if already healed
        if (isSaved)
            return;

        // lower HP on every world tick makes it a useful counter, not officlone though
        uint32 uiHPLose = uint32(0.05f * uiDiff);
        if (m_creature->IsAlive() && m_creature->GetHealth() > 1 + uiHPLose)
        {
            m_creature->SetHealth(m_creature->GetHealth() - uiHPLose);
        }

        if (m_creature->IsAlive() && m_creature->GetHealth() <= 1 + uiHPLose)
        {
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IN_COMBAT);
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            m_creature->SetDeathState(JUST_DIED);
            m_creature->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);

            if (Creature* pDoctor = m_creature->GetMap()->GetCreature(m_doctorGuid))
            {
                if (npc_doctorAI* pDocAI = dynamic_cast<npc_doctorAI*>(pDoctor->AI()))
                    pDocAI->PatientDied(m_creature);
            }
        }
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
    m_playerGuid = pPlayer->GetObjectGuid();

    m_uiSummonPatientTimer = 10000;
    m_uiSummonPatientCount = 0;
    m_uiPatientDiedCount = 0;
    m_uiPatientSavedCount = 0;
}

void npc_doctorAI::EndEvent(bool success)
{
    if (Player* pPlayer = m_creature->GetMap()->GetPlayer(m_playerGuid))
    {
        if (success)
        {
            if (pPlayer->GetQuestStatus(QUEST_TRIAGE_A) == QUEST_STATUS_INCOMPLETE)
                pPlayer->GroupEventHappens(QUEST_TRIAGE_A, m_creature);
            else if (pPlayer->GetQuestStatus(QUEST_TRIAGE_H) == QUEST_STATUS_INCOMPLETE)
                pPlayer->GroupEventHappens(QUEST_TRIAGE_H, m_creature);
        }
        else
        {
            if(pPlayer->GetQuestStatus(QUEST_TRIAGE_A) == QUEST_STATUS_INCOMPLETE)
                pPlayer->FailQuest(QUEST_TRIAGE_A);
            else if (pPlayer->GetQuestStatus(QUEST_TRIAGE_H) == QUEST_STATUS_INCOMPLETE)
                pPlayer->FailQuest(QUEST_TRIAGE_H);
        }
    }

    for (auto const& guid : m_patientGuids)
    {
        if (Creature* pPatient = m_creature->GetMap()->GetCreature(guid))
            pPatient->DespawnOrUnsummon(1);
    }
    
    Reset();
}

void npc_doctorAI::PatientDied(Creature* pCreature)
{
    m_patientGuids.erase(pCreature->GetObjectGuid());
    ++m_uiPatientDiedCount;

    if (m_uiPatientDiedCount > 5)
    {
        EndEvent(false);
        return;
    }
}

void npc_doctorAI::PatientSaved(Creature* pCreature, Player* pPlayer)
{
    m_patientGuids.erase(pCreature->GetObjectGuid());
    if (pPlayer->GetObjectGuid() != m_playerGuid)
        return;

    ++m_uiPatientSavedCount;
    if (m_uiPatientSavedCount >= 15)
        EndEvent(true);
}

Position const* npc_doctorAI::GetPatientSpawnPosition()
{
    std::vector<Position const*> freeSpots;
    for (auto const& pos : m_vPatientSummonCoordinates)
        freeSpots.push_back(&pos);

    for (auto const& guid : m_patientGuids)
    {
        if (Creature* pPatient = m_creature->GetMap()->GetCreature(guid))
        {
            for (auto itr = freeSpots.begin(); itr != freeSpots.end();)
            {
                if (pPatient->GetDistance3dToCenter(**itr) < 1.0f)
                    itr = freeSpots.erase(itr);
                else
                    itr++;
            }

            if (freeSpots.empty())
                return nullptr;
        }
    }

    return SelectRandomContainerElement(freeSpots);
}

void npc_doctorAI::UpdateAI(uint32 const uiDiff)
{
    if (!m_playerGuid.IsEmpty())
    {
        if (m_uiSummonPatientCount >= 21)	// worst case scenario : 5 dead + 15 saved
        {
            EndEvent(true);
            return;
        }

        Player* pPlayer = m_creature->GetMap()->GetPlayer(m_playerGuid);
        if (pPlayer && pPlayer->IsWithinDist(m_creature, DEFAULT_VISIBILITY_DISTANCE))
        {
            if (m_uiSummonPatientTimer < uiDiff)
            {
                if (Position const* pos = GetPatientSpawnPosition())
                {
                    uint32 patientEntry = 0;
                    switch (m_creature->GetEntry())
                    {
                        case DOCTOR_ALLIANCE: patientEntry = AllianceSoldierId[urand(0, 2)]; break;
                        case DOCTOR_HORDE:    patientEntry = HordeSoldierId[urand(0, 2)];    break;
                        default:
                            sLog.Out(LOG_SCRIPTS, LOG_LVL_ERROR, "Invalid entry for Triage doctor. Please check your database");
                            return;
                    }

                    if (Creature* pPatient = m_creature->SummonCreature(patientEntry, pos->x, pos->y, pos->z, pos->o, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 5000))
                    {
                        // 2.4.3, this flag appear to be required for client side item->spell to work (TARGET_UNIT_FRIEND)
                        pPatient->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP);
                        m_patientGuids.insert(pPatient->GetObjectGuid());
                        if (npc_injured_patientAI* pPatientAI = dynamic_cast<npc_injured_patientAI*>(pPatient->AI()))
                            pPatientAI->m_doctorGuid = m_creature->GetObjectGuid();
                        ++m_uiSummonPatientCount;
                    }
                }

                m_uiSummonPatientTimer = 10000;
            }
            else
                m_uiSummonPatientTimer -= uiDiff;
        }
        else
        {
            EndEvent(false);
        }
    }

    ScriptedAI::UpdateAI(uiDiff);
}

bool QuestAccept_npc_doctor(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if ((pQuest->GetQuestId() == QUEST_TRIAGE_A) || (pQuest->GetQuestId() == QUEST_TRIAGE_H))
    {
        if (npc_doctorAI* pDocAI = dynamic_cast<npc_doctorAI*>(pCreature->AI()))
            pDocAI->BeginEvent(pPlayer);
    }

    return true;
}

CreatureAI* GetAI_npc_doctor(Creature* pCreature)
{
    return new npc_doctorAI(pCreature);
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

    void Reset() override
    {
        m_uiArmTimer = 3000;
        m_bArmed = false;
        m_creature->EnableMoveInLosEvent();
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

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_bArmed)
        { 
            if (m_uiArmTimer < uiDiff)
            {
                m_bArmed = true;
            }
            else
                m_uiArmTimer -= uiDiff;
        }
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

    void Reset() override
    {
        m_uiExplosionTimer = 1500;
        m_bExploded = false;
    }

    void UpdateAI(uint32 const uiDiff) override
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

    void Reset() override
    {
        m_uiPossesedCheck = 3000;
    }

    void Aggro(Unit* /*pWho*/) override {}
    void MoveInLineOfSight(Unit* /*pWho*/) override {}
    void AttackStart(Unit* /*pWho*/) override {}
    void EnterCombat(Unit* /*pWho*/) override {};

    void UpdateAI(uint32 const uiDiff) override
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

    void Reset() override
    {
        m_uiManaBurnTimer = urand(1000, 2500);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_creature->GetVictim())
        {
            if (m_uiManaBurnTimer < uiDiff)
            {
                if (m_creature->GetVictim()->GetPowerType() == POWER_MANA)
                    DoCastSpellIfCan(m_creature->GetVictim(), 15980);
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

    void UpdatePetAI(uint32 const uiDiff) override
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

    void UpdatePetAI(uint32 const uiDiff) override
    {
        if (m_firebuffetTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FLAME_BUFFET) == CAST_OK)
                m_firebuffetTimer = 22500;
        }
        else
            m_firebuffetTimer -= uiDiff;

        if (m_flamebreathTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FLAME_BREATH) == CAST_OK)
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

    void UpdatePetAI(uint32 const uiDiff) override
    {
        if (m_uiAcidSpitTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_ACID_SPIT) == CAST_OK)
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

        SetCombatMovement(false);

        npc_cannonball_runnerAI::Reset();
    }

    void AttackStart(Unit* /*pWho*/) override {}
    void MoveInLineOfSight(Unit* /*pWho*/) override {}
    void Reset() override {}

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->IsNonMeleeSpellCasted())
            if (Unit * pTarget = m_creature->SelectRandomUnfriendlyTarget((Unit *) nullptr, 40.0f, true))
                m_creature->CastSpell(pTarget, SPELL_CANNON_FIRE, false);
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

    void Reset() override
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

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiDespawnTimer < uiDiff)
        {
            if (m_creature->GetThreatManager().getThreatList().empty())
                m_creature->ForcedDespawn();
        }
        else
            m_uiDespawnTimer -= uiDiff;

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
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

    SPELL_LUNAR_FORTUNE             = 26522,
};

struct FireworkStruct
{
    uint32 m_uiNpcEntry;
    uint32 m_uiSpellEntry[5];
    bool m_bIsCluster;
    bool m_bIsLarge;
};

std::array<FireworkStruct, 25> const Fireworks =
{ {
    { 15872, {26357, 26303, 26302, 26300, 26301}, true, false }, // Blue Firework Cluster
    { 15873, {26360, 26308, 26307, 26306, 26305}, true, false }, // Red Firework Cluster
    { 15874, {26358, 26312, 26311, 26310, 26309}, true, false }, // Green Firework Cluster
    { 15875, {26359, 26316, 26315, 26314, 26313}, true, false }, // Purple Firework Cluster
    { 15876, {26361, 26320, 26319, 26318, 26317}, true, false }, // White Firework Cluster
    { 15877, {26362, 26324, 26323, 26322, 26321}, true, false }, // Yellow Firework Cluster
    { 15879, {26344, 0,     0,     0,     0},     false, false }, // Small Blue Rocket
    { 15880, {26345, 0,     0,     0,     0},     false, false }, // Small Green Rocket
    { 15881, {26346, 0,     0,     0,     0},     false, false }, // Small Purple Rocket
    { 15882, {26347, 0,     0,     0,     0},     false, false }, // Small Red Rocket
    { 15883, {26349, 0,     0,     0,     0},     false, false }, // Small Yellow Rocket
    { 15884, {26348, 0,     0,     0,     0},     false, false }, // Small White Rocket
    { 15885, {26351, 0,     0,     0,     0},     false, true }, // Large Blue Rocket
    { 15886, {26352, 0,     0,     0,     0},     false, true }, // Large Green Rocket
    { 15887, {26353, 0,     0,     0,     0},     false, true }, // Large Purple Rocket
    { 15888, {26354, 0,     0,     0,     0},     false, true }, // Large Red Rocket
    { 15889, {26355, 0,     0,     0,     0},     false, true }, // Large White Rocket
    { 15890, {26356, 0,     0,     0,     0},     false, true }, // Large Yellow Rocket
    { 15911, {26487, 26486, 26485, 26484, 26483}, true, true }, // Large Blue Firework Cluster
    { 15912, {26495, 26494, 26493, 26492, 26491}, true, true }, // Large Green Firework Cluster
    { 15913, {26500, 26499, 26498, 26497, 26496}, true, true }, // Large Purple Firework Cluster
    { 15914, {26505, 26504, 26503, 26502, 26501}, true, true }, // Large Red Firework Cluster
    { 15915, {26510, 26509, 26508, 26507, 26506}, true, true }, // Large White Firework Cluster
    { 15916, {26515, 26514, 26513, 26512, 26511}, true, true }, // Large Yellow Firework Cluster
    { 15918, {26487, 26509, 26508, 26484, 26483}, true, true }, // Lucky Rocket Cluster
} };

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

    void UpdateAI(uint32 const /*diff*/) override
    {
        if (!m_bExist || m_bDone)
            return;

        float x, y, z;
        m_creature->GetPosition(x, y, z);

        if (Fireworks[m_uiIndex].m_bIsCluster)
        {
            if (Fireworks[m_uiIndex].m_bIsLarge)
            {
                /* BIG Rockets
                ╔══════╤═════╤═════╗
                ║ X    │ Y   │ Z   ║
                ╠══════╪═════╪═════╣
                ║ 0    │ 0   │ +3  ║
                ╟──────┼─────┼─────╢
                ║ 0    │ +3  │ +7.5║
                ╟──────┼─────┼─────╢
                ║ +5.25│ -1.5│ +7.5║
                ╟──────┼─────┼─────╢
                ║ -5.25│ -1.5│ +7.5║
                ╟──────┼─────┼─────╢
                ║ 0    │ 0   │ +12 ║
                ╚══════╧═════╧═════╝
                */
                for (int i = 0; i < 5; ++i)
                {
                    switch (i)
                    {
                    case 0:
                        m_creature->NearTeleportTo(x, y, z + 3.0f, 0.0f);
                        break;
                    case 1:
                        m_creature->NearTeleportTo(x, y + 3.0f, z + 7.5f, 0.0f);
                        break;
                    case 2:
                        m_creature->NearTeleportTo(x + 5.25f, y - 1.5f, z + 7.5f, 0.0f);
                        break;
                    case 3:
                        m_creature->NearTeleportTo(x - 5.25f, y - 1.5f, z + 7.5f, 0.0f);
                        break;
                    case 4:
                        m_creature->NearTeleportTo(x, y, z + 12.0f, 0.0f);
                        break;
                    }
                    m_creature->CastSpell(m_creature, Fireworks[m_uiIndex].m_uiSpellEntry[i], true);
                }
            }
            else
            {
                /* Normal / Small Rockets
                ╔══════╤═════╤═════╗
                ║ X    │ Y   │ Z   ║
                ╠══════╪═════╪═════╣
                ║ 0    │ 0   │ +8  ║
                ╟──────┼─────┼─────╢
                ║ +3.5 │ -1  │ +5  ║
                ╟──────┼─────┼─────╢
                ║ 0    │ +2  │ +5  ║
                ╟──────┼─────┼─────╢
                ║ 0    │ 0   │ +2  ║
                ╟──────┼─────┼─────╢
                ║ -3.5 │ -1  │ +5  ║
                ╚══════╧═════╧═════╝
                */
                for (int i = 0; i < 5; ++i)
                {
                    switch (i)
                    {
                    case 0:
                        m_creature->NearTeleportTo(x, y, z + 8.0f, 0.0f);
                        break;
                    case 1:
                        m_creature->NearTeleportTo(x + 3.5f, y - 1.0f, z + 5.0f, 0.0f);
                        break;
                    case 2:
                        m_creature->NearTeleportTo(x, y + 2.0f, z + 5.0f, 0.0f);
                        break;
                    case 3:
                        m_creature->NearTeleportTo(x, y, z + 2.0f, 0.0f);
                        break;
                    case 4:
                        m_creature->NearTeleportTo(x - 3.5f, y - 1.0f, z + 5.0f, 0.0f);
                        break;
                    }
                    m_creature->CastSpell(m_creature, Fireworks[m_uiIndex].m_uiSpellEntry[i], true);
                }
            }
        }
        else
        {
            // Non Cluster Rockets are always z + 3.0f!
            m_creature->NearTeleportTo(x, y, z + 3.0f, 0.0f);
            m_creature->CastSpell(m_creature, Fireworks[m_uiIndex].m_uiSpellEntry[0], true);
        }

        // Lunar Fortune is casted 3 seconds later.
        if (m_bisLucky)
        {
            Creature* caster = m_creature;
            m_creature->m_Events.AddLambdaEventAtOffset([caster]
            {
                caster->CastSpell(caster, SPELL_LUNAR_FORTUNE, true);
            }, 3 * IN_MILLISECONDS);
        }

        if (m_creature->IsTemporarySummon())
        {
            if (Player* pSummoner = m_creature->GetMap()->GetPlayer(static_cast<TemporarySummon*>(m_creature)->GetSummonerGuid()))
                if (CreatureInfo const* cInfo = sObjectMgr.GetCreatureTemplate(Fireworks[m_uiIndex].m_bIsCluster ? NPC_CLUSTER_CREDIT_MARKER : NPC_FIREWORK_CREDIT_MARKER))
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
 * Summon possessed mobs
 */

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
        if (auto pOwner = m_creature->GetCharmer())
        {
            if (auto pPlayer = pOwner->ToPlayer())
            {
                if (uint32 spellId = m_creature->GetUInt32Value(UNIT_CREATED_BY_SPELL))
                    pPlayer->RemoveAurasDueToSpell(spellId);
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
 * Riggle Bassbait (Stranglethorn Vale Fishing Extravaganza)
 */

enum
{
    QUEST_MASTER_ANGLER     = 8193,

    EVENT_TOURNAMENT        = 15,

    YELL_BEGIN              = 10608,
    YELL_WINNER             = 10610,
    YELL_OVER               = 10609
};

struct npc_riggle_bassbaitAI : ScriptedAI
{
    explicit npc_riggle_bassbaitAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_uiTimer = 0;
        auto prevWinTime = sObjectMgr.GetSavedVariable(VAR_STV_FISHING_PREV_WIN_TIME);
        if (time(nullptr) - prevWinTime > DAY)
        {
            // reset all after 1 day
            sObjectMgr.SetSavedVariable(VAR_STV_FISHING_ANNOUNCE_EVENT_BEGIN, 1, true);
            sObjectMgr.SetSavedVariable(VAR_STV_FISHING_ANNOUNCE_POOLS_DESPAN, 0, true);
            sObjectMgr.SetSavedVariable(VAR_STV_FISHING_HAS_WINNER, 0, true);
        }
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
        if (sGameEventMgr.IsActiveEvent(EVENT_TOURNAMENT) && !sObjectMgr.GetSavedVariable(VAR_STV_FISHING_HAS_WINNER))
        {
            if (!m_creature->IsQuestGiver())
            {
                m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            }
            if (sObjectMgr.GetSavedVariable(VAR_STV_FISHING_ANNOUNCE_EVENT_BEGIN))
            {
                m_creature->MonsterYellToZone(YELL_BEGIN);
                // store announce begin done
                sObjectMgr.SetSavedVariable(VAR_STV_FISHING_ANNOUNCE_EVENT_BEGIN, 0, true);
                // store enable over annoucement
                sObjectMgr.SetSavedVariable(VAR_STV_FISHING_ANNOUNCE_POOLS_DESPAN, 1, true);
            }
        }
        else
        {
            if (m_creature->IsQuestGiver())
            {
                m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            }
            // only progress to announce over when pools have been despawned (EVENT_TOURNAMENT is over)
            if (!sGameEventMgr.IsActiveEvent(EVENT_TOURNAMENT) && sObjectMgr.GetSavedVariable(VAR_STV_FISHING_ANNOUNCE_POOLS_DESPAN))
            {
                m_creature->MonsterYellToZone(YELL_OVER);
                // store announce over done
                sObjectMgr.SetSavedVariable(VAR_STV_FISHING_ANNOUNCE_POOLS_DESPAN, 0, true);
            }
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

bool QuestRewarded_npc_riggle_bassbait(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_MASTER_ANGLER)
    {
        sObjectMgr.SetSavedVariable(VAR_STV_FISHING_PREV_WIN_TIME, time(nullptr), true);
        sObjectMgr.SetSavedVariable(VAR_STV_FISHING_HAS_WINNER, 1, true);
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
        m_creature->GetMotionMaster()->Clear(false, true);
        m_creature->GetMotionMaster()->MoveIdle();

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
        m_creature->CastSpell(m_creature, m_spawnEffect, false);
    }

    void Reset() override
    {
        SetCombatMovement(false);
    }

    void Aggro(Unit* /*pWho*/) override
    {

    }

    void AttackStart(Unit* /*pWho*/) override
    {

    }

    void EnterEvadeMode() override
    {
        
    }

    void UpdateAI(uint32 const diff) override
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
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);

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

    void UpdatePetAI(uint32 const uiDiff) override
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

                Unit* victim = m_creature->GetVictim();

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
    void UpdateAI(uint32 const uiDiff) override
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
        m_creature->EnableMoveInLosEvent();
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (!m_bArmed || m_bDetonation || m_bDespawn)
            return;

        if (m_creature->GetDistance(pWho) < 5.0f && pWho->IsHostileTo(m_creature))
            m_bDetonation = true;
    }

    void UpdateAI(uint32 const uiDiff) override
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
            DoStartNoMovement(m_creature->GetVictim());

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

struct npc_sickly_critterAI : CritterAI
{
    explicit npc_sickly_critterAI(Creature* pCreature) : CritterAI(pCreature)
    {
        npc_sickly_critterAI::ResetCreature();
    }

    bool m_bIsHit;
    bool m_bModify;
    uint32 m_uiTimer;
    Team team;
    ObjectGuid m_PlayerGuid;

    void JustRespawned() override
    {
        ResetCreature();
        CritterAI::JustRespawned();
    }

    void ResetCreature()
    {
        m_bIsHit = false;
        m_bModify = false;
        m_uiTimer = 1500;
    }

    void SpellHit(SpellCaster* pCaster, SpellEntry const* pSpell) override
    {
        if (pSpell->Id != SPELL_APPLY_SALVE)
        {
            CritterAI::SpellHit(pCaster, pSpell);
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

        CritterAI::UpdateAI(uiDiff);
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

    void UpdateAI(uint32 const uiDiff) override
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

    void UpdateAI(uint32 const uiDiff) override
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

enum
{
    EVENT_LOVE_IS_IN_THE_AIR                                    = 8,
    EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_DARNASSUS           = 110,
    EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_IRONFORGE           = 111,
    EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_STORMWIND           = 112,
    EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_ORGRIMMAR           = 113,
    EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_THUNDER_BLUFF       = 114,
    EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_UNDERCITY           = 115,

    SPELL_SMITTEN       = 27572,
    QUEST_GIFT_H        = 8981,
    QUEST_GIFT_A        = 8993,

    VAR_KWEE_THRALL     = 2200,
    VAR_KWEE_CAIRNE     = 2201,
    VAR_KWEE_SYLVANAS   = 2202,

    VAR_KWEE_BOLVAR     = 2203,
    VAR_KWEE_MAGNI      = 2204,
    VAR_KWEE_TYRANDE    = 2205,

    VAR_KWEE_ALLIANCE   = 2206,
    VAR_KWEE_HORDE      = 2207,

    TEXT_ID_VICTORY_A   = 8315,
    TEXT_ID_VICTORY_H   = 8316,
    TEXT_ID_TIE         = 8320,

};

uint32 const CityZones[6] =
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
        // If event 8 (Love is in the Air) isn't active, Kwee Q. Peddlefeet is summoned by a winner event and should not have the Quest giver flag.
        if (!sGameEventMgr.IsActiveEvent(EVENT_LOVE_IS_IN_THE_AIR))
        {
            SetVariables();
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        }
        Reset();
    }

    uint32 winningFaction;
    uint32 winningZone;

    void Reset() override {}

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

    void ResetVariablesAndDisableWinnerEvents()
    {
        // Reset all variables if available.
        for (uint32 i = VAR_KWEE_THRALL; i <= VAR_KWEE_HORDE; i++)
        {
            if (sObjectMgr.GetSavedVariable(i, 0))
                sObjectMgr.SetSavedVariable(i, 0, true);
        }

        // Disable all Winner events.
        for (uint32 i = EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_DARNASSUS; i < EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_UNDERCITY; i++)
        {
            sGameEventMgr.EnableEvent(i, false);
        }
    }

    void OnRemoveFromWorld() override
    {
        SetVariables();

        // If Kwee Q. Peddlefeet has no quest giver flag, he is already summoned by a contest Winner event.
        // If he despawns without the flag, the variables should be reseted for next Year's votings.
        // Also the Winner events needs to be disabled again.
        if (!m_creature->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER))
        {
            ResetVariablesAndDisableWinnerEvents();
            return;
        }

        if (m_creature->GetZoneId() != winningZone && winningZone != 0)
            return;
        
        // If Kwee Q. Peddlefeet is in the winner Zone, start the winner event here.
        switch (winningZone)
        {
            case 1637: // Orgrimmar
            {
                sGameEventMgr.EnableEvent(EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_ORGRIMMAR, true);
                break;
            }
            case 1638: // Thunder Bluff
            {
                sGameEventMgr.EnableEvent(EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_THUNDER_BLUFF, true);
                break;
            }
            case 1497: // Undercity
            {
                sGameEventMgr.EnableEvent(EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_UNDERCITY, true);
                break;
            }
            case 1519: // Stormwind
            {
                sGameEventMgr.EnableEvent(EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_STORMWIND, true);
                break;
            }
            case 1537: // Ironforge
            {
                sGameEventMgr.EnableEvent(EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_IRONFORGE, true);
                break;
            }
            case 1657: // Darnassus
            {
                sGameEventMgr.EnableEvent(EVENT_LOVE_IS_IN_THE_AIR_CONTEST_WINNER_DARNASSUS, true);
                break;
            }
        }
    }

    void ReceiveEmote(Player* pPlayer, uint32 uiEmote) override
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
    for (uint32 i = VAR_KWEE_THRALL; i <= VAR_KWEE_HORDE; i++)
    {
        pPlayer->SendUpdateWorldState(i, sObjectMgr.GetSavedVariable(i, 0));
    }

    if (!sGameEventMgr.IsActiveEvent(EVENT_LOVE_IS_IN_THE_AIR))
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

bool QuestRewarded_npc_kwee_peddlefeet(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
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
    void Reset() override
    {
        m_uiReturnTimer = 0;
    }

    void SpellHit(SpellCaster*, SpellEntry const* pSpell) override
    {
        if (pSpell->Id == SPELL_DARK_IRON_MUG)
            m_uiReturnTimer = 10000;
    }

    void MovementInform(uint32 type, uint32 id) override
    {
        if (type == POINT_MOTION_TYPE && id == 1)
        {
            m_creature->MonsterTextEmote(EMOTE_GUZZLE_ALE);
            m_creature->AddUnitState(UNIT_STAT_ROOT);
            m_uiReturnTimer = 3000;
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiReturnTimer > 0)
        {
            if (m_uiReturnTimer <= uiDiff)
            {
                m_uiReturnTimer = 0;
                m_creature->ClearUnitState(UNIT_STAT_ROOT);

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

/*
  Alliance Res Fixer
  Horde Res Fixer
*/

bool GossipHello_npc_res_fixer(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, 8995, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    pPlayer->SEND_GOSSIP_MENU(6440, pCreature->GetObjectGuid());
    return true;
}

bool GossipSelect_npc_res_fixer(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        ChrRacesEntry const* raceEntry = sChrRacesStore.LookupEntry(pPlayer->GetRace());
        uint32 const spellId = raceEntry ? raceEntry->resSicknessSpellId : SPELL_ID_PASSIVE_RESURRECTION_SICKNESS;
        pPlayer->RemoveAurasDueToSpell(spellId);
        pPlayer->DurabilityRepairAll(false, 0);
        pPlayer->CLOSE_GOSSIP_MENU();
    }

    return true;
}

void AddSC_npcs_special()
{
    Script* newscript;

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
    newscript->Name = "npc_kwee_peddlefeet";
    newscript->GetAI = &GetAI_npc_kwee_peddlefeet;
    newscript->pGossipHello = &GossipHello_npc_kwee_peddlefeet;
    newscript->pQuestRewardedNPC = &QuestRewarded_npc_kwee_peddlefeet;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_oozeling_jubjub";
    newscript->GetAI = &GetAI_npc_oozeling_jubjub;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_res_fixes";
    newscript->pGossipHello = &GossipHello_npc_res_fixer;
    newscript->pGossipSelect = &GossipSelect_npc_res_fixer;
    newscript->RegisterSelf();
}
