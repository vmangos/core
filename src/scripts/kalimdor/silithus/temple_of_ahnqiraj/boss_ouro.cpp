/*
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 * Copyright (C) 2010-2011 ScriptDev0 <http://github.com/mangos-zero/scriptdev0>
 *
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
SDName: Boss_Ouro
SD%Complete: 90
SDComment: Some minor adjustments may be required
SDCategory: Temple of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"

enum
{
    // ground spells
    SPELL_SWEEP                = 26103,
    SPELL_SANDBLAST            = 26102,
    SPELL_BOULDER              = 26616,
    SPELL_BERSERK              = 26615,

    // emerge spells
    SPELL_BIRTH                = 26262,                        // The Birth Animation
    SPELL_GROUND_RUPTURE       = 26100,                        // spell not confirmed
    SPELL_SUMMON_BASE          = 26133,                        // summons gameobject 180795
    SPELL_DESPAWN_BASE         = 26594,

    // submerge spells
    SPELL_SUBMERGE_VISUAL      = 26063,
    SPELL_SUMMON_OURO_MOUNDS   = 26058,                     // summons 5 dirt mounds
    SPELL_SUMMON_TRIGGER       = 26284,

    // SPELL_SUMMON_OURO_TRIGG = 26642,
    SPELL_SUMMON_OURO          = 26061,                     // used by the script to summon the boss directly
    //SPELL_QUAKE              = 26093,

    // other spells - not used
    SPELL_SUMMON_SCARABS       = 26060,                     // triggered after 30 secs - cast by the Dirt Mounds
    SPELL_DIRTMOUND_PASSIVE    = 26092,                     // casts 26093 every 1 sec
    // SPELL_SET_OURO_HEALTH   = 26075,                     // removed from DBC
    // SPELL_SAVE_OURO_HEALTH  = 26076,                     // removed from DBC
    // SPELL_TELEPORT_TRIGGER  = 26285,                     // removed from DBC
    // SPELL_SUBMERGE_TRIGGER  = 26104,                     // removed from DBC
    SPELL_SUMMON_OURO_MOUND    = 26617,
    // SPELL_SCARABS_PERIODIC  = 26619,                     // cast by the Dirt Mounds in order to spawn the scarabs - removed from DBC

    // summoned npcs
    // NPC_OURO_SCARAB         = 15718,                  // summoned by Dirt Mounds
    NPC_OURO_TRIGGER           = 15717,
    NPC_DIRT_MOUND             = 15712,
};

struct boss_ouroAI : public Scripted_NoMovementAI
{
    boss_ouroAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiSweepTimer;
    uint32 m_uiSandBlastTimer;
    uint32 m_uiSubmergeTimer;
    uint32 m_uiSummonBaseTimer;
    uint32 m_uiNoMeleeTimer;

    uint32 m_uiSummonMoundTimer;

    bool m_bEnraged;
    bool m_bSubmerged;

    ObjectGuid m_ouroTriggerGuid;

    WorldLocation m_StartingLoc;

    void Reset()
    {
        m_uiSweepTimer        = urand(35000, 40000);
        m_uiSandBlastTimer    = urand(30000, 45000);
        m_uiSubmergeTimer     = 90000;
        m_uiSummonBaseTimer   = 2000;
        // Source : http://wowwiki.wikia.com/wiki/Ouro
        // "Ouro seems to give you about 10 seconds to get a MT in there when he pops up"
        m_uiNoMeleeTimer      = 10000;

        m_uiSummonMoundTimer  = 10000;

        m_bEnraged            = false;
        m_bSubmerged          = false;
    }

    void Aggro(Unit* /*pWho*/)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_OURO, IN_PROGRESS);

        m_creature->GetPosition(m_StartingLoc);
    }

    void DespawnCreatures(bool ShouldDespawnScarabs)
    {
        std::list<Creature *> lCreature;
        m_creature->GetCreatureListWithEntryInGrid(lCreature, NPC_DIRT_MOUND, 250.0f);
        if (ShouldDespawnScarabs)
            m_creature->GetCreatureListWithEntryInGrid(lCreature, NPC_OURO_SCARAB, 250.0f);
        for (std::list<Creature *>::iterator itr = lCreature.begin(); itr != lCreature.end(); ++itr)
            (*itr)->ForcedDespawn();
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_OURO, FAIL);

        DespawnCreatures(true);
        m_creature->CastSpell(m_creature, SPELL_DESPAWN_BASE, true);

        Submerge(true);
        m_creature->ForcedDespawn();
    }

    void JustDied(Unit* /*pKiller*/)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_OURO, DONE);

        m_creature->CastSpell(m_creature, SPELL_DESPAWN_BASE, true);
    }

    void JustSummoned(Creature* pSummoned)
    {
        switch (pSummoned->GetEntry())
        {
        case NPC_OURO_TRIGGER:
            float rx;
            float ry;
            float rz;
            m_ouroTriggerGuid = pSummoned->GetObjectGuid();
            pSummoned->GetRandomPoint(m_StartingLoc.coord_x,
                                      m_StartingLoc.coord_y,
                                      m_StartingLoc.coord_z,
                                      50.0f, rx, ry, rz);
            pSummoned->NearTeleportTo(rx, ry, rz, 0);
        }
    }

    void SummonedCreatureDespawn(Creature* pSummoned)
    {
        if (pSummoned->GetEntry() == NPC_DIRT_MOUND)
            pSummoned->CastSpell(m_creature, SPELL_SUMMON_SCARABS, true);
    }

    void Submerge(bool isReset = false)
    {
        // Source : http://wowwiki.wikia.com/wiki/Ouro
        // "Ouro has a chance to submerge every 1.5minutes.
        // He will not submerge if he is busy casting a Sand Blast or Sweep, else he will submerge
        // (ie. the chance of submerging is totally random)"
        m_uiSubmergeTimer = 90000;
        if (CanCastSpell(m_creature, sSpellMgr.GetSpellEntry(SPELL_SUBMERGE_VISUAL), false) == CAST_OK)
        {
            if (!isReset)
            {
                DoCastSpellIfCan(m_creature, SPELL_SUMMON_OURO_MOUNDS, CAST_TRIGGERED);
                DoCastSpellIfCan(m_creature, SPELL_SUMMON_TRIGGER, CAST_TRIGGERED);
            }
            m_creature->CastSpell(m_creature, SPELL_DESPAWN_BASE, true);
            DoCastSpellIfCan(m_creature, SPELL_SUBMERGE_VISUAL);

            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            ClearTargetIcon();

            m_bSubmerged      = true;
            m_uiSubmergeTimer = 30000;
            m_uiNoMeleeTimer  = 10000;

        }
    }

    void SetNewTarget(Unit &pNewTarget)
    {
        const uint32 uiMaxThreat = m_creature->getThreatManager().getThreat(m_creature->getVictim());

        // erase current target's threat as soon as we switch the target now
        m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(), -100);

        // give the new target aggro
        m_creature->getThreatManager().addThreat(&pNewTarget, uiMaxThreat);
    }


    bool CheckForMelee()
    {
        // at first we check for the current player-type target
        Unit* pMainTarget = m_creature->getVictim();
        if (pMainTarget->GetTypeId() == TYPEID_PLAYER && !pMainTarget->ToPlayer()->isGameMaster() &&
            m_creature->IsWithinMeleeRange(pMainTarget) && m_creature->IsWithinLOSInMap(pMainTarget))
        {
            return true;
        }

        // at second we look for any melee player-type target (if current target is not reachable)
        if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 0, nullptr,
            SELECT_FLAG_PLAYER_NOT_GM | SELECT_FLAG_IN_LOS | SELECT_FLAG_IN_MELEE_RANGE))
        {
            SetNewTarget(*pTarget);
            return true;
        }

        // reaching this point means there are no more reachable player-type targets in melee range

        // at third we take any melee pet target just to punch in the face
        if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 0, nullptr,
            SELECT_FLAG_PET | SELECT_FLAG_IN_LOS | SELECT_FLAG_IN_MELEE_RANGE))
        {
            SetNewTarget(*pTarget);
            return false;
        }

        // at fourth we take anything to wipe it out and log (whatever, just in case)
        if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 0, nullptr,
            SELECT_FLAG_NOT_PLAYER | SELECT_FLAG_IN_LOS | SELECT_FLAG_IN_MELEE_RANGE))
        {
            SetNewTarget(*pTarget);
        }
        return false;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        // Return since we have no pTarget
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!m_bSubmerged)
        {
            // Summon sandworm base
            if (m_uiSummonBaseTimer)
            {
                if (m_uiSummonBaseTimer <= uiDiff)
                {
                    // Note: server side spells should be cast directly
                    m_creature->CastSpell(m_creature, SPELL_SUMMON_BASE, true);
                    // Cast Despawn base to trigger spawn anim
                    m_creature->CastSpell(m_creature, SPELL_DESPAWN_BASE, true);
                    m_uiSummonBaseTimer = 0;
                }
                else
                    m_uiSummonBaseTimer -= uiDiff;
            }

            // Sweep
            if (m_uiSweepTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_SWEEP) == CAST_OK)
                    m_uiSweepTimer = 20000;
            }
            else
                m_uiSweepTimer -= uiDiff;

            // Sand Blast
            if (m_uiSandBlastTimer < uiDiff)
	    {
                if (DoCastSpellIfCan(m_creature, SPELL_SANDBLAST) == CAST_OK)
                    m_uiSandBlastTimer = 22000;
            }
            else
                m_uiSandBlastTimer -= uiDiff;

            if (!m_bEnraged)
            {
                // Enrage at 20% HP
                if (m_creature->GetHealthPercent() < 20.0f)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_BERSERK) == CAST_OK)
                    {
                        m_bEnraged = true;
                        return;
                    }
                }

                // Submerge
                if (m_uiSubmergeTimer < uiDiff)
                {
                    Submerge();
                }
                else
                    m_uiSubmergeTimer -= uiDiff;
            }
            else
            {
                // Summon 1 mound every 10 secs when enraged
                if (m_uiSummonMoundTimer < uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_SUMMON_OURO_MOUND) == CAST_OK)
                        m_uiSummonMoundTimer = 10000;
                }
                else
                    m_uiSummonMoundTimer -= uiDiff;
            }

            // every tick we check for melee targets to attack
            if (CheckForMelee())
            {
                m_uiNoMeleeTimer = 3000;
            }

            // If we are within range melee the target
            if (m_creature->CanReachWithMeleeAttack(m_creature->getVictim()))
            {
                DoMeleeAttackIfReady();
            }
            // Spam Boulder spell when enraged and not tanked
            else if (m_bEnraged)
            {
                if (!m_creature->IsNonMeleeSpellCasted(false))
                {
                    if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                        DoCastSpellIfCan(pTarget, SPELL_BOULDER);
                }
            }
            // Submerge if no melee and not enraged
            else if (m_uiNoMeleeTimer < uiDiff)
            {
                Submerge();
            }
            else
                m_uiNoMeleeTimer -= uiDiff;
        }
        else
        {
            // Resume combat
            if (m_uiSubmergeTimer < uiDiff)
            {
                // Teleport to the trigger in order to get a new location
                if (Creature* pTrigger = m_creature->GetMap()->GetCreature(m_ouroTriggerGuid))
                    m_creature->NearTeleportTo(pTrigger->GetPositionX(), pTrigger->GetPositionY(), pTrigger->GetPositionZ(), 0);

                if (DoCastSpellIfCan(m_creature, SPELL_BIRTH) == CAST_OK)
                {
                    //DoCastSpellIfCan(m_creature, SPELL_SUMMON_SCARABS, CAST_TRIGGERED);

                    m_creature->RemoveAurasDueToSpell(SPELL_SUBMERGE_VISUAL);
                    m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

                    m_bSubmerged        = false;
                    m_uiSummonBaseTimer = 2000;
                    m_uiSubmergeTimer   = 90000;

                    DespawnCreatures(false);

                    // Ouro should despawn instant on reset, not after going to his spawn point
                    m_creature->SetHomePosition(
                        m_creature->GetPositionX(),
                        m_creature->GetPositionY(),
                        m_creature->GetPositionZ(),
                        m_creature->GetOrientation());
                }
            }
            else
                m_uiSubmergeTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_boss_ouro(Creature* pCreature)
{
    return new boss_ouroAI(pCreature);
}

struct npc_ouro_spawnerAI : public Scripted_NoMovementAI
{
    npc_ouro_spawnerAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature) {Reset();}

    bool m_bHasSummoned;

    void Reset()
    {
        m_bHasSummoned = false;

        DoCastSpellIfCan(m_creature, SPELL_DIRTMOUND_PASSIVE);
    }

    void Aggro(Unit* /*pWho*/)
    {
        if (!m_bHasSummoned)
        {
            DoCastSpellIfCan(m_creature, SPELL_SUMMON_OURO, CAST_TRIGGERED);
            m_bHasSummoned = true;
        }
    }

    void JustSummoned(Creature* pSummoned)
    {
        // Despawn when Ouro is spawned
        if (pSummoned->GetEntry() == NPC_OURO)
        {
            pSummoned->CastSpell(pSummoned, SPELL_BIRTH, false);
            pSummoned->SetInCombatWithZone();
            m_creature->ForcedDespawn();
        }
    }

    void UpdateAI(const uint32 /*uiDiff*/) { }
};

CreatureAI* GetAI_npc_ouro_spawner(Creature* pCreature)
{
    return new npc_ouro_spawnerAI(pCreature);
}

struct npc_dirt_moundAI : public ScriptedAI
{
    npc_dirt_moundAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    uint32 m_uiChangeTargetTimer;
    ObjectGuid TargetGUID;

    void Reset()
    {
        m_uiChangeTargetTimer = urand(0, 5000);
	TargetGUID.Clear();

        DoCastSpellIfCan(m_creature, SPELL_DIRTMOUND_PASSIVE);
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!TargetGUID && who->GetTypeId() == TYPEID_PLAYER)
	{
  	    TargetGUID = who->GetGUID();
	}
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiChangeTargetTimer < uiDiff)
	{
	    if (Unit* pTarget = m_creature->GetMap()->GetUnit(TargetGUID))
	    {
                m_creature->GetMotionMaster()->MoveFollow(pTarget, 0.0f, 0.0f);
                TargetGUID.Clear();
	    }
	    else
	    {
	        m_creature->GetMotionMaster()->MoveRandom();
	    }
	    m_uiChangeTargetTimer = urand(0, 10000);
	}
	else
	  m_uiChangeTargetTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_dirt_mound(Creature* pCreature)
{
    return new npc_dirt_moundAI(pCreature);
}

struct npc_ouro_scarabAI : public ScriptedAI
{
    npc_ouro_scarabAI(Creature* pCreature) : ScriptedAI(pCreature) {}

    void Reset()
    {
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && !m_creature->getVictim())
	{
            AttackStart(who);
	}
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_creature->getVictim())
            DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_ouro_scarab(Creature* pCreature)
{
    return new npc_ouro_scarabAI(pCreature);
}

struct go_sandworm_baseAI: public GameObjectAI
{
    go_sandworm_baseAI(GameObject* pGo) : GameObjectAI(pGo), m_bActive(true) {}

    bool m_bActive;

    bool OnUse(Unit* pUser)
    {
        WorldLocation loc;
        pUser->GetPosition(loc);
        me->Relocate(
            loc.coord_x,
            loc.coord_y,
            loc.coord_z,
            loc.orientation);
        if (m_bActive)
        {
            m_bActive = false;
            me->SendGameObjectCustomAnim(me->GetObjectGuid());
            /*
            me->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
            me->SetLootState(GO_ACTIVATED);
            */
        }
        else
        {
            me->SetRespawnTime(0);
            me->Delete();
        }
        return false;
    }
};

GameObjectAI* GetAIgo_sandworm_base(GameObject *pGo)
{
    return new go_sandworm_baseAI(pGo);
}

void AddSC_boss_ouro()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_ouro";
    pNewScript->GetAI = &GetAI_boss_ouro;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_ouro_spawner";
    pNewScript->GetAI = &GetAI_npc_ouro_spawner;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_dirt_mound";
    pNewScript->GetAI = &GetAI_npc_dirt_mound;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_ouro_scarab";
    pNewScript->GetAI = &GetAI_npc_ouro_scarab;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "go_sandworm_base";
    pNewScript->GOGetAI = &GetAIgo_sandworm_base;
    pNewScript->RegisterSelf();
}
