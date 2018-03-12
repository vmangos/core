#include "scriptPCH.h"

enum
{
    SPELL_DARK_PLAGUE_AURA  = 12038,    // procs 18270
    SPELL_EXPLOSION         = 17689,
   //SPELL_FEIGN_DEATH       = 19822,
};

/*
-- fix dark plague proc rate and debuff stacking
DELETE FROM spell_proc_event WHERE entry = 12038;
INSERT INTO `spell_proc_event` (`entry`, `ppmRate`) VALUES ('12038', '3');
DELETE FROM spell_mod WHERE Id = 18270;
INSERT INTO `spell_mod` (`Id`, `Custom`, `Comment`) VALUES ('18270', '1', 'Scholomance: Dark Plague - Debuff stack between mobs');
*/

/*######
## npc_unstable_corpse
######*/

struct npc_unstable_corpseAI : public ScriptedAI
{
    npc_unstable_corpseAI(Creature* pCreature) : ScriptedAI(pCreature) {}

    void Reset() {}

    void Aggro(Unit* /*pWho*/)
    {
        DoCastSpellIfCan(m_creature, SPELL_DARK_PLAGUE_AURA, CF_TRIGGERED | CF_AURA_NOT_PRESENT);        
    }

    void JustDied(Unit* pKiller)
    {
        m_creature->CastSpell(m_creature, SPELL_EXPLOSION, true);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_unstable_corpse(Creature* pCreature)
{
    return new npc_unstable_corpseAI(pCreature);
}

/*######
## npc_reanimated_corpse
######*/

struct npc_reanimated_corpseAI : public ScriptedAI
{
    npc_reanimated_corpseAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiHealTimer;
    bool m_bHasRessed;

    void Reset()
    {
        m_uiHealTimer = 0;
        m_bHasRessed = false;
        Resurrect();
    }

    void Aggro(Unit* /*pWho*/)
    {
        DoCastSpellIfCan(m_creature, SPELL_DARK_PLAGUE_AURA, CF_TRIGGERED | CF_AURA_NOT_PRESENT);        
    }

    void Resurrect()
    {
        m_creature->SetHealth(m_creature->GetMaxHealth());
        m_creature->SetStandState(UNIT_STAND_STATE_STAND);
        m_creature->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
        m_creature->AttackStop();
    }

    void DamageTaken(Unit* done_by, uint32& damage)
    {
        if (damage < m_creature->GetHealth())
            return;

        if (!m_bHasRessed)
        {
            damage = 0;
            if (!m_uiHealTimer)
            {
                m_creature->SetHealth(0);
                m_creature->GetMotionMaster()->Clear();
                m_creature->GetMotionMaster()->MoveIdle();
                m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
                m_creature->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
                m_uiHealTimer = 10000;
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (m_uiHealTimer)
        {
            if (m_uiHealTimer <= diff)
            {
                Resurrect();
                m_bHasRessed = true;
                m_uiHealTimer = 0;
            }
            else
            {
                m_uiHealTimer -= diff;
                return;
            }
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_reanimated_corpse(Creature* pCreature)
{
    return new npc_reanimated_corpseAI(pCreature);
}


enum
{
    NPC_SPECTRAL_PROJECTION = 11263,

    SPELL_MANA_BURN         = 17630,
    SPELL_SILENCE           = 12528,
    SPELL_IMAGE_PROJECTION  = 17651,
    SPELL_PROJECTION_LEECH  = 17652,
    SPELL_SUMMON_PROJECTION = 17653
};

struct npc_spectral_tutorAI : public ScriptedAI
{
    npc_spectral_tutorAI(Creature* pCreature) : ScriptedAI(pCreature) { Reset(); }

    uint32 m_uiManaBurnTimer;
    uint32 m_uiSilenceTimer;
    uint32 m_uiImageTimer;
    uint32 m_uiHideTimer;

    bool m_isProjection;

    void Reset() override
    {
        m_uiManaBurnTimer   = urand(4200, 19100);
        m_uiSilenceTimer    = urand(0, 3300);
        m_uiImageTimer      = urand(11800, 12700);

        m_isProjection      = false;
    }

    void EnterEvadeMode() override
    {
        m_creature->RemoveGuardians();
        ScriptedAI::EnterEvadeMode();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim()) return;

        if (!m_isProjection)
        {
            // Mana Burn
            if (m_uiManaBurnTimer < uiDiff)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER | SELECT_FLAG_POWER_MANA))
                {
                    if (DoCastSpellIfCan(target, SPELL_MANA_BURN) == CAST_OK)
                    {
                        m_uiManaBurnTimer = urand(8600, 26400);
                    }                
                }
            }
            else 
                m_uiManaBurnTimer -= uiDiff;

            // Silence
            if (m_uiSilenceTimer < uiDiff)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER | SELECT_FLAG_POWER_MANA))
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SILENCE) == CAST_OK)
                    {
                        m_uiSilenceTimer = urand(12000, 26300);
                    }          
                }
            }
            else 
                m_uiSilenceTimer -= uiDiff;

            DoMeleeAttackIfReady();

            // Image Projection
            if (m_uiImageTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_SUMMON_PROJECTION, CF_INTERRUPT_PREVIOUS) == CAST_OK)
                {
                    DoCastSpellIfCan(m_creature, SPELL_IMAGE_PROJECTION, CF_TRIGGERED);
                    m_uiImageTimer = urand(17700, 25300);
                    m_uiHideTimer = 5800;
                    m_isProjection = true;
                }
            }
            else 
                m_uiImageTimer -= uiDiff;           
        }
        else
        {
            // projected phase
            if (m_uiHideTimer < uiDiff)
            {
                if (!m_creature->HasAura(SPELL_IMAGE_PROJECTION))
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_PROJECTION_LEECH, CF_TRIGGERED | CF_INTERRUPT_PREVIOUS) == CAST_OK)
                    {
                        m_isProjection = false;
                        return;
                    }
                }

                m_uiHideTimer = 200;
            }
            else 
                m_uiHideTimer -= uiDiff;            
        }
    }
};

CreatureAI* GetAI_npc_spectral_tutor(Creature* pCreature)
{
    return new npc_spectral_tutorAI(pCreature);
}

struct npc_spectral_projectionAI : public ScriptedAI
{
    npc_spectral_projectionAI(Creature* pCreature) : ScriptedAI(pCreature) { npc_spectral_projectionAI::Reset(); }

    void Reset() override
    {

    }

    void SpellHit(Unit* pCaster, const SpellEntry* pSpell) override
    {
        if (pSpell->Id == SPELL_PROJECTION_LEECH)
        {
            // hack life leech effect
            pCaster->SetHealth(pCaster->GetHealth() + 1000.0f);
            // remove from world, or projections will respawn 
            m_creature->RemoveFromWorld();
        }
    }
};

CreatureAI* GetAI_npc_spectral_projection(Creature* pCreature)
{
    return new npc_spectral_projectionAI(pCreature);
}

void AddSC_scholo_trash()
{
    Script* script;

    script = new Script;
    script->Name = "npc_unstable_corpse";
    script->GetAI = &GetAI_npc_unstable_corpse;
    script->RegisterSelf();

    script = new Script;
    script->Name = "npc_reanimated_corpse";
    script->GetAI = &GetAI_npc_reanimated_corpse;
    script->RegisterSelf();

    script = new Script;
    script->Name = "npc_spectral_tutor";
    script->GetAI = &GetAI_npc_spectral_tutor;
    script->RegisterSelf();

    script = new Script;
    script->Name = "npc_spectral_projection";
    script->GetAI = &GetAI_npc_spectral_projection;
    script->RegisterSelf();
}
