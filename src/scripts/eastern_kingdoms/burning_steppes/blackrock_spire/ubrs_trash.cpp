#include "scriptPCH.h"
#include "blackrock_spire.h"

enum
{
    // Invocateur Main-noire
    SPELL_BOULE_FEU             = 12466, // Boule de feu
    SPELL_NOVA_GIVRE            = 15532, // Nova de givre
    SPELL_INVOC_TISSEUR_EFFROI  = 15794,
    SPELL_INVOC_VETERAN         = 15792,

    // Veteran Main-noire
    SPELL_CHARGE_BOUCLIER       = 15749,
    SPELL_COUP_BOUCLIER         = 11972,
    SPELL_FRAPPE                = 14516,
};

// npc_blackhand_summoner
struct npc_blackhand_summonerAI : public ScriptedAI
{
    npc_blackhand_summonerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_blackrock_spire*) pCreature->GetInstanceData();
        Reset();
    }

    instance_blackrock_spire* m_pInstance;
    uint32 m_uiBouleFeuTimer;
    uint32 m_uiNovaGivreTimer;
    uint32 m_uiSummonTimer;

    void Reset()
    {
        m_uiBouleFeuTimer = 7000;
        m_uiNovaGivreTimer = 10000;
        m_uiSummonTimer = 0;
    }
    bool ManageTimer(uint32 const diff, uint32* timer)
    {
        if ((*timer) < diff)
            return true;
        else
        {
            (*timer) -= diff;
            return false;
        }
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData64(TYPE_ROOM_EVENT, m_creature->GetGUID());
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim() || m_creature->IsNonMeleeSpellCasted(false))
            return;

        if (ManageTimer(uiDiff, &m_uiSummonTimer))
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (urand(0, 1) == 0)
                {
                    if (DoCastSpellIfCan(pTarget, SPELL_INVOC_TISSEUR_EFFROI) == CAST_OK)
                        m_uiSummonTimer = 15000;
                }
                else
                {
                    if (DoCastSpellIfCan(pTarget, SPELL_INVOC_VETERAN) == CAST_OK)
                        m_uiSummonTimer = 15000;
                }
            }
        }

        if (ManageTimer(uiDiff, &m_uiBouleFeuTimer))
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_BOULE_FEU) == CAST_OK)
                    m_uiBouleFeuTimer = 6000;
            }
        }
        if (ManageTimer(uiDiff, &m_uiNovaGivreTimer))
        {
            if (Unit* pTarget = m_creature->getVictim())//m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (pTarget->GetDistance(m_creature) < 10.0f)
                {
                    if (DoCastSpellIfCan(pTarget, SPELL_NOVA_GIVRE) == CAST_OK)
                        m_uiNovaGivreTimer = 6000;
                }
            }
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_blackhand_summoner(Creature* pCreature)
{
    return new npc_blackhand_summonerAI(pCreature);
}

// npc_blackhand_veteran
struct npc_blackhand_veteranAI : public ScriptedAI
{
    npc_blackhand_veteranAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_blackrock_spire*) pCreature->GetInstanceData();
        Reset();
    }

    instance_blackrock_spire* m_pInstance;
    uint32 m_uiChargeBouclierTimer;
    uint32 m_uiCoupBouclierTimer;
    uint32 m_uiFrappeTimer;
    bool m_bFirstChargeDone;

    void Reset()
    {
        m_uiChargeBouclierTimer = 0;
        m_uiCoupBouclierTimer = 2000;
        m_uiFrappeTimer = 5000;
        m_bFirstChargeDone = false;
    }
    bool ManageTimer(uint32 const diff, uint32* timer)
    {
        if ((*timer) < diff)
            return true;
        else
        {
            (*timer) -= diff;
            return false;
        }
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData64(TYPE_ROOM_EVENT, m_creature->GetGUID());
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (ManageTimer(uiDiff, &m_uiChargeBouclierTimer))
        {
            Unit* pTarget1;
            if (m_bFirstChargeDone)
                pTarget1 = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
            else
            {
                pTarget1 = m_creature->getVictim();
                m_bFirstChargeDone = true;
            }
            if (pTarget1)
            {
                if (DoCastSpellIfCan(pTarget1, SPELL_CHARGE_BOUCLIER) == CAST_OK)
                    m_uiChargeBouclierTimer = urand(8000, 14000);
            }
        }
        if (ManageTimer(uiDiff, &m_uiCoupBouclierTimer))
        {
            if (Unit* pTarget2 = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (pTarget2->IsNonMeleeSpellCasted(false, false, true))
                {
                    if (!urand(0, 3)) //because otherwise they all decast at the same, which is stupid.
                    {
                        if (DoCastSpellIfCan(pTarget2, SPELL_COUP_BOUCLIER) == CAST_OK)
                            m_uiCoupBouclierTimer = 10000;
                    }
                }
            }
        }
        if (ManageTimer(uiDiff, &m_uiFrappeTimer))
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_FRAPPE) == CAST_OK)
                    m_uiFrappeTimer = 6000;
            }
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_blackhand_veteran(Creature* pCreature)
{
    return new npc_blackhand_veteranAI(pCreature);
}

void AddSC_ubrs_trash()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "npc_blackhand_summoner";
    pNewScript->GetAI = &GetAI_npc_blackhand_summoner;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_blackhand_veteran";
    pNewScript->GetAI = &GetAI_npc_blackhand_veteran;
    pNewScript->RegisterSelf();
}
/*
UPDATE creature_template SET ScriptName="npc_blackhand_summoner", AIName="" WHERE entry=9818;
UPDATE creature_template SET ScriptName="npc_blackhand_veteran", AIName="" WHERE entry=9819;
*/
