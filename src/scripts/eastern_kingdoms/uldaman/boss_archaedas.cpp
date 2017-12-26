/*
* Copyright (C) 2005 - 2013 MaNGOS <http://www.getmangos.com/>
*
* Copyright (C) 2008 - 2013 Trinity <http://www.trinitycore.org/>
*
* Copyright (C) 2010 - 2013 ArkCORE <http://www.arkania.net/>
* Copyright (C) 2006-2007 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: boss_archaedas
SD%Complete: 100
SDComment: Archaedas is activated when 1 person (was 3, changed in 3.0.8) clicks on his altar.
Every 10 seconds he will awaken one of his minions along the wall.
At 66%, he will awaken the 6 Earthen Guardians.
At 33%, he will awaken the 2 Vault Warders
On his death the vault door opens.
EndScriptData */

#include "scriptPCH.h"
#include "uldaman.h"

#define SAY_AGGRO "Who dares awaken Archaedas? Who dares the wrath of the makers!"
#define SOUND_AGGRO 5855

#define SAY_SUMMON "Awake ye servants, defend the discs!"
#define SOUND_SUMMON 5856

#define SAY_SUMMON2 "To my side, brothers. For the makers!"
#define SOUND_SUMMON2 5857

#define SAY_KILL "Reckless mortal."
#define SOUND_KILL 5858

// Return true to avoid db script attempt
bool ProcessEventId_event_awaken_archaedas(uint32 eventId, Object* source, Object* target, bool isStart)
{
    if (!source || source->GetTypeId() != TYPEID_PLAYER)
        return true;

    // Couldn't get Altar, block event
    if (!target)
        return true;

    if (ScriptedInstance* instance = dynamic_cast<ScriptedInstance*>(((Player*)source)->GetInstanceData()))
        instance->SetData(ULDAMAN_ENCOUNTER_ARCHAEDAS, IN_PROGRESS);

    return true;
}

struct boss_archaedasAI : public ScriptedAI
{
    boss_archaedasAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        instance = (ScriptedInstance*)pCreature->GetInstanceData();
        me->GetRespawnCoord(spawnX, spawnY, spawnZ);
        Reset();
        bJustCreated = true;
    }

    ScriptedInstance* instance;

    uint32 uiTremorTimer;
    int32 iAwakenTimer;
    uint32 uiWallMinionTimer;
    uint32 uiRoomCheck;
    bool bWakingUp;
    bool bGuardiansAwake;
    bool bVaultWardersAwake;
    bool bJustCreated;
    float spawnX;
    float spawnY;
    float spawnZ;

    bool UnitIsOutside(Unit* unit)
    {
        return !unit->IsWithinDist2d(spawnX, spawnY, 38.0f);
    }

    void Reset()
    {
        uiTremorTimer = 60000;
        iAwakenTimer = 0;
        uiWallMinionTimer = 10000;
        uiRoomCheck = 500;
        bWakingUp = false;
        bGuardiansAwake = false;
        bVaultWardersAwake = false;

        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    void SpellHit(Unit* /*caster*/, const SpellEntry* spell)
    {
        // Being woken up from the altar, start the awaken sequence
        if (spell->Id == SPELL_ARCHAEDAS_AWAKEN && !bWakingUp)
        {
            me->MonsterYell(SAY_AGGRO, LANG_UNIVERSAL, 0);
            DoPlaySoundToSet(me, SOUND_AGGRO);
            iAwakenTimer = 4000;
            bWakingUp = true;
        }
    }

    void KilledUnit(Unit* /*victim*/)
    {
        me->MonsterYell(SAY_KILL, LANG_UNIVERSAL, 0);
        DoPlaySoundToSet(me, SOUND_KILL);
    }

    // He goes back to his spawn point after reset, stone him after.
    void JustReachedHome()
    {
        Reset();
        instance->SetData(ULDAMAN_ENCOUNTER_ARCHAEDAS, NOT_STARTED);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (bJustCreated)
        {
            bJustCreated = false;
            JustReachedHome();
        }

        if (!instance || instance->GetData(ULDAMAN_ENCOUNTER_ARCHAEDAS) != IN_PROGRESS)
            return;

        // we're still doing awaken animation
        if (bWakingUp && iAwakenTimer >= 0)
        {
            iAwakenTimer -= uiDiff;
            return; // dont do anything until we are done
        }
        else if (bWakingUp && iAwakenTimer <= 0)
        {
            bWakingUp = false;
            if (Unit* target = me->SelectNearestTarget(80.0f))
            {
                AttackStart(target);
            }
            return; // dont want to continue until we finish the AttackStart method
        }

        //Return since we have no target
        if (!UpdateVictim())
        {
            return;
        }

        // check if the target is still inside the room
        if (uiRoomCheck <= uiDiff)
        {
            if (UnitIsOutside(me) || UnitIsOutside(me->getVictim()))
            {
                EnterEvadeMode();
                return;
            }
            uiRoomCheck = 500;
        }
        else uiRoomCheck -= uiDiff;

        // wake a wall minion
        if (uiWallMinionTimer <= uiDiff)
        {
            instance->SetData(ULDAMAN_ENCOUNTER_ARCHAEDAS, IN_PROGRESS);
            uiWallMinionTimer = 10000;
        }
        else uiWallMinionTimer -= uiDiff;

        //If we are <66 summon the guardians
        if (!bGuardiansAwake && me->GetHealthPercent() <= 66.0f)
        {
            me->CastSpell(me, SPELL_AWAKEN_EARTHEN_GUARDIAN, false);
            me->MonsterYell(SAY_SUMMON, LANG_UNIVERSAL, 0);
            DoPlaySoundToSet(me, SOUND_SUMMON);
            bGuardiansAwake = true;
        }

        //If we are <33 summon the vault warders
        if (!bVaultWardersAwake && me->GetHealthPercent() <= 33.0f)
        {
            // Despawn the furniture
            if (Creature* target = instance->GetMap()->GetCreature(instance->GetData64(12)))
                target->ForcedDespawn();
            if (Creature* target = instance->GetMap()->GetCreature(instance->GetData64(13)))
                target->ForcedDespawn();
            // fix factions now or they'll look green for a brief moment
            if (Creature* target = instance->GetMap()->GetCreature(instance->GetData64(1)))
            {
                target->setFaction(FACTION_AWAKE);
                target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                target->CastSpell(target, SPELL_STONE_DWARF_AWAKEN, false);
            }
            if (Creature* target = instance->GetMap()->GetCreature(instance->GetData64(2)))
            {
                target->setFaction(FACTION_AWAKE);
                target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                target->CastSpell(target, SPELL_STONE_DWARF_AWAKEN, false);
            }
            me->CastSpell(me, SPELL_AWAKEN_VAULT_WARDER, false);
            me->MonsterYell(SAY_SUMMON2, LANG_UNIVERSAL, 0);
            DoPlaySoundToSet(me, SOUND_SUMMON2);
            bVaultWardersAwake = true;
        }

        if (uiTremorTimer <= uiDiff)
        {
            //Cast
            DoCast(me->getVictim(), SPELL_GROUND_TREMOR);
            //45 seconds until we should cast this agian
            uiTremorTimer = 45000;
        }
        else uiTremorTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }

    void EnterEvadeMode()
    {
        if (Unit* target = me->SelectNearestHostileUnitInAggroRange(true))
        {
            if (!UnitIsOutside(target))
            {
                AttackStart(target);
                return;
            }
        }
        if (instance)
            instance->SetData(ULDAMAN_ENCOUNTER_ARCHAEDAS, FAIL);
        ScriptedAI::EnterEvadeMode();
    }

    void JustDied(Unit* /*killer*/)
    {
        if (instance)
        {
            instance->SetData(ULDAMAN_ENCOUNTER_ARCHAEDAS, DONE);
        }
    }
};

CreatureAI* GetAI_boss_archaedas(Creature* creature)
{
    return new boss_archaedasAI(creature);
}

/* ScriptData
SDName: mob_archaedas_minions
SD%Complete: 100
SDComment: These mobs are initially frozen until Archaedas awakens them
one at a time.
EndScriptData */

struct mob_archaedas_minionsAI : public ScriptedAI
{
    mob_archaedas_minionsAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        instance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    uint32 uiArcing_Timer;
    uint32 uiTrample_Timer;
    uint32 uiReconstruct_Timer;
    uint32 uiAwakenTimer;
    bool bWakeSpellHit;
    bool bWokenUp;
    bool bWakingUp;
    bool bAwake;
    ScriptedInstance* instance;

    void Reset()
    {
        uiArcing_Timer = 3000;
        uiTrample_Timer = urand(4000, 10000);
        uiReconstruct_Timer = urand(4000, 10000);
        uiAwakenTimer = 4000;
        bWakeSpellHit = false;
        bWokenUp = false;
        bWakingUp = false;
        bAwake = false;
    }
    
    void EnterEvadeMode()
    {
        Unit* target = me->SelectNearestHostileUnitInAggroRange(true);
        if (!target)
        {
            if (Unit* archaedas = Unit::GetUnit(*me, instance->GetData64(11)))
            {
                target = archaedas->getVictim();
            }
        }
        if (target)
        {
            AttackStart(target);
        }
    }

    void EnterCombat()
    {
        instance->SetData64(1, me->GetGUID()); // unfreeze
        bAwake = true;
        if (Unit* victim = me->SelectNearestTarget(80.0f))
        {
            AttackStart(victim);
        }
    }

    void SpellHit(Unit* /*caster*/, const SpellEntry* spell)
    {
        // time to wake up, start animation
        if (spell->Id == SPELL_AWAKEN_EARTHEN_DWARF
            || spell->Id == SPELL_AWAKEN_EARTHEN_GUARDIAN)
        {
            bWakeSpellHit = true;
            bWokenUp = true;
        }
        // SPELL_AWAKEN_VAULT_WARDER has 5s cast, wake when it lands
        else if (spell->Id == SPELL_AWAKEN_VAULT_WARDER)
        {
            bWakeSpellHit = true;
            EnterCombat();
        }
    }

    void MoveInLineOfSight(Unit* who)
    {
        if (bAwake)
        {
            ScriptedAI::MoveInLineOfSight(who);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (instance->GetData(ULDAMAN_ENCOUNTER_ARCHAEDAS) != IN_PROGRESS)
        {
            if (bWakeSpellHit)
                Reset();
            return;
        }
        // 1st phase of wake, wait for awakening spell to land 1s
        if (bWokenUp && uiAwakenTimer <= (uiDiff + 3000))
        {
            bWakingUp = true;
            me->CastSpell(me, SPELL_STONE_DWARF_AWAKEN, false);
            bWokenUp = false;
            uiAwakenTimer -= uiDiff;
            return; // do nothing for 2s
        }
        // 2d phase of wake, wait for visual spell 3s
        else if (bWakingUp && uiAwakenTimer <= uiDiff)
        {
            bWakingUp = false;
            // Wake him only if Archaedas is in combat
            if (instance->GetData(ULDAMAN_ENCOUNTER_ARCHAEDAS) == IN_PROGRESS)
                EnterCombat();
            uiAwakenTimer = 4000;
            return; // dont want to continue until we finish the AttackStart method
        }
        else if (bWokenUp || bWakingUp)
        {
            uiAwakenTimer -= uiDiff;
            return;
        }

        if (bAwake && m_creature->GetEntry() == NPC_EARTHEN_CUSTODIAN 
            && uiReconstruct_Timer <= uiDiff)
        {
            if (Unit* archaedas = Unit::GetUnit(*me, instance->GetData64(11)))
            {
                if (archaedas->GetHealthPercent() < 50.0f)
                {
                    DoCast(archaedas, SPELL_RECONSTRUCT);
                }
            }
            uiReconstruct_Timer = 10000;
        }
        else if (bAwake) uiReconstruct_Timer -= uiDiff;

        //Return since we have no target
        if (!UpdateVictim())
        {
            return;
        }
        
        if (m_creature->GetEntry() == NPC_VAULT_WARDER && uiTrample_Timer <= uiDiff)
        {
            DoCast(me->getVictim(), SPELL_TRAMPLE);
            uiTrample_Timer = 10000;
        }
        else uiTrample_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_archaedas_minions(Creature* creature)
{
    return new mob_archaedas_minionsAI(creature);
}

//This is the actual function called only once during InitScripts()
//It must define all handled functions that are to be run in this script
void AddSC_boss_archaedas()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_archaedas";
    newscript->GetAI = &GetAI_boss_archaedas;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_archaedas_minions";
    newscript->GetAI = &GetAI_mob_archaedas_minions;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "event_awaken_archaedas";
    newscript->pProcessEventId = &ProcessEventId_event_awaken_archaedas;
    newscript->RegisterSelf();
}
