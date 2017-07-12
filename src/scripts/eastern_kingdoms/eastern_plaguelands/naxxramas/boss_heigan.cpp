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

/*
Full rewrite by Gemt

Current semi-unknowns:
The aoe manaburn; not seen it used in videos, despite all original vanilla guides mentioning it.
Probably because its pretty much a wipe if ranged/healers are hit by it. 
While Decrepit fever is very aggressive on its cooldown after a dance phase, the mana burn does not seem to be,
so we should give "plenty" of time for casters to get to the platform, and tank to move the boss away.

Chain pull radius for adds in encounter gauntlet is a bit of a guesswork with some hacks to override
the default, static, callForHelp radius.

*/

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    PHASE_GROUND            = 1,
    PHASE_PLATFORM          = 2,

    SAY_AGGRO1              = -1533109,
    SAY_AGGRO2              = -1533110,
    SAY_AGGRO3              = -1533111,
    SAY_SLAY                = -1533112,
    
    SAY_TAUNT1              = -1533113,
    SAY_TAUNT2              = -1533114,
    SAY_TAUNT3              = -1533115,
    SAY_TAUNT4              = -1533117,
    SAY_CHANNELING          = -1533116,
    SAY_DEATH               = -1533118,

    EMOTE_TELEPORT          = -1533136,
    EMOTE_RETURN            = -1533137,

    SPELL_ERUPTION          = 29371,

    //Spells by boss
    SPELL_DECREPIT_FEVER    = 29998,
    SPELL_PLAGUE_CLOUD      = 29350,
    SPELL_TELEPORT_SELF     = 30211,
    SPELL_MANABURN          = 29310,

    // Eye Stalks
    SPELL_MIND_FLAY         = 29407,

    // Diseased Maggots
    SPELL_RETCHING_PLAGUE  = 30079,

    NPC_EYE_STALK           = 16236,
    NPC_PLAGUE_FISSURE      = 533001,
    NPC_PLAGUE_CLOUD        = 533002,
};

enum Events
{
    EVENT_FEVER = 1,
    EVENT_ERUPT,
    EVENT_DANCE,
    EVENT_DANCE_END,
    EVENT_TAUNT,
    EVENT_DOOR_CLOSE,
    EVENT_MANABURN,
    EVENT_PORT_PLAYER
};

enum Phases
{
    PHASE_FIGHT = 1,
    PHASE_DANCE
};


static const uint32 firstEruptionDBGUID = 533048;
static const uint8 numSections = 4;
static const uint8 numEruptions[numSections] = { // count of sequential GO DBGUIDs in the respective section of the room
    15,
    25,
    23,
    13
};

static constexpr uint8 max_stalks = 20;
static constexpr float eyeStalkPossitions[max_stalks][4] =
{
     {2761.28f, -3765.37f, 275.08f, 1.24f},
     {2770.17f, -3782.11f, 275.08f, 1.33f},
     {2798.11f, -3788.94f, 275.08f, 2.35f},
     {2797.91f, -3776.86f, 275.08f, 2.25f},
     {2792.06f, -3762.52f, 275.08f, 2.9f,},
     {2789.87f, -3752.15f, 275.08f, 2.74f},
     {2804.21f, -3757.96f, 275.08f, 3.9f },
     {2821.16f, -3759.75f, 275.08f, 4.47f},
     {2834.64f, -3751.23f, 275.08f, 4.27f},
     {2843.54f, -3768.08f, 275.08f, 3.06f},
     {2862.4f,  -3758.3f,  275.08f, 4.8f },
     {2877.8f,  -3762.46f, 275.08f, 4.8f },
     {2894.11f, -3757.89f, 275.08f, 4.56f},
     {2895.25f, -3779.5f,  275.08f, 2.4f },
     {2881.59f, -3782.22f, 275.08f, 2.79f},
     {2867.2f,  -3778.21f, 275.08f, 3.01f},
     {2851.39f, -3776.54f, 275.08f, 2.69f},
     {2846.16f, -3789.13f, 275.08f, 1.79f},
     {2830.09f, -3776.49f, 275.08f, 0.94f},
     {2813.34f, -3780.97f, 275.08f, 1.84f},
};


static constexpr uint8 MAX_STALKS_UP = 6;

struct EyeStalkInfo
{
    enum eState
    {
        COOLDOWN,
        UP
    };
    eState currentState;
    uint32 timer;
    ObjectGuid guid;
    uint8 myIndex;
};


struct mob_rottingMaggotAI : public ScriptedAI
{
    mob_rottingMaggotAI(Creature* pCreature, bool isDiseased) :
        ScriptedAI(pCreature),
        isDiseased(isDiseased)
    {
        m_creature->SetNoCallAssistance(true);
        // call for help radius includes bounding radius, so we need this tiny to not chain aggro
        // the whole damn room
        m_creature->SetCallForHelpDist(0.5f); 
        Reset();
    }
    const bool isDiseased;
    WorldLocation aggroPossition;

    void Reset() override
    {
        if (isDiseased)
        {
            if (!m_creature->HasAura(SPELL_RETCHING_PLAGUE))
                m_creature->CastSpell(m_creature, SPELL_RETCHING_PLAGUE, true);
            }
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        // Custom, tiny aggro radius
        if (!m_creature->IsWithinDistInMap(pWho, 1.5f))
            return;

        if (m_creature->CanInitiateAttack() && pWho->isTargetableForAttack() && m_creature->IsHostileTo(pWho))
        {
            if (pWho->isInAccessablePlaceFor(m_creature) && m_creature->IsWithinLOSInMap(pWho))
            {
                m_creature->SetNoCallAssistance(true);

                if (!m_creature->getVictim())
                    AttackStart(pWho);
                else if (m_creature->GetMap()->IsDungeon())
                {
                    pWho->SetInCombatWith(m_creature);
                    m_creature->AddThreat(pWho);
                }
            }
        }
    }

    void Aggro(Unit*) override
    {
        m_creature->SetNoCallAssistance(true);
        m_creature->GetPosition(aggroPossition);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_creature->GetDistance(aggroPossition.coord_x, aggroPossition.coord_y, aggroPossition.coord_z) > 40.0f)
        {
            EnterEvadeMode();
        }
        else
        {
            DoMeleeAttackIfReady();
        }
    }
};

struct mob_eyeStalkAI : public ScriptedAI
{
    mob_eyeStalkAI(Creature* pCreature) :
        ScriptedAI(pCreature)
    {
        m_creature->SetCallForHelpDist(1.0f);
        m_creature->SetNoCallAssistance(true);
        SetCombatMovement(false);
        timeSinceSpawn = 0;
        haveSubmerged = false;
        haveCastSubmerge = false;
    }
    uint32 timeSinceSpawn;
    bool haveSubmerged;
    bool haveCastSubmerge;
    void Reset() override
    {
        m_creature->addUnitState(UNIT_STAT_ROOT);
        m_creature->StopMoving();
        m_creature->SetMovement(MOVE_ROOT);
        m_creature->SetNoCallAssistance(true);
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (timeSinceSpawn < 3000)
            return;

        if (!m_creature->IsWithinDistInMap(pWho, 15.0f))
            return;

        if (m_creature->CanInitiateAttack() && pWho->isTargetableForAttack() && m_creature->IsHostileTo(pWho))
        {
            if (pWho->isInAccessablePlaceFor(m_creature) && m_creature->IsWithinLOSInMap(pWho))
            {
                m_creature->SetNoCallAssistance(true);
                if (!m_creature->getVictim())
                    AttackStart(pWho);
                else if (m_creature->GetMap()->IsDungeon())
                {
                    pWho->SetInCombatWith(m_creature);
                    m_creature->AddThreat(pWho);
                }
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        m_creature->SetNoCallAssistance(true);
        timeSinceSpawn += std::min(uiDiff, std::numeric_limits<uint32>::max()-timeSinceSpawn);

        if (haveSubmerged)
        {
            if (!haveCastSubmerge)
            {
                haveCastSubmerge = true;
                m_creature->CastSpell(m_creature, 26234, false);
            }
            return;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!m_creature->IsNonMeleeSpellCasted())
        {
            if (m_creature->GetDistance(m_creature->getVictim()) < 35.0f)
                DoCastSpellIfCan(m_creature->getVictim(), SPELL_MIND_FLAY);
            else
                DoStopAttack();
        }

        DoMeleeAttackIfReady();
    }
};

struct boss_heiganAI : public ScriptedAI
{
    std::vector<uint8> availableEyeLocs;
    EyeStalkInfo eyeStalks[MAX_STALKS_UP];

    boss_heiganAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    uint32 stalkSpawnCooldowns[20];

    instance_naxxramas* m_pInstance;

    Phases currentPhase;
    EventMap m_events;
    uint8 eruptionPhase;
    std::vector<ObjectGuid> _eruptTiles[numSections];
    uint32 killCooldown;
    std::vector<ObjectGuid> portedPlayersThisPhase;

    void Reset()
    {
        portedPlayersThisPhase.clear();
        std::list<Creature*> creaturesToDespawn;
        GetCreatureListWithEntryInGrid(creaturesToDespawn, m_creature, NPC_EYE_STALK, 400.0f);
        for(auto it = creaturesToDespawn.begin(); it != creaturesToDespawn.end(); ++it)
        {
            if (TemporarySummon* ts = static_cast<TemporarySummon*>(*it))
            {
                ts->UnSummon();
            }
        }
        for (int i = 0; i < MAX_STALKS_UP; i++)
        {
            eyeStalks[i].currentState = EyeStalkInfo::COOLDOWN;
            eyeStalks[i].timer = urand(0, 10000);
            eyeStalks[i].guid = 0;
        }
        availableEyeLocs.clear();
        for (uint8 i = 0; i < max_stalks; i++)
            availableEyeLocs.push_back(i);

        m_events.Reset();
        killCooldown = 10000;
        currentPhase = PHASE_FIGHT;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
        
        eruptionPhase = 0;
        currentPhase = PHASE_FIGHT;
        m_events.ScheduleEvent(EVENT_FEVER,      Seconds(30), 0, PHASE_FIGHT);
        m_events.ScheduleEvent(EVENT_DANCE,      Seconds(90), 0, PHASE_FIGHT);
        m_events.ScheduleEvent(EVENT_ERUPT,      Seconds(15), 0, PHASE_FIGHT);
        m_events.ScheduleEvent(EVENT_MANABURN,   Seconds(15), 0, PHASE_FIGHT);
        m_events.ScheduleEvent(EVENT_TAUNT,      randtime(Seconds(20), Seconds(70)));
        m_events.ScheduleEvent(EVENT_DOOR_CLOSE, Seconds(15));
        m_events.ScheduleEvent(EVENT_PORT_PLAYER,Seconds(40));

        DoScriptText(irand(SAY_AGGRO3, SAY_AGGRO1), m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_HEIGAN, IN_PROGRESS);
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (currentPhase == PHASE_DANCE)
            return;
        else
            ScriptedAI::MoveInLineOfSight(pWho);
    }
    
    void AttackStart(Unit* pWho) override
    {
        if (currentPhase == PHASE_DANCE)
            return;
        else
            ScriptedAI::AttackStart(pWho);
    }

    void KilledUnit(Unit* pVictim)
    {
        if(!killCooldown)
            DoScriptText(SAY_SLAY, m_creature);
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, m_creature);

        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_HEIGAN, DONE);
            m_pInstance->UpdateBossEntranceDoor(GO_PLAG_HEIG_ENTRY_DOOR, DONE);
        }

    }

    void JustReachedHome()
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_HEIGAN, FAIL);
            m_pInstance->UpdateBossEntranceDoor(GO_PLAG_HEIG_ENTRY_DOOR, FAIL);
        }
        
    }

    void UpdateEruption(uint32 uiDiff)
    {
        Creature* fissureCreature = m_creature->SummonCreature(NPC_PLAGUE_FISSURE, 2773, -3684, 292, 0, TEMPSUMMON_TIMED_DESPAWN, 1000);
        if (!fissureCreature)
        {
            sLog.outError("Heigan: failed spawning fissure creature");
            return;
        }

        for (uint8 uiArea = 0; uiArea < 4; ++uiArea)
        {
            // Actually this is correct :P
            if (uiArea == (eruptionPhase % 6) || uiArea == 6 - (eruptionPhase % 6))
                continue;

            for (GuidList::const_iterator itr = m_pInstance->m_alHeiganTrapGuids[uiArea].begin();
                itr != m_pInstance->m_alHeiganTrapGuids[uiArea].end(); ++itr)
            {
                if (GameObject* pTrap = m_pInstance->GetGameObject(*itr))
                {
                    pTrap->Use(fissureCreature);
                    pTrap->SendGameObjectCustomAnim(pTrap->GetObjectGuid());
                }
            }
        }

        m_events.Repeat(currentPhase == PHASE_DANCE ? Seconds(3) : Seconds(10));
        ++eruptionPhase;
    }

    void EventStartDance()
    {
        portedPlayersThisPhase.clear();

        if (DoCastSpellIfCan(m_creature, SPELL_TELEPORT_SELF, CAST_TRIGGERED) != CAST_OK)
        {
            return;
        }
        currentPhase = PHASE_DANCE;

        m_creature->SetReactState(REACT_PASSIVE);
        m_creature->AttackStop();
        m_creature->StopMoving();
        m_creature->GetMotionMaster()->MoveIdle();
        DoStopAttack();
        DoCastAOE(SPELL_PLAGUE_CLOUD);
        
        uint32 tauntStash = m_events.GetTimeUntilEvent(EVENT_TAUNT);
        m_events.Reset();
        m_events.ScheduleEvent(EVENT_TAUNT, tauntStash);
        m_events.ScheduleEvent(EVENT_DANCE_END, Seconds(45), 0, PHASE_DANCE);
        m_events.ScheduleEvent(EVENT_ERUPT, Seconds(4));
        
        for (int i = 0; i < max_stalks; i++)
        {
            if (Creature* pCloud = m_creature->SummonCreature(NPC_PLAGUE_CLOUD, eyeStalkPossitions[i][0], eyeStalkPossitions[i][1], eyeStalkPossitions[i][2], eyeStalkPossitions[i][3],
                TEMPSUMMON_TIMED_DESPAWN, 45000))
            {
                pCloud->CastSpell((Unit*)nullptr, SPELL_PLAGUE_CLOUD, true);
            }
        }
        DoScriptText(SAY_CHANNELING, m_creature);
        eruptionPhase = 0;
    }

    void EventDanceEnd()
    {
        currentPhase = PHASE_FIGHT;

        uint32 tauntStash = m_events.GetTimeUntilEvent(EVENT_TAUNT);
        m_events.Reset();
        m_events.ScheduleEvent(EVENT_TAUNT,     tauntStash);
        m_events.ScheduleEvent(EVENT_FEVER,     Seconds(5)); // videos confirm this, unless raid moves perfectly, more or less everyone is hit.
        m_events.ScheduleEvent(EVENT_DANCE,     Seconds(90));
        m_events.ScheduleEvent(EVENT_ERUPT,     Seconds(10));
        m_events.ScheduleEvent(EVENT_MANABURN,  Seconds(10));
        m_events.ScheduleEvent(EVENT_PORT_PLAYER, Seconds(18));
        m_events.ScheduleEvent(EVENT_PORT_PLAYER, Seconds(48));
        m_creature->CastStop();
        m_creature->SetReactState(REACT_AGGRESSIVE);
        m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());

        eruptionPhase = 0;
    }

    void EventPortPlayer()
    {
        const ThreatList& tl = m_creature->getThreatManager().getThreatList();
        std::vector<Unit*> candidates;
        auto it = tl.begin();
        //++it; // skip the tank
        for (it; it != tl.end(); it++)
        {
            if (Unit* pUnit = m_creature->GetMap()->GetUnit((*it)->getUnitGuid()))
            {
                // Candidates are only alive players who have not yet been ported during this phase rotation
                if (pUnit->IsPlayer() && pUnit->isAlive()
                    && std::find(portedPlayersThisPhase.begin(), portedPlayersThisPhase.end(), pUnit->GetObjectGuid()) == portedPlayersThisPhase.end())
                {
                    candidates.push_back(pUnit);
                }
            }
        }

        for (int i = 0; i < 3; i++)
        {
            if (candidates.size() == 0)
                break;

            uint32 idx = urand(0, candidates.size() - 1);
            Unit* target = candidates[idx];
            candidates.erase(candidates.begin() + idx);
            portedPlayersThisPhase.push_back(target->GetObjectGuid());
            // getting the spell visual to show both where you were TPed from and where you are TPed too
            if (Creature* pCreature = m_creature->SummonCreature(NPC_PLAGUE_FISSURE, 
                target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(),
                TEMPSUMMON_TIMED_DESPAWN, 2000))
            {
                pCreature->SendSpellGo(pCreature, 30211);
            }
            target->SendSpellGo(target, 30211);
            target->NearTeleportTo(2917.43f, -3769.18f, 273.62f, 3.1415f);
        }
    }

    void EventTaunt()
    {
        // Taunt
        switch (urand(0, 3))
        {
        case 0:
            DoScriptText(SAY_TAUNT1, m_creature);
            break;
        case 1:
            DoScriptText(SAY_TAUNT2, m_creature);
            break;
        case 2:
            DoScriptText(SAY_TAUNT3, m_creature);
            break;
        case 3:
            DoScriptText(SAY_TAUNT4, m_creature);
            break;
        }

        //DoScriptText(irand(SAY_TAUNT4, SAY_TAUNT1), m_creature);
        m_events.Repeat(randtime(Seconds(20), Seconds(70)));
    }

    void CheckManausersAndRepeat()
    {
        // Looking for anyone with a manabar (pets presumably included)
        // within 25yd range (radius of SPELL_MANABURN). If there is one we cast SPELL_MANABURN
        const auto& tl = m_creature->getThreatManager().getThreatList();
        bool found_mana_in_range = false;
        for (auto it = tl.begin(); it != tl.end(); ++it)
        {
            // todo: is getTarget the player/pet/whatever in the list? Seems like it
            if ((*it)->getTarget()->getPowerType() == POWER_MANA)
            {
                if (m_creature->GetDistanceToCenter((*it)->getTarget()) < 25.0f)
                {
                    found_mana_in_range = true;
                    break;
                }
            }
        }
     
        if (found_mana_in_range && DoCastSpellIfCan(m_creature, SPELL_MANABURN) == CAST_OK)
            m_events.Repeat(Seconds(3));
        else
            m_events.Repeat(Seconds(1));
    }
    
    /*
    10 stalks
    rand 10-20 up
    rand 10-20 down
    avg 15 up, avg 15 down
    avg 5 up at any given time
    when killed, down time becomes rand 10-20 + additional 10 seconds

    we want an eyestalk to submerge and a new one to pop up every 4sec on avg. 
    That means we need all 20 to have an average cd of 80sec.
    We also want, when no stalks are killed, on average 
    when an eyestalk comes off coldown, it forces the oldest alive eyestalk to die, then summons itself. The dead eye stalk gets a 60-90sec cooldown
    with 20 stalks, and an avg cd of 75sec, this means one eye stalk switches with another one every 3.75 seconds on avg.

    */

    void WhackAStalk(uint32 diff)
    {
        if (m_creature->isDead())
            return;

        for (int i = 0; i < MAX_STALKS_UP; i++)
        {
            if (eyeStalks[i].timer >= diff)
                eyeStalks[i].timer -= diff;

            switch (eyeStalks[i].currentState)
            {
            case EyeStalkInfo::COOLDOWN:
            {
                // Summoning a new eye
                if (eyeStalks[i].timer < diff)
                {
                    if (availableEyeLocs.size() == 0)
                    {
                        sLog.outError("Heigan - availableEyeLocs size 0, should not happen!");
                        return;
                    }
                    uint8 availableIndex = urand(0, availableEyeLocs.size() - 1);
                    uint8 newEyeIdx = availableEyeLocs[availableIndex];
                    availableEyeLocs.erase(availableEyeLocs.begin() + availableIndex);
                    
                    eyeStalks[i].myIndex = newEyeIdx;
                    const float* pos = eyeStalkPossitions[newEyeIdx];
                    Creature* pStalk = m_creature->SummonCreature(NPC_EYE_STALK, pos[0], pos[1], pos[2], pos[3], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5000);
                    if (!pStalk)
                    {
                        sLog.outError("Heigans WhackAStalk failed to summon eye stalk");
                        return;
                    }
                    eyeStalks[i].guid = pStalk->GetObjectGuid();
                    eyeStalks[i].currentState = EyeStalkInfo::UP;
                    eyeStalks[i].timer = urand(15000, 20000);
                }
                break;
            }
            case EyeStalkInfo::UP:
                // Initiating unsummon
                if (eyeStalks[i].timer < diff)
                {
                    if (Creature* pCreature = m_pInstance->GetCreature(eyeStalks[i].guid))
                    {
                        // If the eye is currently channeling mind flay we wait with unsummoning it
                        if (!pCreature->IsNonMeleeSpellCasted())
                        {
                            mob_eyeStalkAI* ai = static_cast<mob_eyeStalkAI*>(pCreature->AI());
                            if(!ai->haveSubmerged)
                            {
                                ai->haveSubmerged = true;
                                if (TemporarySummon* ts = static_cast<TemporarySummon*>(pCreature))
                                    ts->UnSummon(1100);
                            }
                        }
                    }
                }
                break;
            }
        }
    }

    void SummonedCreatureDespawn(Creature* pCreature) override 
    {
        if (pCreature->GetEntry() == NPC_EYE_STALK)
        {
            for (int i = 0; i < MAX_STALKS_UP; i++)
            {
                if (eyeStalks[i].guid == pCreature->GetObjectGuid())
                {
                    // if currentState already is COOLDOWN it means it was killed
                    if (eyeStalks[i].currentState != EyeStalkInfo::COOLDOWN)
                    {
                        eyeStalks[i].currentState = EyeStalkInfo::COOLDOWN;
                        eyeStalks[i].timer = urand(1000, 5000);
                    }
                    eyeStalks[i].guid = 0;
                    availableEyeLocs.push_back(eyeStalks[i].myIndex);
                    break;
                }
            }
        }
    }

    virtual void SummonedCreatureJustDied(Creature* pCreature)
    {
        if (pCreature->GetEntry() == NPC_EYE_STALK)
        {
            // was killed, so it receives an additional 10 seconds cooldown
            for (int i = 0; i < MAX_STALKS_UP; i++)
            {
                if (eyeStalks[i].guid == pCreature->GetObjectGuid())
                {
                    eyeStalks[i].currentState = EyeStalkInfo::COOLDOWN;
                    eyeStalks[i].timer = urand(1000, 5000) + 20000;
                    break;
                }
            }
        }
    }
    
    void UpdateAI(const uint32 uiDiff)
    {

        // This will avoid him running off the platform during dance phase.
        if (currentPhase == PHASE_FIGHT)
        {
            if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
                return;
        }
        else {
            // If wipe, we force the dance phase to end so above code runs and he evades.
            if (m_creature->getThreatManager().isThreatListEmpty())
                EventDanceEnd();
        }
        WhackAStalk(uiDiff);

        m_events.Update(uiDiff);
        while (uint32 eventId = m_events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_FEVER:
                DoCastAOE(SPELL_DECREPIT_FEVER);
                m_events.Repeat(randtime(Seconds(20), Seconds(25)));
                break;
            case EVENT_DANCE:
                EventStartDance();
                break;
            case EVENT_DANCE_END:
                EventDanceEnd();
                break;
            case EVENT_ERUPT:
                UpdateEruption(uiDiff);
                break;
            case EVENT_TAUNT:
                EventTaunt();
                break;
            case EVENT_DOOR_CLOSE:
                if(m_pInstance)
                    m_pInstance->UpdateBossEntranceDoor(GO_PLAG_HEIG_ENTRY_DOOR, IN_PROGRESS);
                break;
            case EVENT_MANABURN:
                CheckManausersAndRepeat();
                break;
            case EVENT_PORT_PLAYER:
                EventPortPlayer();
                break;
            }
        }
        
        if (killCooldown < uiDiff)
            killCooldown = 0;
        else
            killCooldown -= uiDiff;

        if (currentPhase == PHASE_FIGHT)
            DoMeleeAttackIfReady();
    }
};

struct mob_plague_cloudAI : public ScriptedAI
{
    mob_plague_cloudAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }
    void Reset() override
    {
        m_creature->addUnitState(UNIT_STAT_ROOT);
        m_creature->StopMoving();
        m_creature->SetMovement(MOVE_ROOT);
    }

    void AttackStart(Unit*) { }
    void MoveInLineOfSight(Unit*) { }

    void UpdateAI(const uint32) override { }
};

CreatureAI* GetAI_boss_heigan(Creature* pCreature)
{
    return new boss_heiganAI(pCreature);
}

CreatureAI* GetAI_mob_rottingMaggot(Creature* pCreature)
{
    return new mob_rottingMaggotAI(pCreature, false);
}
CreatureAI* GetAI_mob_diseasedMaggot(Creature* pCreature)
{
    return new mob_rottingMaggotAI(pCreature, true);
}
CreatureAI* GetAI_mob_eyeStalk(Creature* pCreature)
{
    return new mob_eyeStalkAI(pCreature);
}

CreatureAI* GetAI_mob_plagueCloud(Creature* pCreature)
{
    return new mob_plague_cloudAI(pCreature);
}

void AddSC_boss_heigan()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_heigan";
    NewScript->GetAI = &GetAI_boss_heigan;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_rotting_maggot";
    NewScript->GetAI = &GetAI_mob_rottingMaggot;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_diseased_maggot";
    NewScript->GetAI = &GetAI_mob_diseasedMaggot;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_eye_stalk";
    NewScript->GetAI = &GetAI_mob_eyeStalk;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_plague_cloud";
    NewScript->GetAI = &GetAI_mob_plagueCloud;
    NewScript->RegisterSelf();
}
