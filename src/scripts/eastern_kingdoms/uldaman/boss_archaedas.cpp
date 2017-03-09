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
At 66%, he will awaken the 6 Guardians.
At 33%, he will awaken the Vault Walkers
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

enum eSpells
{
    SPELL_GROUND_TREMOR             = 6524,
    SPELL_ARCHAEDAS_AWAKEN          = 10347,
    SPELL_BOSS_OBJECT_VISUAL        = 11206,
    SPELL_BOSS_AGGRO                = 10340,
    SPELL_SUB_BOSS_AGGRO            = 11568,
    SPELL_AWAKEN_VAULT_WALKER       = 10258,
    SPELL_AWAKEN_EARTHEN_GUARDIAN   = 10252,
    SPELL_STONED                    = 10255
};

struct boss_archaedasAI : public ScriptedAI
{
    boss_archaedasAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        instance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* instance;

    uint32 uiTremorTimer;
    int32 iAwakenTimer;
    uint32 uiWallMinionTimer;
    bool bWakingUp;
    bool bGuardiansAwake;
    bool bVaultWalkersAwake;

    void Reset()
    {
        uiTremorTimer = 60000;
        iAwakenTimer = 0;
        uiWallMinionTimer = 10000;
        bWakingUp = false;
        bGuardiansAwake = false;
        bVaultWalkersAwake = false;

        if (instance)
        {
            instance->SetData(DATA_MINIONS, SPECIAL);
            instance->SetData(DATA_MINIONS, NOT_STARTED); // respawn any dead minions
            instance->SetData(DATA_STONE_KEEPERS, IN_PROGRESS);
        }

        m_creature->setFaction(35);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NOT_SELECTABLE);
        m_creature->CastSpell(m_creature, SPELL_STONED, false);
    }

    void ActivateMinion(uint64 uiGuid, bool bFlag)
    {
        Unit* pMinion = Unit::GetUnit(*me, uiGuid);
        if (pMinion && pMinion->isAlive())
        {
            me->CastSpell(pMinion, SPELL_AWAKEN_VAULT_WALKER, bFlag);
            pMinion->CastSpell(pMinion, SPELL_ARCHAEDAS_AWAKEN, true);
        }
    }

    void EnterCombat(Unit*)
    {
        me->RemoveAurasDueToSpell(SPELL_STONED);
        me->setFaction(14);
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
        instance->SetData(DATA_ANCIENT_DOOR, IN_PROGRESS); // open the vault door
    }

    void SpellHit(Unit* /*caster*/, const SpellEntry* spell)
    {
        // Being woken up from the altar, start the awaken sequence
        if (spell->Id == SPELL_ARCHAEDAS_AWAKEN)
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

    void UpdateAI(const uint32 uiDiff)
    {
        if (!instance)
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
            if (Unit* target = Unit::GetUnit(*me, instance->GetData64(0)))
                AttackStart(target);
            return; // dont want to continue until we finish the AttackStart method
        }

        //Return since we have no target
        if (!UpdateVictim())
            return;

        // wake a wall minion
        if (uiWallMinionTimer <= uiDiff)
        {
            instance->SetData(DATA_MINIONS, IN_PROGRESS);
            uiWallMinionTimer = 10000;
        }
        else uiWallMinionTimer -= uiDiff;

        //If we are <66 summon the guardians
        if (!bGuardiansAwake && me->GetHealthPercent() <= 66.0f)
        {
            ActivateMinion(instance->GetData64(5), true); // EarthenGuardian1
            ActivateMinion(instance->GetData64(6), true); // EarthenGuardian2
            ActivateMinion(instance->GetData64(7), true); // EarthenGuardian3
            ActivateMinion(instance->GetData64(8), true); // EarthenGuardian4
            ActivateMinion(instance->GetData64(9), true); // EarthenGuardian5
            ActivateMinion(instance->GetData64(10), false); // EarthenGuardian6
            me->MonsterYell(SAY_SUMMON, LANG_UNIVERSAL, 0);
            DoPlaySoundToSet(me, SOUND_SUMMON);
            bGuardiansAwake = true;
        }

        //If we are <33 summon the vault walkers
        if (!bVaultWalkersAwake && me->GetHealthPercent() <= 33.0f)
        {
            ActivateMinion(instance->GetData64(1), true); // VaultWalker1
            ActivateMinion(instance->GetData64(2), true); // VaultWalker2
            me->MonsterYell(SAY_SUMMON2, LANG_UNIVERSAL, 0);
            DoPlaySoundToSet(me, SOUND_SUMMON2);
            bVaultWalkersAwake = true;
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
        instance->SetData(DATA_ANCIENT_DOOR, FAIL); // open the vault door
        ScriptedAI::EnterEvadeMode();
    }
    void JustDied(Unit* /*killer*/)
    {
        if (instance)
        {
            instance->SetData(DATA_ANCIENT_DOOR, DONE); // open the vault door
            instance->SetData(DATA_MINIONS, SPECIAL); // deactivate his minions
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

#define SPELL_ARCHAEDAS_AWAKEN  10347
#define SPELL_TRAMPLE           5568

struct mob_archaedas_minionsAI : public ScriptedAI
{
    mob_archaedas_minionsAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        instance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_creature->CastSpell(m_creature, SPELL_STONED, false);
        Reset();
    }

    uint32 uiArcing_Timer;
    uint32 uiTrample_Timer;
    int32 iAwakenTimer;
    bool bWakingUp;
    bool bAmIAwake;
    ScriptedInstance* instance;

    void Reset()
    {
        uiArcing_Timer = 3000;
        uiTrample_Timer = urand(4000, 10000);
        iAwakenTimer = 0;
        bWakingUp = false;
        bAmIAwake = false;
        me->setFaction(35);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
        m_creature->CastSpell(m_creature, SPELL_STONED, false);
        //me->RemoveAllAuras();
    }

    void EnterCombat()
    {
        me->setFaction(14);
        me->RemoveAllAuras();
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
        bAmIAwake = true;
    }

    void SpellHit(Unit* /*caster*/, const SpellEntry* spell)
    {
        // time to wake up, start animation
        if (spell->Id == SPELL_ARCHAEDAS_AWAKEN)
        {
            iAwakenTimer = 5000;
            bWakingUp = true;
        }
    }

    void MoveInLineOfSight(Unit* who)
    {
        if (bAmIAwake)
            ScriptedAI::MoveInLineOfSight(who);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        // we're still in the awaken animation
        if (bWakingUp && iAwakenTimer >= 0)
        {
            iAwakenTimer -= uiDiff;
            return; // dont do anything until we are done
        }
        else if (bWakingUp && iAwakenTimer <= 0)
        {
            bWakingUp = false;
            bAmIAwake = true;
            EnterCombat();
            if (Unit* victim = me->SelectNearestTarget(80.0f))
                me->AI()->AttackStart(victim);
            return; // dont want to continue until we finish the AttackStart method
        }

        //Return since we have no target
        if (!UpdateVictim())
            return;

        if (m_creature->GetEntry() == 10120 && uiTrample_Timer <= uiDiff)
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

/* ScriptData
SDName: mob_stonekeepers
SD%Complete: 100
SDComment: After activating the altar of the keepers, the stone keepers will
wake up one by one.
EndScriptData */

#define SPELL_SELF_DESTRUCT 9874

struct mob_stonekeepersAI : public ScriptedAI
{
    mob_stonekeepersAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        instance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* instance;

    void Reset()
    {
        me->setFaction(35);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
        me->RemoveAllAuras();
    }

    void Aggro(Unit* pWho)
    {
        me->setFaction(14);
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!UpdateVictim())
            return;
        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* pWho)
    {
        me->CastSpell(me, SPELL_SELF_DESTRUCT, true);
        if (instance)
            instance->SetData(DATA_STONE_KEEPERS, IN_PROGRESS);
    }
};

CreatureAI* GetAI_mob_stonekeepers(Creature* m_creature)
{
    return new mob_stonekeepersAI(m_creature);
}

/* ScriptData
SDName: go_altar_archaedas
SD%Complete: 100
SDComment: Needs 1 person to activate the Archaedas script
SDCategory: Uldaman
EndScriptData */

#define SPELL_BOSS_OBJECT_VISUAL 11206

bool GOHello_go_altar_of_archaedas(Player* pPlayer, GameObject* pGo)
{
    if (ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData())
    {
        pInstance->SetData(DATA_STONE_KEEPERS, IN_PROGRESS);
        pPlayer->CastSpell(pPlayer, SPELL_BOSS_OBJECT_VISUAL, false);
        pInstance->SetData64(0, pPlayer->GetGUID()); // activate archaedas
    }
    return false;
}

//This is the actual function called only once durring InitScripts()
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
    newscript->Name = "mob_stonekeepers";
    newscript->GetAI = &GetAI_mob_stonekeepers;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_altar_of_archaedas";
    newscript->pGOHello = &GOHello_go_altar_of_archaedas;
    newscript->RegisterSelf();
}
