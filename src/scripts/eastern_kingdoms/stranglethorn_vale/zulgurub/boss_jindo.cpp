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
SDName: Boss Jin'do the Hexxer
SD%Complete: 100
SDCategory: Zul'Gurub
EndScriptData */

#include "scriptPCH.h"
#include "zulgurub.h"

enum
{
    SAY_AGGRO                       = 10449,

    SPELL_BRAIN_WASH_TOTEM          = 24262,
    SPELL_POWERFULL_HEALING_WARD    = 24309,
    SPELL_HEX                       = 17172,
    SPELL_DELUSIONS_OF_JINDO        = 24306,
    SPELL_SHADE_OF_JINDO            = 24308,
    SPELL_BANISH                    = 24466,
    // Brainwash Totem spells
    SPELL_BRAINWASH                 = 24261,
    // Healing Ward spells
    SPELL_HEAL                      = 24311,
    // Shade of Jindo spells
    SPELL_SHADOWSHOCK               = 24458,
    SPELL_INVISIBLE                 = 24307,

    NPC_SHADE                       = 14986,
    NPC_BRAINWASH_TOTEM             = 15112,
    NPC_POWERFULL_HEALING_WARD      = 14987
};

struct boss_jindoAI : public ScriptedAI
{
    boss_jindoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_brainWashTotemTimer;
    uint32 m_healingWardTimer;
    uint32 m_hexTimer;
    uint32 m_delusionsTimer;
    uint32 m_summonShadeTimer;
    uint32 m_banishTimer;

    uint32 m_checkBrainWashTimer;

    ObjectGuid m_hexGuid;
    ObjectGuid m_delusionGuid;
    float m_hexAggro;

    std::list<uint64> m_brainWashedPlayerGuids;
    std::list<float> m_brainWashedPlayersAggro;
    std::list<ObjectGuid> m_summonedCreatures;

    void DespawnAllSummons()
    {
        while (!m_summonedCreatures.empty())
        {
            ObjectGuid const& g = *(m_summonedCreatures.begin());
            m_summonedCreatures.pop_front();
            switch (g.GetEntry())
            {
                case NPC_BRAINWASH_TOTEM:
                case NPC_SHADE:
                case NPC_POWERFULL_HEALING_WARD:
                    if (Creature* c = m_creature->GetMap()->GetCreature(g))
                        c->AddObjectToRemoveList();
                    break;
            }
        }
        while (Creature* Crea = m_creature->FindNearestCreature(NPC_BRAINWASH_TOTEM, 150.0f))
            Crea->DisappearAndDie();
    }
    void JustSummoned(Creature* c) override
    {
        if (c->GetEntry() == NPC_SHADE)
        {
            // Adds the boss' enemies to its threat list.
            c->AddThreatsOf(m_creature);
            if (Unit* pTarget = m_creature->GetMap()->GetUnit(m_delusionGuid))
                if (c->IsValidAttackTarget(pTarget) && pTarget->HasAura(SPELL_DELUSIONS_OF_JINDO))
                    c->AI()->AttackStart(pTarget);
        }

        m_summonedCreatures.push_back(c->GetObjectGuid());
        ScriptedAI::JustSummoned(c);
    }
    void Reset() override
    {
        m_brainWashTotemTimer    = urand(10, 20) * IN_MILLISECONDS;
        m_healingWardTimer       = urand(20, 30) * IN_MILLISECONDS;
        m_hexTimer               = urand(20, 50) * IN_MILLISECONDS;
        m_delusionsTimer         = urand(3, 6) * IN_MILLISECONDS;
        m_summonShadeTimer       = urand(6, 8) * IN_MILLISECONDS;
        m_banishTimer            = urand(15, 30) * IN_MILLISECONDS;
        m_checkBrainWashTimer    = 1000;

        m_hexAggro                = 0;

        m_brainWashedPlayerGuids.clear();
        m_brainWashedPlayersAggro.clear();

        DespawnAllSummons();

        if (m_pInstance)
            m_pInstance->SetData(TYPE_JINDO, NOT_STARTED);
    }

    void SpellHitTarget(Unit* pCaster, SpellEntry const* pSpell) override
    {
        if (pSpell->Id == SPELL_HEX)
        {
            if (pCaster->GetTypeId() != TYPEID_PLAYER)
                return;

            m_hexGuid = pCaster->GetObjectGuid();
            m_hexAggro = m_creature->GetThreatManager().getThreat(pCaster);

            m_creature->GetThreatManager().modifyThreatPercent(pCaster, -100);
        }
    }

    void JustDied(Unit* pKiller) override
    {
        DespawnAllSummons();
        if (m_pInstance)
            m_pInstance->SetData(TYPE_JINDO, DONE);
    }

    void Aggro(Unit *who) override
    {
        DoScriptText(SAY_AGGRO, m_creature);
        if (m_pInstance)
            m_pInstance->SetData(TYPE_JINDO, IN_PROGRESS);
    }

    void DoSummonSkeleton(float addx, float addy, Unit* initialTarget)
    {
        Creature* Skeleton = m_creature->SummonCreature(14826, -11583.7783f + addx, -1249.4278f + addy, 77.5471f, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
        if (Skeleton && Skeleton->AI())
            Skeleton->AI()->AttackStart(initialTarget);
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_hexGuid)
        {
            Player* hexPlayer = m_creature->GetMap()->GetPlayer(m_hexGuid);
            if (hexPlayer && !hexPlayer->HasAura(SPELL_HEX))
            {
                m_creature->GetThreatManager().addThreatDirectly(hexPlayer, m_hexAggro);
                m_hexGuid.Clear();
                m_hexAggro = 0;
            }
            else if (!hexPlayer)
            {
                m_hexGuid.Clear();
                m_hexAggro = 0;
            }
        }

        if (m_brainWashTotemTimer < diff)
        {
            // You need at least 2 people in Jin'do's threatlist, otherwise he will reset!
            if (m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 1))
                if (DoCastSpellIfCan(m_creature, SPELL_BRAIN_WASH_TOTEM) == CAST_OK)
                    m_brainWashTotemTimer = urand(10, 30) * IN_MILLISECONDS;
        }
        else
            m_brainWashTotemTimer -= diff;

        // Ustaag : Mind controlled player aggro management
        if (!m_brainWashedPlayerGuids.empty() && !m_brainWashedPlayersAggro.empty())
        {
            if (m_checkBrainWashTimer < diff)
            {
                uint64 PlayerBrainWashedGuid = 0;
                bool PlayerDead = false;
                bool AuraRemoved = false;

                uint32 var = 0;
                for (auto const& guid : m_brainWashedPlayerGuids)
                {
                    if (Player* pTarget = m_creature->GetMap()->GetPlayer(guid))
                    {
                        if ((pTarget->IsAlive() && !pTarget->HasAura(SPELL_BRAINWASH, EFFECT_INDEX_0)) || pTarget->IsDead())
                        {
                            PlayerBrainWashedGuid = guid;
                            if (pTarget->IsDead())
                                PlayerDead = true;
                            else
                                AuraRemoved = true;
                            break;
                        }
                        ++var;
                    }
                }

                if (PlayerDead || AuraRemoved)
                {
                    std::list<float>::const_iterator Iter = m_brainWashedPlayersAggro.begin();
                    for (uint32 i = 0; i < var; ++i)
                        ++Iter;
                    Player* playerBrainWashed = m_creature->GetMap()->GetPlayer(PlayerBrainWashedGuid);
                    if (AuraRemoved)
                    {
                        m_creature->GetThreatManager().modifyThreatPercent(playerBrainWashed, -100);
                        m_creature->GetThreatManager().addThreatDirectly(playerBrainWashed, (*Iter));
                    }

                    m_brainWashedPlayerGuids.remove(PlayerBrainWashedGuid);
                    m_brainWashedPlayersAggro.remove(*Iter);
                }
            }
            else
                m_checkBrainWashTimer -= diff;
        }

        if (m_healingWardTimer < diff)
        {
            if (!m_creature->FindNearestCreature(NPC_POWERFULL_HEALING_WARD, 200.0f))
            {
                DoCastSpellIfCan(m_creature, SPELL_POWERFULL_HEALING_WARD);
                //m_creature->SummonCreature(NPC_POWERFULL_HEALING_WARD, m_creature->GetPositionX() + 3, m_creature->GetPositionY() - 2, m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
                m_healingWardTimer = urand(20, 30) * IN_MILLISECONDS;
            }
        }
        else
            m_healingWardTimer -= diff;

        if (m_hexTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_HEX) == CAST_OK)
                m_hexTimer = urand(20, 60) * IN_MILLISECONDS;
        }
        else
            m_hexTimer -= diff;

        // Casting the delusion curse with a shade. So shade will attack the same target with the curse.
        if (m_delusionsTimer < diff)
        {
            if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER))
            {
                if (DoCastSpellIfCan(target, SPELL_DELUSIONS_OF_JINDO) == CAST_OK)
                {
                    m_delusionGuid = target->GetObjectGuid();
                    m_delusionsTimer = urand(3, 9) * IN_MILLISECONDS;
                }
            }

        }
        else
            m_delusionsTimer -= diff;

        if (m_summonShadeTimer < diff)
        {
            if (Unit* pTarget = m_creature->GetMap()->GetUnit(m_delusionGuid))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_SHADE_OF_JINDO) == CAST_OK)
                    m_summonShadeTimer = urand(7, 8) * IN_MILLISECONDS;
            }
        }
        else
            m_summonShadeTimer -= diff;

        // Teleporting a random player and spawning 9 skeletons that will attack
        if (m_banishTimer < diff)
        {
            if (Player* target = ToPlayer(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, SPELL_BANISH, SELECT_FLAG_PLAYER)))
            {
                if (DoCastSpellIfCan(target, SPELL_BANISH) == CAST_OK)
                    m_banishTimer = urand(15, 35) * IN_MILLISECONDS;
            }
        }
        else
            m_banishTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

//Shade of Jindo
struct mob_shade_of_jindoAI : public ScriptedAI
{
    mob_shade_of_jindoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 ShadowShock_Timer;

    void Reset() override
    {
        ShadowShock_Timer = 1000;
        m_creature->AddAura(SPELL_INVISIBLE, ADD_AURA_PERMANENT);
    }

    void DamageTaken(Unit *done_by, uint32 &damage) override
    {
        if (done_by && !done_by->HasAura(SPELL_DELUSIONS_OF_JINDO))
            damage = 0;
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_creature->GetVictim()->HasAura(SPELL_HEX))
            m_creature->GetThreatManager().modifyThreatPercent(m_creature->GetVictim(), -100);

        //ShadowShock_Timer
        if (ShadowShock_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SHADOWSHOCK);
            ShadowShock_Timer = 2000;
        }
        else
            ShadowShock_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

struct mob_brain_wash_totemAI : public ScriptedAI
{
    mob_brain_wash_totemAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint64 PlayerMCGuid;
    uint32 CheckTimer;

    void Reset() override
    {
        PlayerMCGuid = 0;
        CheckTimer = 0;

        m_creature->AddAura(23198, ADD_AURA_PERMANENT); // Avoidance : immunity to AoE
        m_creature->AddUnitState(UNIT_STAT_ROOT);
        SetCombatMovement(false);
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim() || !m_pInstance)
        {
            m_creature->DisappearAndDie();
            return;
        }

        m_creature->AddUnitState(UNIT_STAT_ROOT);

        if (!m_creature->IsInCombat())
            m_creature->SetInCombatWithZone();

        // Already mind controlled the player
        if (PlayerMCGuid)
            if (Player* pPlayer = m_creature->GetMap()->GetPlayer(PlayerMCGuid))
                if (pPlayer->IsAlive() && pPlayer->HasAura(SPELL_BRAINWASH, EFFECT_INDEX_0))
                    return;

        if (Creature* pJindo = m_creature->GetMap()->GetCreature(m_pInstance->GetData64(DATA_JINDO)))
        {
            // Il faut au moins 2 personnes dans le threatlist de Jin'do, sinon il va reset !
            if (pJindo->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 1))
            {
                Unit* pTarget = pJindo ? pJindo->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0) : nullptr;
                if (pTarget && pTarget->IsAlive() && pTarget->IsPlayer() && !pTarget->HasAura(SPELL_HEX) && !pTarget->HasAura(SPELL_BRAINWASH))
                {
                    if (boss_jindoAI* pJindoAI = dynamic_cast<boss_jindoAI*>(pJindo->AI()))
                    {
                        pJindoAI->m_brainWashedPlayerGuids.push_back(pTarget->GetGUID());
                        pJindoAI->m_brainWashedPlayersAggro.push_back(pJindo->GetThreatManager().getThreat(pTarget));
                        if (DoCastSpellIfCan(pTarget, SPELL_BRAINWASH) == CAST_OK)
                        {
                            PlayerMCGuid = pTarget->GetGUID();
                            pJindoAI->m_checkBrainWashTimer = 1000;
                        }
                    }
                }
            }
        }
    }
};

CreatureAI* GetAI_boss_jindo(Creature* pCreature)
{
    return new boss_jindoAI(pCreature);
}

CreatureAI* GetAI_mob_shade_of_jindo(Creature* pCreature)
{
    return new mob_shade_of_jindoAI(pCreature);
}

CreatureAI* GetAI_mob_brain_wash(Creature* pCreature)
{
    return new mob_brain_wash_totemAI(pCreature);
}

// UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_brain_wash' WHERE `entry` = 15112;
void AddSC_boss_jindo()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_jindo";
    newscript->GetAI = &GetAI_boss_jindo;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_shade_of_jindo";
    newscript->GetAI = &GetAI_mob_shade_of_jindo;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_brain_wash";
    newscript->GetAI = &GetAI_mob_brain_wash;
    newscript->RegisterSelf();
}
