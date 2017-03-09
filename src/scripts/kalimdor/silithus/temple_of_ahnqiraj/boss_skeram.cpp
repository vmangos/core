/* ScriptData
SDName: Boss_Skeram
SDCategory: Temple of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"

#define SAY_AGGRO_1                 -1531000
#define SAY_AGGRO_2                 -1531001
#define SAY_AGGRO_3                 -1531002
#define SAY_SLAY_1                  -1531003
#define SAY_SLAY_2                  -1531004
#define SAY_SLAY_3                  -1531005
#define SAY_SPLIT                   -1531006
#define SAY_DEATH                   -1531007

#define SPELL_ARCANE_EXPLOSION      26192
#define SPELL_EARTH_SHOCK           26194

#define SPELL_TRUE_FULFILLMENT      785
#define SPELL_TF_HASTE              2313
#define SPELL_TF_MOD_HEAL           26525
#define SPELL_TF_IMMUNITY           26526
#define SPELL_TF_CANCEL             26589         

#define SPELL_BLINK_1               4801
#define SPELL_BLINK_2               8195
#define SPELL_BLINK_3               20449

#define SPELL_SUMMON_IMAGES         747

struct boss_skeramAI : public ScriptedAI
{
    boss_skeramAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        IsImage = false;
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 ArcaneExplosion_Timer;
    uint32 EarthShock_Timer;
    uint32 FullFillment_Timer;
    uint32 Blink_Timer;

    float NextSplitPercent;

    Creature *ImageA, *ImageB;

    bool IsImage;

    void Reset()
    {
        ArcaneExplosion_Timer = urand(6000, 8000);
        EarthShock_Timer = 100;
        FullFillment_Timer = urand(10000, 15000);
        Blink_Timer = urand(15000, 20000);

        NextSplitPercent = 75.0f;

        m_creature->SetVisibility(VISIBILITY_ON);

        ImageA = nullptr;
        ImageA = nullptr;
    }

    void KilledUnit(Unit* victim)
    {
        if (IsImage)
            return;

        switch (urand(0,5))
        {
            case 0: DoScriptText(SAY_SLAY_1, m_creature); break;
            case 1: DoScriptText(SAY_SLAY_2, m_creature); break;
            case 2: DoScriptText(SAY_SLAY_3, m_creature); break;
        }

    }

    void JustDied(Unit* Killer)
    {
        if (IsImage)
        {
            if (Unit* victim = m_creature->GetCharm())
            {
                victim->RemoveAurasDueToSpellByCancel(SPELL_TF_HASTE);
                victim->RemoveAurasDueToSpellByCancel(SPELL_TF_MOD_HEAL);
                victim->RemoveAurasDueToSpellByCancel(SPELL_TF_IMMUNITY);
            }

            m_creature->ForcedDespawn();
            return;
        }
        
        DoScriptText(SAY_DEATH, m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_SKERAM, DONE); 
    }

    void Aggro(Unit *who)
    {
		if (IsImage)
			return;

        if (m_pInstance && m_pInstance->GetData(TYPE_SKERAM) == IN_PROGRESS)
            return;

        switch (urand(0,2))
        {
            case 0: DoScriptText(SAY_AGGRO_1, m_creature); break;
            case 1: DoScriptText(SAY_AGGRO_2, m_creature); break;
            case 2: DoScriptText(SAY_AGGRO_3, m_creature); break;
        }

        if (m_pInstance)
            m_pInstance->SetData(TYPE_SKERAM, IN_PROGRESS);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SKERAM, FAIL);

        if (IsImage)
            m_creature->ForcedDespawn();
    }

    void UpdateAI(const uint32 diff)
    {
        // Despawn Images instantly if the True Prophet died
        if (IsImage && m_pInstance && m_pInstance->GetData(TYPE_SKERAM) == DONE)
            m_creature->ForcedDespawn();

        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //ArcaneExplosion_Timer
        if (ArcaneExplosion_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_ARCANE_EXPLOSION) == CAST_OK)
                ArcaneExplosion_Timer = urand(6000, 14000);
        }
        else ArcaneExplosion_Timer -= diff;

        //If we are within range melee the target
        if (m_creature->IsWithinMeleeRange(m_creature->getVictim()))
            DoMeleeAttackIfReady();
        else 
        // Target not in melee range. Spam Earthshock
        {
            if (EarthShock_Timer < diff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_EARTH_SHOCK) == CAST_OK)
                    EarthShock_Timer = 1000;
            }
            else 
                EarthShock_Timer -= diff;
        }

        if (FullFillment_Timer < diff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1)) // Get random target except highest threat
            {
                if (DoCastSpellIfCan(pTarget, SPELL_TRUE_FULFILLMENT, CAST_AURA_NOT_PRESENT) == CAST_OK)
                {
                    pTarget->CastSpell(pTarget, SPELL_TF_HASTE, true);		
                    pTarget->CastSpell(pTarget, SPELL_TF_MOD_HEAL, true);
                    pTarget->CastSpell(pTarget, SPELL_TF_IMMUNITY, true);
                    FullFillment_Timer = urand(20000, 25000);
                }
            }
        }
        else FullFillment_Timer -= diff;

        //Blink_Timer
        if (Blink_Timer < diff)
        {
            CastBlink(m_creature);
            Blink_Timer = urand(10000, 18000);
        }
        else 
            Blink_Timer -= diff;

        //Summon 2 Images and teleport for every 25% hp lost
        if (!IsImage && m_creature->GetHealthPercent() < NextSplitPercent)
            if (DoCastSpellIfCan(m_creature, SPELL_SUMMON_IMAGES) == CAST_OK)
            {
                if (NextSplitPercent < 26.0f)
                    DoScriptText(SAY_SPLIT, m_creature);

                NextSplitPercent -= 25.0f;
            }

    }

    void JustSummoned(Creature* skeramImage)
    {
        if (m_creature->GetEntry() != skeramImage->GetEntry())
            return;

        if (boss_skeramAI* imageAI = dynamic_cast<boss_skeramAI*>(skeramImage->AI()))
            imageAI->IsImage = true;

        float skeramPercent = m_creature->GetHealthPercent();

        // Set health to look like the True Prophet. Will have 12.5%, 25%, finally 50% of max Skeram HP. 
        skeramImage->SetMaxHealth(m_creature->GetMaxHealth() * (12.5f / skeramPercent) * (100 / (int)skeramPercent));
        skeramImage->SetHealthPercent(skeramPercent);
        skeramImage->SetInCombatWithZone();
        skeramImage->SetVisibility(VISIBILITY_OFF);

        if (!ImageA)
            ImageA = skeramImage;
        else
        {
            ImageB = skeramImage;
            UnisonBlink();              
        }
     
    }

    void UnisonBlink()
    // At least two images present. Blink self and newest two images
    {
        uint32 mask = 0x7;

        // Get Skeram ready for blink
        m_creature->RemoveAllAuras();
        ClearTargetIcon();
        m_creature->SetVisibility(VISIBILITY_OFF);

        CastBlink(ImageA, mask);
        CastBlink(ImageB, mask);
        CastBlink(m_creature, mask);

        ImageA = nullptr;
        ImageB = nullptr;
    }

    void CastBlink(Creature* caster)
    // Teleport to any of three positions
    {
        uint32 mask = 0x7;
        CastBlink(caster, mask);
    }

    void CastBlink(Creature* caster, uint32& choiceMask)
    // Teleport to a random position in mask
    // Can teleport to any position if mask = 0x7
    {
        uint32 position = urand(0,2); 

        while (!(1 << position & choiceMask))                       // Bogo select
            position = urand(0, 2);

        choiceMask &= ~(1 << position);                             // Remove used position from mask

        DoStopAttack();

        // Blink to one of the three platforms
        switch (position)
        {
            case 0: caster->CastSpell(caster, SPELL_BLINK_1, true); break;
            case 1: caster->CastSpell(caster, SPELL_BLINK_2, true); break;
            case 2: caster->CastSpell(caster, SPELL_BLINK_3, true); break;
        }

        DoResetThreat();
        caster->SetVisibility(VISIBILITY_ON);
    }

};

CreatureAI* GetAI_boss_skeram(Creature* pCreature) { return new boss_skeramAI(pCreature); }

void AddSC_boss_skeram()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_skeram";
    newscript->GetAI = &GetAI_boss_skeram;
    newscript->RegisterSelf();
}
