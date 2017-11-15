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
SDName: Boss_Jeklik
SD%Complete: 99
SDComment:
SDCategory: Zul'Gurub
EndScriptData */

/*
INSERT INTO creature_template SET entry=14941, name="High Priestess Jeklik Transform Visual", modelid_1=15191, modelid_2=15191;
UPDATE creature_template SET InhabitType=4 WHERE entry=14965;
*/
#include "scriptPCH.h"
#include "zulgurub.h"

enum
{
    // Datas : HP : 333,125 (+20% = 399750), MP : 26,200. Troll form : 550-1000 melee. Bat form : 800-1200 on warrior.
    NPC_JEKLIK                  = 14517,

    // Emotes
    // ------
    SAY_AGGRO                   = -1309002,
    SAY_RAIN_FIRE               = -1309003,
    SAY_DEATH                   = -1309004,
    TEXTE_GRAND_SORT_SOIN       = -1309025,
    TEXTE_SUMMON_BATS           = -1309026,
    TEXTE_FAIRE_FEU             = 2,

    // Jeklik's spells
    // ---------------

    SPELL_GREENCHANNELING       = 13540, //3450
    SPELL_BAT_FORM              = 23966,
    SPELL_BOMB                  = 19629,
    SPELL_THROW_LIQUID_FIRE     = 23970,
    SPELL_TRANSFORMVISUAL       = 24085,
    SPELL_BLOODLEECH            = 22644,

    // Jeklik's spells phase 1
    // -----------------------

    // Swoop - Inflicts normal damage plus 500 (must be total > 1.2k) to enemies in a cone in front of the caster, stunning them for 2 sec (= Rapace).
    // OK
    SPELL_SWOOP                 = 23919, // 15 sec
    // Charge - Charges an enemy, inflicting normal damage plus 75 (total 1k) and stuns the opponent for 2 sec (silence for 5 sec?). Every 10-12 secs.
    // OK
    SPELL_CHARGE                = 24408, // 22911 // 15-20 sec
    // Sonic Burst - Inflicts 1000-1100 damages on nearby enemies, preventing them from spellcasting for 10 sec. Every ~20-30 sec.
    // OK
    SPELL_SONICBURST            = 23918,
    // Pierce Armor
    // OK
    SPELL_PIERCEARMOR           = 12097,

    // Jeklik's spells phase 2
    // -----------------------

    SPELL_SHADOW_WORD_PAIN      = 23952,
    SPELL_MIND_FLAY             = 23953, // last 10 sec. 15-20 sec
    // SPELL_CHAIN_MIND_FLAY       = 26044, //Right ID unknown. So disabled - really a chain !
    SPELL_GREATER_HEAL          = 23954,
    SPELL_CURSE_OF_BLOOD        = 16098,
    SPELL_SCREECH               = 6605 // vu une fois juste après transformation?
};

struct boss_jeklikAI : public ScriptedAI
{
    boss_jeklikAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
        m_creature->CastSpell(m_creature, SPELL_GREENCHANNELING, false);
    }

    ScriptedInstance* m_pInstance;

    uint32 Charge_Timer;
    uint32 SonicBurst_Timer;
    uint32 Swoop_Timer;
    uint32 PierceArmor_Timer;
    uint32 SpawnBats_Timer;
    uint32 ShadowWordPain_Timer;
    uint32 CurseOfBlood_Timer;
    uint32 MindFlay_Timer;
    uint32 GreaterHeal_Timer;
    uint32 m_Screech_Timer;
    uint32 SpawnFlyingBats_Timer;
    uint32 m_uiGlobalCooldown;
    uint32 m_uiDiff_Add;
    bool skillStarted;

    bool PhaseTwo;

    void Reset()
    {
        SpawnBats_Timer = 45000;
        // TODO: debug
        SpawnBats_Timer = 1000;

        Charge_Timer = 10000;
        SonicBurst_Timer = 12000;
        Swoop_Timer = 8000;
        PierceArmor_Timer = 9000;

        m_Screech_Timer = 12000;

        ShadowWordPain_Timer = 9000;
        CurseOfBlood_Timer = 26000;
        MindFlay_Timer = 2000;
        GreaterHeal_Timer = 20000;
        SpawnFlyingBats_Timer = 10000;

        m_uiGlobalCooldown = 0;
        PhaseTwo = false;
        skillStarted = false;

        if (m_pInstance && m_creature->isAlive())
            m_pInstance->SetData(TYPE_JEKLIK, FAIL);
        m_creature->SetObjectScale(1.5f);
    }
    void JustReachedHome()
    {
        m_creature->CastSpell(m_creature, SPELL_GREENCHANNELING, false);
    }

    void Aggro(Unit *who)
    {
        // Hackfix. Under Bat form, Jeklik keeps its InhabitType = GROUND.
        m_creature->addUnitState(UNIT_STAT_IGNORE_PATHFINDING);
        DoScriptText(SAY_AGGRO, m_creature);
        m_creature->AddAura(SPELL_BAT_FORM);
        m_creature->SetFly(true);
        m_creature->SetObjectScale(2.0f);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_JEKLIK, IN_PROGRESS);
        ScriptedAI::Aggro(who);
    }

    void JustDied(Unit* Killer)
    {
        DoScriptText(SAY_DEATH, m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_JEKLIK, DONE);
        //ScriptedAI::JustDied(Killer);
    }

    void EnterEvadeMode() override
    {
        ScriptedAI::EnterEvadeMode();
        m_creature->Respawn();
        float x, y, z, o;
        m_creature->GetHomePosition(x, y, z, o);
        m_creature->NearTeleportTo(x, y, z, o);
    }

    void UpdateAI(const uint32 lastDiff)
    {
        if (!m_pInstance || !m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!PhaseTwo && m_creature->GetHealthPercent() < 50.0f)
        {
            m_creature->RemoveAurasDueToSpell(SPELL_BAT_FORM);
            m_creature->SetFly(false);
            m_creature->SetObjectScale(1.5f);
            DoResetThreat();
            PhaseTwo = true;
        }

        // SUMMON_BATS
        if (m_creature->GetHealthPercent() > 50.0f)
        {
            if (SpawnBats_Timer < lastDiff)
            {
                DoScriptText(TEXTE_SUMMON_BATS, m_creature);
                for (uint8 i = 0; i < 6; ++i)
                {
                    Creature* Bat = m_creature->SummonCreature(11368, -12294.0f + frand(0.0f, 5.0f), -1382.0f + frand(0.0f, 5.0f), 144.8304f, 5.483f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
                    if (Bat && Bat->AI())
                    {
                        if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                            Bat->AI()->AttackStart(pTarget);
                    }
                }
                SpawnBats_Timer = 60000;
            }
            else
                SpawnBats_Timer -= lastDiff;
        }

        // SPAWN_FLYING_BAT
        if (PhaseTwo)
        {

            if (SpawnFlyingBats_Timer < lastDiff)
            {
                if (Unit *target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                {
                    Creature* FlyingBat = m_creature->SummonCreature(14965, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ() + 15, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30 * 60 * 1000);
                    if (FlyingBat && FlyingBat->AI())
                    {
                        FlyingBat->AI()->AttackStart(target);
                        DoScriptText(SAY_RAIN_FIRE, m_creature);
                    }
                }
                SpawnFlyingBats_Timer = 10000;
            }
            else
                SpawnFlyingBats_Timer -= lastDiff;
        }

        if (m_creature->IsNonMeleeSpellCasted(false))
        {
            m_uiDiff_Add += lastDiff;
            return;
        }

        DoMeleeAttackIfReady();

        // GlobalCD non ecoule.
        if (m_uiGlobalCooldown > lastDiff)
        {
            m_uiDiff_Add += lastDiff;
            m_uiGlobalCooldown -= lastDiff;
            return;
        }

        uint32 diff = m_uiDiff_Add + lastDiff;
        m_uiDiff_Add  = 0;

        skillStarted = false;
        // BAT FORM COMBAT (PHASE 1)
        if (!PhaseTwo)
        {
            // CHARGE
            if (Charge_Timer < diff)
            {
                if (!skillStarted)
                {
                    if (m_creature->CastSpellOnNearestVictim(SPELL_CHARGE, 10.0f, 40.0f, false))
                    {
                        skillStarted = true;
                        Charge_Timer = urand(15000, 30000);
                        m_uiGlobalCooldown = 1000;
                        // Suivit d'une explosion sonore.
                        if (SonicBurst_Timer < 8000)
                            SonicBurst_Timer = 1000;
                    }
                    else
                        Charge_Timer = 2000;
                }
            }
            else
                Charge_Timer -= diff;

            // SCREECH
            if (m_Screech_Timer < diff)
            {
                if (!skillStarted)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SCREECH) == CAST_OK)
                    {
                        skillStarted = true;
                        m_Screech_Timer = 30000;
                        m_uiGlobalCooldown = 1000;
                    }
                    else
                        Charge_Timer = 1000;
                }
            }
            else
                m_Screech_Timer -= diff;

            // SONICBURST
            if (SonicBurst_Timer < diff)
            {
                if (!skillStarted)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SONICBURST) == CAST_OK)
                    {
                        skillStarted = true;
                        SonicBurst_Timer = urand(20000, 24000);
                        m_uiGlobalCooldown = 1000;
                    }
                }
            }
            else
                SonicBurst_Timer -= diff;

            // SWOOP
            if (Swoop_Timer < diff)
            {
                if (!skillStarted)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SWOOP) == CAST_OK)
                    {
                        skillStarted = true;
                        Swoop_Timer = urand(12000, 15000);
                        m_uiGlobalCooldown = 1000;
                    }
                }
            }
            else
                Swoop_Timer -= diff;

            // PIERCEARMOR
            if (PierceArmor_Timer < diff)
            {
                if (!skillStarted)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_PIERCEARMOR) == CAST_OK)
                    {
                        skillStarted = true;
                        PierceArmor_Timer = urand(16000, 18000);
                        m_uiGlobalCooldown = 1000;
                    }
                }
            }
            else
                PierceArmor_Timer -= diff;

        }
        // TROLL FORM COMBAT (PHASE 2)
        else
        {
            // SHADOW_WORD_PAIN
            if (ShadowWordPain_Timer < diff)
            {
                if (!skillStarted)
                {
                    if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    {
                        if (DoCastSpellIfCan(target, SPELL_SHADOW_WORD_PAIN) == CAST_OK)
                        {
                            ShadowWordPain_Timer = urand(8000, 12000);
                            m_uiGlobalCooldown = 1000;
                            skillStarted = true;
                        }
                    }
                }
            }
            else
                ShadowWordPain_Timer -= diff;

            // GREATER_HEAL
            if (GreaterHeal_Timer < diff)
            {
                if (!skillStarted)
                {
                    m_creature->InterruptNonMeleeSpells(false);
                    if (DoCastSpellIfCan(m_creature, SPELL_GREATER_HEAL) == CAST_OK)
                    {
                        DoScriptText(TEXTE_GRAND_SORT_SOIN, m_creature);
                        skillStarted = true;
                        GreaterHeal_Timer = urand(20000, 25000);
                    }
                }
            }
            else
                GreaterHeal_Timer -= diff;

            // MIND_FLAY
            if (MindFlay_Timer < diff)
            {
                if (!skillStarted)
                {
                    m_creature->InterruptNonMeleeSpells(false);
                    if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    {
                        if (DoCastSpellIfCan(target, SPELL_MIND_FLAY) == CAST_OK)
                        {
                            MindFlay_Timer = urand(25000, 30000);
                            skillStarted = true;
                        }
                    }
                }
            }
            else
                MindFlay_Timer -= diff;

            // CURSE_OF_BLOOD
            if (CurseOfBlood_Timer < diff)
            {
                if (!skillStarted)
                {
                    m_creature->InterruptNonMeleeSpells(false);
                    if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    {
                        if (DoCastSpellIfCan(target, SPELL_CURSE_OF_BLOOD) == CAST_OK)
                        {
                            CurseOfBlood_Timer = urand(25000, 30000);
                            skillStarted = true;
                        }
                    }
                }
            }
            else
                CurseOfBlood_Timer -= diff;
        }
    }
};

//Flying Bat
struct mob_batriderAI : public ScriptedAI
{
    mob_batriderAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 Bomb_Timer;

    void Reset()
    {
        Bomb_Timer = 2000;
    }

    void AttackStart(Unit *pWho)
    {
    }

    // Changeons de cible de temps en temps :-)
    void MoveInLineOfSight(Unit* pWho)
    {
    }

    void DoAttack()
    {
        if (Bomb_Timer)
            return;
        Bomb_Timer = urand(5000, 10000);

        if (Creature* pJeklik = m_creature->FindNearestCreature(NPC_JEKLIK, 150.0f))
        {
            if (Unit* pTarget = pJeklik->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                m_creature->CastSpell(pTarget, SPELL_THROW_LIQUID_FIRE, false);
            else
                sLog.outString("mob_batriderAI: Unable to find a target");
        }
        else
            sLog.outString("mob_batriderAI: Jeklik not found.");
    }


    // Called when spell hits creature's target
    virtual void SpellHitTarget(Unit* target, const SpellEntry* spell)
    {
        // Trigger bomb AoE on the ground
        if (target && spell && spell->Id == SPELL_THROW_LIQUID_FIRE)
            m_creature->CastSpell(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), SPELL_BOMB, false);
    }
    void UpdateAI(const uint32 diff)
    {
        if (!m_pInstance)
            return;
        //Bomb_Timer
        if (Bomb_Timer < diff)
            Bomb_Timer = 0;
        else
            Bomb_Timer -= diff;

        switch (m_pInstance->GetData(TYPE_JEKLIK))
        {
            case IN_PROGRESS:
                DoAttack();
                break;
            default:
                m_creature->AddObjectToRemoveList();
                break;
        }
    }
};

CreatureAI* GetAI_boss_jeklik(Creature* pCreature)
{
    return new boss_jeklikAI(pCreature);
}

CreatureAI* GetAI_mob_batrider(Creature* pCreature)
{
    return new mob_batriderAI(pCreature);
}

// TRASH
enum
{
    SPELL_EXPLOSION        = 24024,
    SPELL_CRI_DEMORALISANT = 23511,
    SPELL_ORDRE_COMBAT     = 5115,
    SPELL_MORSURE_INFECT   = 16128,
    SPELL_ROSSER           = 3391,
};

struct npc_guru_bat_riderAI : public ScriptedAI
{
    npc_guru_bat_riderAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool GoingToExplose;
    uint32 DespawnTimer;
    uint32 OrdreDeCombatTimer;
    uint32 MorsureInfectueuseTimer;
    uint32 RosserTimer;

    void Reset()
    {
        GoingToExplose              = false;
        DespawnTimer                = 0;
        OrdreDeCombatTimer          = 8000;
        MorsureInfectueuseTimer     = 6500;
        RosserTimer                 = 6000;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->CastSpell(m_creature, SPELL_CRI_DEMORALISANT, false);
        ScriptedAI::Aggro(pWho);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!GoingToExplose && m_creature->GetHealthPercent() < 40.0f)
        {
            GoingToExplose = true;
            if (urand(0, 1))
                m_creature->MonsterTextEmote("Gurubashi Bat Rider becomes fully engulfed in flames.", NULL, false);
            else
                m_creature->MonsterTextEmote("Gurubashi Bat Rider gets a crazed look in his eye.", NULL, false);
            m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true); // fear immunity
            m_creature->CastSpell(m_creature, SPELL_EXPLOSION, false);
        }

        if (OrdreDeCombatTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_ORDRE_COMBAT) == CAST_OK)
                OrdreDeCombatTimer = 25000;
        }
        else
            OrdreDeCombatTimer -= diff;

        if (MorsureInfectueuseTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_MORSURE_INFECT) == CAST_OK)
                MorsureInfectueuseTimer = 15000;
        }
        else
            MorsureInfectueuseTimer -= diff;

        if (RosserTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_ROSSER) == CAST_OK)
                RosserTimer = 6000;
        }
        else
            RosserTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_guru_bat_rider(Creature* pCreature)
{
    return new npc_guru_bat_riderAI(pCreature);
}


void AddSC_boss_jeklik()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_jeklik";
    newscript->GetAI = &GetAI_boss_jeklik;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_batrider";
    newscript->GetAI = &GetAI_mob_batrider;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_guru_bat_rider";
    newscript->GetAI = &GetAI_guru_bat_rider;
    newscript->RegisterSelf();
}
