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

/*
 * Sand Blast and sweep timers are based on June 2006 values (20-25s) as shown in
 * https://www.youtube.com/watch?v=REmX3uRTFkQ. The video is slightly sped up, so time was counted by the ticking of buffs on the player.
 * More confirmation from classic sniffs https://i.imgur.com/YIA8veT.png
 */
const uint32_t SUBMERGE_ANIMATION_INVIS    = 2000;
const uint32_t SWEEP_TIMER                 = 20500;

struct boss_ouroAI : public ScriptedAI
{
    boss_ouroAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiSweepTimer;
    uint32 m_uiSandBlastTimer;
    uint32 m_uiRestoreTargetTimer;
    uint32 m_uiSubmergeTimer;
    bool m_SummonBase;
    uint32 m_uiNoMeleeTimer;
    uint32 m_uiSubmergeInvisTimer;
    uint32 m_justEmergedGraceTimer;
    uint32 m_uiSummonMoundTimer;

    bool m_bEnraged;
    bool m_bSubmerged;

    ObjectGuid m_ouroTriggerGuid;

    WorldLocation m_StartingLoc;

    // Take nerfs into account http://blue.cardplace.com/cache/wow-dungeons/481724.htm for content patch progression
    // Note: Investigate if these timers are 100% accurate.
    inline uint32_t SandBlastTimerMin() { return sWorld.GetWowPatch() >= WOW_PATCH_110 ? 20000 : 12000; }
    inline uint32_t SandBlastTimerMax() { return sWorld.GetWowPatch() >= WOW_PATCH_110 ? 25000 : 17000; }
    inline uint32_t SubmergeTimer() { return sWorld.GetWowPatch() >= WOW_PATCH_110 ? 90000 : 60000; }

    void Reset() override
    {
        // This makes the mob behave like rooted mobs etc, that is,
        // retargetting another top-threat target if current leaves melee range
        m_creature->AddUnitState(UNIT_STAT_ROOT);
        m_creature->StopMoving();
        m_creature->SetRooted(true);
        
        m_uiSweepTimer          = SWEEP_TIMER;
        m_uiSandBlastTimer      = urand(SandBlastTimerMin(), SandBlastTimerMax());
        m_uiRestoreTargetTimer  = 0;
        m_uiSubmergeTimer       = SubmergeTimer();
        m_SummonBase            = true;
        m_uiSubmergeInvisTimer  = SUBMERGE_ANIMATION_INVIS;

        m_uiNoMeleeTimer        = 3000;
        // Source : http://wowwiki.wikia.com/wiki/Ouro
        // "Ouro seems to give you about 10 seconds to get a MT in there when he pops up"
        m_justEmergedGraceTimer = 10000;

        m_uiSummonMoundTimer    = 10000;
        m_bEnraged              = false;
        m_bSubmerged            = false;


        m_ouroTriggerGuid.Clear();
    }

    void Aggro(Unit* /*pWho*/) override
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
        for (const auto& itr : lCreature)
            itr->ForcedDespawn();
    }

    void JustReachedHome() override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_OURO, FAIL);

        DespawnCreatures(true);
        m_creature->CastSpell(m_creature, SPELL_DESPAWN_BASE, true);

        Submerge(true);
        m_creature->ForcedDespawn(2000);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_OURO, DONE);

        m_creature->CastSpell(m_creature, SPELL_DESPAWN_BASE, true);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        switch (pSummoned->GetEntry())
        {
        case NPC_OURO_TRIGGER:
            m_ouroTriggerGuid = pSummoned->GetGUID();
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                pSummoned->GetMotionMaster()->MoveFollow(pTarget, 0.0f, 0.0f);
            break;
        }
    }

    void SpellHitTarget(Unit* pTarget, SpellEntry const* pSpell) override
    {
        if (pSpell->Id == SPELL_SANDBLAST && pTarget)
        {
            if (m_creature->GetThreatManager().getThreat(pTarget))
                m_creature->GetThreatManager().modifyThreatPercent(pTarget, -100);
        }
    }

    void Submerge(bool isReset = false)
    {
        // Source : http://wowwiki.wikia.com/wiki/Ouro
        // "Ouro has a chance to submerge every 1.5minutes.
        // He will not submerge if he is busy casting a Sand Blast or Sweep, else he will submerge
        // (ie. the chance of submerging is totally random)"
        m_uiSubmergeTimer = SubmergeTimer();

        if (DoCastSpellIfCan(m_creature, SPELL_SUBMERGE_VISUAL, false) == CAST_OK)
        {
            if (!isReset)
            {
                DoCastSpellIfCan(m_creature, SPELL_SUMMON_OURO_MOUNDS, CF_TRIGGERED);
                DoCastSpellIfCan(m_creature, SPELL_SUMMON_TRIGGER, CF_TRIGGERED);
            }

            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_SPAWNING);
            ClearTargetIcon();

            m_bSubmerged      = true;
            m_uiSubmergeTimer = 30000;
            
            m_justEmergedGraceTimer = 10000;
            m_uiNoMeleeTimer        = 10000; // This has to be 10 sec and not 3 sec. Otherwise sometimes, if CanReachWithMeleeAutoAttack returns false for a whole 3 seconds, NoMeleeTimer will never be set to equal grace timer, and grace timer won't work.
            m_uiSubmergeInvisTimer = SUBMERGE_ANIMATION_INVIS;
            DoResetThreat();
        }
    }
    
    // Threat is preserved when Ouro swaps target. The only mechanics that affect threat are being hit by sandblast, and the threat wipe on submerge.
    void UpdateAI(uint32 const uiDiff) override
    {
        // This is to let Ouro reset when he enters evade mode. Because rooted mobs don't reset when they evade until their root is removed.
        if (m_creature->IsInEvadeMode())
        {
            m_creature->ClearUnitState(UNIT_STAT_ROOT);
            m_creature->SetRooted(false);
        }
        else
        {
            m_creature->AddUnitState(UNIT_STAT_ROOT);
            m_creature->StopMoving();
            m_creature->SetRooted(true);
        }
        
        // Return since we have no pTarget
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (!m_bSubmerged)
        {
            // Summon sandworm base
            if (m_SummonBase)
            {
                // Note: server side spells should be cast directly
                m_creature->CastSpell(m_creature, SPELL_SUMMON_BASE, true);
                // Cast Despawn base to trigger spawn anim
                m_creature->CastSpell(m_creature, SPELL_DESPAWN_BASE, true);
                m_SummonBase = false;
            }

            // Sweep
            if (m_uiSweepTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_SWEEP) == CAST_OK)
                    m_uiSweepTimer = SWEEP_TIMER;
            }
            else
                m_uiSweepTimer -= uiDiff;

            // Sand Blast
            if (m_uiSandBlastTimer < uiDiff)
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 0, SPELL_SANDBLAST, SELECT_FLAG_PLAYER))
                {
                    // Ouro visually targets the victim of Sand Blast for its whole 2 second cast time.
                    m_creature->SetInFront(pTarget);
                    m_creature->SetTargetGuid(pTarget->GetObjectGuid());
                    if (DoCastSpellIfCan(pTarget, SPELL_SANDBLAST) == CAST_OK)
                    {
                        m_uiSandBlastTimer = urand(SandBlastTimerMin(), SandBlastTimerMax());
                        m_uiRestoreTargetTimer = 2100; // 2 second timer to swap visual target back to the tank. With 100ms grace window to make sure the visual animation of the boss spitting sand is facing the right direction.
                    }
                }
            }
            else
                m_uiSandBlastTimer -= uiDiff;

            // Get new visual target after casting Sand Blast at the highest threat. (If highest threat was not the melee tank -such as the case of ranged tanks soaking sand blasts-, this is to swap the visual target back to the melee tank)
            if (m_uiRestoreTargetTimer)
            {
                if (m_uiRestoreTargetTimer <= uiDiff)
                {
                    if (Unit* pTarget = m_creature->GetVictim())
                    {
                        m_creature->SetInFront(pTarget);
                        m_creature->SetTargetGuid(pTarget->GetObjectGuid());
                        m_uiRestoreTargetTimer = 0;
                    }
                }
                else
                m_uiRestoreTargetTimer -= uiDiff;
            }
            
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

            // Because the mob is rooted, target selection is handled automatically by rooted mob AI. All we have to do is we check if the target is in melee range. If it is, autoattack it and refresh the submerge timer.
            if (m_creature->CanReachWithMeleeAutoAttack(m_creature->GetVictim()))
            {
                DoMeleeAttackIfReady();
                m_uiNoMeleeTimer = std::max((uint32)3000, m_justEmergedGraceTimer);
            }
            
            // Spam Boulder spell when enraged and not tanked
            // Todo: Find out if he he starts bouldering the moment he's not tanked, or after the 3 sec nomeleetimer has passed.
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
            else if (m_uiRestoreTargetTimer <= 0) // Submerge timer only ticks down if Ouro is not casting Sandblast
                m_uiNoMeleeTimer -= uiDiff;
            
            m_justEmergedGraceTimer -= std::min(uiDiff, m_justEmergedGraceTimer);
        }
        else
        {
            // Resume combat
            if (m_uiSubmergeTimer < uiDiff)
            {
                m_creature->SetVisibility(VISIBILITY_ON);
                m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_SPAWNING);

                // Teleport to the trigger in order to get a new location
                if (Creature* pTrigger = m_creature->GetMap()->GetCreature(m_ouroTriggerGuid))
                    m_creature->NearTeleportTo(pTrigger->GetPosition());

                if (DoCastSpellIfCan(m_creature, SPELL_BIRTH) == CAST_OK)
                {
                    //DoCastSpellIfCan(m_creature, SPELL_SUMMON_SCARABS, CF_TRIGGERED);

                    m_creature->RemoveAurasDueToSpell(SPELL_SUBMERGE_VISUAL);
                    m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

                    std::list<Unit*> lGroundRuptureTargets;
                    ThreatList const& lThreat = m_creature->GetThreatManager().getThreatList();
                    for (const auto i : lThreat)
                    {
                        Unit* pUnit = m_creature->GetMap()->GetUnit(i->getUnitGuid());
                        if (pUnit && pUnit->GetDistance2d(m_creature) < 20.0f)
                            lGroundRuptureTargets.push_back(pUnit);
                    }
                    for (const auto& target : lGroundRuptureTargets)
                        m_creature->CastSpell(target, SPELL_GROUND_RUPTURE, true);

                    m_bSubmerged        = false;
                    m_SummonBase = true;
                    m_uiSubmergeTimer   = SubmergeTimer();
                    m_uiSubmergeInvisTimer = SUBMERGE_ANIMATION_INVIS;
                    m_uiSweepTimer = SWEEP_TIMER;
                    m_uiSandBlastTimer = urand(SandBlastTimerMin(), SandBlastTimerMax());
                    
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
            {
                if (m_creature->GetVisibility() == VISIBILITY_ON)
                {
                    if (m_uiSubmergeInvisTimer < uiDiff)
                    {
                        m_creature->SetVisibility(VISIBILITY_OFF);
                    }
                    else
                    {
                        m_uiSubmergeInvisTimer -= uiDiff;
                    }
                }

                m_uiSubmergeTimer -= uiDiff;
            }
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

    void Reset() override
    {
        m_bHasSummoned = false;

        DoCastSpellIfCan(m_creature, SPELL_DIRTMOUND_PASSIVE);
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        // Spawn Ouro on LoS check
        if (!m_bHasSummoned && pWho->GetTypeId() == TYPEID_PLAYER && !((Player*)pWho)->IsGameMaster() && m_creature->IsWithinDistInMap(pWho, 25.0f))
        {
            if (DoCastSpellIfCan(m_creature, SPELL_SUMMON_OURO) == CAST_OK)
            {
                m_bHasSummoned = true;
            }
        }

        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        // Despawn when Ouro is spawned
        if (pSummoned->GetEntry() == NPC_OURO)
        {
            pSummoned->CastSpell(pSummoned, SPELL_BIRTH, false);
            pSummoned->SetInCombatWithZone();
            m_creature->ForcedDespawn();
        }
    }

    void UpdateAI(uint32 const /*uiDiff*/) override { }
};

CreatureAI* GetAI_npc_ouro_spawner(Creature* pCreature)
{
    return new npc_ouro_spawnerAI(pCreature);
}

struct npc_dirt_moundAI : public ScriptedAI
{
    npc_dirt_moundAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    uint32 m_uiChangeTargetTimer;
    uint32 m_uiDespawnTimer;
    ObjectGuid m_TargetGUID;
    ObjectGuid m_CurrentTargetGUID;

    void JustRespawned() override
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_SPAWNING);
        ScriptedAI::JustRespawned();
    }

    void Reset() override
    {
        m_uiDespawnTimer = 30000;
        m_TargetGUID.Clear();
        m_CurrentTargetGUID.Clear();

        DoCastSpellIfCan(m_creature, SPELL_DIRTMOUND_PASSIVE);
    }

    void MoveInLineOfSight(Unit *who) override
    {
        if (!m_TargetGUID && who->GetTypeId() == TYPEID_PLAYER)
        {
            m_TargetGUID = who->GetGUID();
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        Unit *pTarget = m_creature->GetMap()->GetUnit(m_CurrentTargetGUID);
        bool const bForceChangeTarget = !pTarget || pTarget->IsDead()
            || pTarget->IsImmuneToDamage(SPELL_SCHOOL_MASK_NATURE);

        if (bForceChangeTarget || m_uiChangeTargetTimer < uiDiff)
        {
            m_CurrentTargetGUID.Clear();

            if (Unit* pTarget = m_creature->GetMap()->GetUnit(m_TargetGUID))
            {
                m_creature->GetMotionMaster()->MoveFollow(pTarget, 0.0f, 0.0f);
                m_CurrentTargetGUID = m_TargetGUID;
                m_TargetGUID.Clear();
            }
            else
            {
                m_creature->GetMotionMaster()->MoveRandom();
            }
            m_uiChangeTargetTimer = urand(0, 10000);
        }
        else
            m_uiChangeTargetTimer -= uiDiff;

        if (m_uiDespawnTimer < uiDiff)
        {
            m_creature->CastSpell(m_creature, SPELL_SUMMON_SCARABS, true);
            m_creature->ForcedDespawn();
        }
        else
        {
            m_uiDespawnTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_npc_dirt_mound(Creature* pCreature)
{
    return new npc_dirt_moundAI(pCreature);
}

struct npc_ouro_scarabAI : public ScriptedAI
{
    npc_ouro_scarabAI(Creature* pCreature) : ScriptedAI(pCreature) { Reset(); }

    uint32 m_uiDespawnTimer;

    void Reset() override
    {
        m_uiDespawnTimer = 45000;
    }

    void MoveInLineOfSight(Unit *who) override
    {
        if (who->GetTypeId() == TYPEID_PLAYER && !m_creature->GetVictim() && !urand(0, 5))
        {
            AttackStart(who);
        }
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_creature->GetVictim())
            DoMeleeAttackIfReady();

        if (m_uiDespawnTimer < uiDiff)
            m_creature->ForcedDespawn();
        else
            m_uiDespawnTimer -= uiDiff;
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

    bool OnUse(Unit* pUser) override
    {
        WorldLocation loc;
        pUser->GetObjectScale();
        pUser->GetPosition(loc);

        if (m_bActive)
        {
            m_bActive = false;
            me->SendGameObjectCustomAnim();
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
