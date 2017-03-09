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
SDName: Boss_Viscidus
SD%Complete: 0
SDComment: place holder
SDCategory: Temple of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"

enum
{
    // Timer spells
    SPELL_POISON_SHOCK          = 25993,
    SPELL_POISONBOLT_VOLLEY     = 25991,
    SPELL_TOXIN                 = 26575,                    // Triggers toxin cloud
    SPELL_TOXIN_CLOUD           = 25989,
    SPELL_TOXIN_SUMMON          = 26577,

    // Debuffs gained by the boss on frost damage
    SPELL_VISCIDUS_SLOWED       = 26034,
    SPELL_VISCIDUS_SLOWED_MORE  = 26036,
    SPELL_VISCIDUS_FREEZE       = 25937,

    // When frost damage exceeds a certain limit, then boss explodes
    SPELL_REJOIN_VISCIDUS       = 25896,
    SPELL_VISCIDUS_EXPLODE      = 25938,                    // Casts a lot of spells in the same time: 25865 to 25884; All spells have target coords
    SPELL_VISCIDUS_SUICIDE      = 26003,

    SPELL_VISCIDUS_SHRINKS      = 25893,

    NPC_GLOB_OF_VISCIDUS        = 15667
};

struct boss_viscidusAI : public ScriptedAI
{
    boss_viscidusAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 SalveToxiqueTimer;
    uint32 HorionEmpoisonneTimer;
    uint32 FlaqueTimer;
    uint32 InvisibleTimer;

    int Vie;
    int Froid;
    bool Gele;
    bool Visible;

    void Reset()
    {
        SalveToxiqueTimer = 8000;
        HorionEmpoisonneTimer = 1000;
        FlaqueTimer = 20000;
        InvisibleTimer = 0;
        Vie = 20;
        Froid = 0;
        Gele = false;
        Visible = true;
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (damage >= m_creature->GetHealth() && Vie > 0)
            damage = 0;

        if (Gele == true && done_by->GetDistance(m_creature) < 5.0f)
        {
            Froid++;
            if (Froid == 50)
                SpawnGele();
        }
    }

    void SummonedCreatureJustDied(Creature* unit)
    {
        Vie--;
        m_creature->CastSpell(m_creature, SPELL_VISCIDUS_SHRINKS, true);
        CheckGele();
    }

    void JustSummoned(Creature* unit)
    {
        //unit->SetInCombatWithZone();
        unit->GetMotionMaster()->MovePoint(0, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ());
    }

    void SummonedMovementInform(Creature* summoned, uint32 motion_type, uint32 point_id)
    {
        summoned->ForcedDespawn();
        m_creature->SetHealth(m_creature->GetHealth() + m_creature->GetMaxHealth() / 20);
        CheckGele();
    }

    void CheckGele()
    {
        if (m_creature->FindNearestCreature(NPC_GLOB_OF_VISCIDUS, 150.0f))
            return;

        Froid = 0;
        Gele = false;
        Visible = true;
        m_creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_MAGIC, false);
    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->School == SPELL_SCHOOL_FROST && Gele == false)
        {
            Froid++;
            if (Froid >= 200)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_VISCIDUS_FREEZE, CAST_AURA_NOT_PRESENT) == CAST_OK)
                {
                    m_creature->RemoveAurasDueToSpell(SPELL_VISCIDUS_SLOWED_MORE);
                    Gele = true;
                    Froid = 0;
                    m_creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_MAGIC, true);
                }
            }
            else if (Froid >= 140)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_VISCIDUS_SLOWED_MORE, CAST_AURA_NOT_PRESENT) == CAST_OK)
                    m_creature->RemoveAurasDueToSpell(SPELL_VISCIDUS_SLOWED);
            }
            else if (Froid >= 70)
                DoCastSpellIfCan(m_creature, SPELL_VISCIDUS_SLOWED, CAST_AURA_NOT_PRESENT);
        }
    }

    void SpawnGele()
    {
        m_creature->CastSpell(m_creature, SPELL_VISCIDUS_EXPLODE, true);
        float x = 0.0f;
        float y = 0.0f;
        float z = 0.0f;
        float o = 0.0f;
        m_creature->GetRespawnCoord(x, y, z);
        for (int i = 0; i < Vie; i++)
        {
            float ang = M_PI_F * 2 * i / 20;
            float X = x + 70 * cos(ang);
            float Y = y + 70 * sin(ang);
            float Z = z + 5.0f;
            m_creature->CastSpell(X, Y, Z, 25865 + i, true);
        }
        InvisibleTimer = 5000;
        Froid = 0;
        Gele = false;
    }

    void KilledUnit(Unit* pVictim)
    {
    }

    void JustDied(Unit* pKiller)
    {
    }

    bool IsVisibleFor(Unit const* pOther, bool &isVisible) const
    {
        isVisible = Visible;
        return true;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (InvisibleTimer > 0)
        {
            if (InvisibleTimer <= uiDiff)
            {
                float x = 0.0f;
                float y = 0.0f;
                float z = 0.0f;
                float o = 0.0f;
                m_creature->GetRespawnCoord(x, y, z);
                m_creature->Relocate(x, y, z, o);
                m_creature->SetHealth(1);
                Visible = false;
                InvisibleTimer = 0;
            }
            else InvisibleTimer -= uiDiff;
            return;
        }

        if (Visible == false || Gele == true)
            return;

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (SalveToxiqueTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_POISONBOLT_VOLLEY) == CAST_OK)
                SalveToxiqueTimer = 11000;
        }
        else SalveToxiqueTimer -= uiDiff;

        if (HorionEmpoisonneTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_POISON_SHOCK) == CAST_OK)
                HorionEmpoisonneTimer = 7000;
        }
        else HorionEmpoisonneTimer -= uiDiff;

        if (FlaqueTimer < uiDiff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_TOXIN_SUMMON) == CAST_OK)
                    FlaqueTimer = 9000;
            }
        }
        else FlaqueTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_viscidus(Creature* pCreature)
{
    return new boss_viscidusAI(pCreature);
}

struct boss_glob_of_viscidusAI : public ScriptedAI
{
    boss_glob_of_viscidusAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
    }

    void AttackStart(Unit *) {}
    void AttackedBy(Unit *) {}

    void Reset()
    {
    }
};

CreatureAI* GetAI_boss_glob_of_viscidus(Creature* pCreature)
{
    return new boss_glob_of_viscidusAI(pCreature);
}

void AddSC_boss_viscidus()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_viscidus";
    pNewScript->GetAI = &GetAI_boss_viscidus;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "boss_glob_of_viscidus";
    pNewScript->GetAI = &GetAI_boss_glob_of_viscidus;
    pNewScript->RegisterSelf();
}
