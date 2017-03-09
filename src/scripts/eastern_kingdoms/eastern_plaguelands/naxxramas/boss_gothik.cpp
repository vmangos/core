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
SDName: Boss_Gothik
SD%Complete: 60
SDComment: Only base implemented. Todo: control adds at summon. Handle case of raid not splitted in two sides
SDCategory: Naxxramas
EndScriptData */

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    SAY_SPEECH_1                = -1533040,
    SAY_SPEECH_2                = -1533140,
    SAY_SPEECH_3                = -1533141,
    SAY_SPEECH_4                = -1533142,

    SAY_KILL                    = -1533041,
    SAY_DEATH                   = -1533042,
    SAY_TELEPORT                = -1533043,

    EMOTE_TO_FRAY               = -1533138,
    EMOTE_GATE                  = -1533139,

    PHASE_SPEECH                = 0,
    PHASE_BALCONY               = 1,
    PHASE_GROUND                = 2,
    PHASE_END                   = 3,

    MAX_WAVES                   = 19,

    SPELL_TELEPORT_LEFT         = 28025,                    // guesswork
    SPELL_TELEPORT_RIGHT        = 28026,                    // could be defined as dead or live side, left or right facing north

    SPELL_HARVESTSOUL           = 28679,
    SPELL_SHADOWBOLT            = 29317,
};

enum eSpellDummy
{
    SPELL_A_TO_ANCHOR_1     = 27892,
    SPELL_B_TO_ANCHOR_1     = 27928,
    SPELL_C_TO_ANCHOR_1     = 27935,

    SPELL_A_TO_ANCHOR_2     = 27893,
    SPELL_B_TO_ANCHOR_2     = 27929,
    SPELL_C_TO_ANCHOR_2     = 27936,

    SPELL_A_TO_SKULL        = 27915,
    SPELL_B_TO_SKULL        = 27931,
    SPELL_C_TO_SKULL        = 27937
};

struct boss_gothikAI : public ScriptedAI
{
    boss_gothikAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        SetCombatMovement(false);
        Reset();
    }

    instance_naxxramas* m_pInstance;

    uint8 m_uiPhase;

    uint8 m_uiSpeechCount;
    uint32 m_uiSpeechTimer;

    uint8 m_uiSummonCount;
    uint32 m_uiSummonTimer;

    uint32 m_uiTeleportTimer;
    uint32 m_uiShadowboltTimer;

    void Reset()
    {
        m_uiPhase = PHASE_SPEECH;

        m_uiSpeechCount = 0;
        m_uiSpeechTimer = 5000;

        m_uiSummonCount = 0;
        m_uiSummonTimer = 5000;

        m_uiTeleportTimer = 15000;
        m_uiShadowboltTimer = 2500;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();

        DoScriptText(SAY_SPEECH_1, m_creature);

        if (!m_pInstance)
            return;

        m_pInstance->SetData(TYPE_GOTHIK, IN_PROGRESS);

        m_pInstance->SetGothTriggers();
    }

    bool HasPlayersInLeftSide()
    {
        Map::PlayerList const& lPlayers = m_pInstance->instance->GetPlayers();

        if (lPlayers.isEmpty())
            return false;

        for (Map::PlayerList::const_iterator itr = lPlayers.begin(); itr != lPlayers.end(); ++itr)
        {
            if (Player* pPlayer = itr->getSource())
            {
                if (!m_pInstance->IsInRightSideGothArea(pPlayer))
                    return true;
            }
        }

        return false;
    }

    void KilledUnit(Unit* pVictim)
    {
        if (pVictim->GetTypeId() == TYPEID_PLAYER)
            DoScriptText(SAY_KILL, m_creature);
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_GOTHIK, DONE);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GOTHIK, FAIL);
    }

    void SummonAdds(bool bRightSide, uint32 uiSummonEntry)
    {
        std::list<Creature*> lSummonList;
        m_pInstance->GetGothSummonPointCreatures(lSummonList, bRightSide);

        if (lSummonList.empty())
            return;

        uint8 uiCount = 2;

        switch (uiSummonEntry)
        {
            case NPC_UNREL_TRAINEE:
                lSummonList.sort(ObjectDistanceOrder(m_creature));
                break;
            case NPC_UNREL_DEATH_KNIGHT:
            case NPC_UNREL_RIDER:
                uiCount = 1;
                lSummonList.sort(ObjectDistanceOrderReversed(m_creature));
                break;
        }

        for (std::list<Creature*>::iterator itr = lSummonList.begin(); itr != lSummonList.end(); ++itr)
        {
            if (uiCount == 0)
                break;

            m_creature->SummonCreature(uiSummonEntry, (*itr)->GetPositionX(), (*itr)->GetPositionY(), (*itr)->GetPositionZ(), (*itr)->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
            --uiCount;
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned)
    {
        if (!m_pInstance)
            return;

        if (Creature* pAnchor = m_pInstance->GetClosestAnchorForGoth(pSummoned, true))
        {
            switch (pSummoned->GetEntry())
            {
                // Wrong caster, it expected to be pSummoned.
                // Mangos deletes the spell event at caster death, so for delayed spell like this
                // it's just a workaround. Does not affect other than the visual though (+ spell takes longer to "travel")
                case NPC_UNREL_TRAINEE:
                    m_creature->CastSpell(pAnchor, SPELL_A_TO_ANCHOR_1, true, NULL, NULL, pSummoned->GetGUID());
                    break;
                case NPC_UNREL_DEATH_KNIGHT:
                    m_creature->CastSpell(pAnchor, SPELL_B_TO_ANCHOR_1, true, NULL, NULL, pSummoned->GetGUID());
                    break;
                case NPC_UNREL_RIDER:
                    m_creature->CastSpell(pAnchor, SPELL_C_TO_ANCHOR_1, true, NULL, NULL, pSummoned->GetGUID());
                    break;
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        switch (m_uiPhase)
        {
            case PHASE_SPEECH:
            {
                if (m_uiSpeechTimer < uiDiff)
                {
                    m_uiSpeechTimer = 5000;
                    ++m_uiSpeechCount;

                    switch (m_uiSpeechCount)
                    {
                        case 1:
                            DoScriptText(SAY_SPEECH_2, m_creature);
                            break;
                        case 2:
                            DoScriptText(SAY_SPEECH_3, m_creature);
                            break;
                        case 3:
                            DoScriptText(SAY_SPEECH_4, m_creature);
                            break;
                        case 4:
                            m_uiPhase = PHASE_BALCONY;
                            break;
                    }
                }
                else
                    m_uiSpeechTimer -= uiDiff;

                break;
            }
            case PHASE_BALCONY:
            {
                if (m_uiSummonTimer < uiDiff)
                {
                    if (m_uiSummonCount >= MAX_WAVES)
                    {
                        DoScriptText(SAY_TELEPORT, m_creature);
                        DoScriptText(EMOTE_TO_FRAY, m_creature);
                        DoCastSpellIfCan(m_creature, SPELL_TELEPORT_RIGHT);
                        m_uiPhase = PHASE_GROUND;
                        return;
                    }

                    // npc, npc, npc, timer
                    static uint32 const auiSummonData[MAX_WAVES][4] =
                    {
                        {NPC_UNREL_TRAINEE, 0, 0, 20000},
                        {NPC_UNREL_TRAINEE, 0, 0, 20000},
                        {NPC_UNREL_TRAINEE, 0, 0, 10000},
                        {NPC_UNREL_DEATH_KNIGHT, 0, 0, 10000},
                        {NPC_UNREL_TRAINEE, 0, 0, 15000},
                        {NPC_UNREL_DEATH_KNIGHT, 0, 0, 10000},
                        {NPC_UNREL_TRAINEE, 0, 0, 15000},
                        {NPC_UNREL_DEATH_KNIGHT, NPC_UNREL_TRAINEE, 0, 10000},
                        {NPC_UNREL_RIDER, 0, 0, 10000},
                        {NPC_UNREL_TRAINEE, 0, 0, 5000},
                        {NPC_UNREL_DEATH_KNIGHT, 0, 0, 15000},
                        {NPC_UNREL_TRAINEE, NPC_UNREL_RIDER, 0, 10000},
                        {NPC_UNREL_DEATH_KNIGHT, NPC_UNREL_DEATH_KNIGHT, 0, 10000},
                        {NPC_UNREL_TRAINEE, 0, 0, 10000},
                        {NPC_UNREL_RIDER, 0, 0, 5000},
                        {NPC_UNREL_DEATH_KNIGHT, 0, 0, 5000},
                        {NPC_UNREL_TRAINEE, 0, 0, 20000},
                        {NPC_UNREL_RIDER, NPC_UNREL_DEATH_KNIGHT, NPC_UNREL_TRAINEE, 15000},
                        {NPC_UNREL_TRAINEE, 0, 0, 30000},
                    };

                    SummonAdds(true, auiSummonData[m_uiSummonCount][0]);

                    if (auiSummonData[m_uiSummonCount][1])
                        SummonAdds(true, auiSummonData[m_uiSummonCount][1]);

                    if (auiSummonData[m_uiSummonCount][2])
                        SummonAdds(true, auiSummonData[m_uiSummonCount][2]);

                    m_uiSummonTimer = auiSummonData[m_uiSummonCount][3];

                    ++m_uiSummonCount;
                }
                else
                    m_uiSummonTimer -= uiDiff;

                break;
            }
            case PHASE_GROUND:
            case PHASE_END:
            {
                if (m_uiPhase == PHASE_GROUND)
                {
                    if (m_creature->GetHealthPercent() < 30.0f)
                    {
                        if (m_pInstance->IsInRightSideGothArea(m_creature))
                        {
                            DoScriptText(EMOTE_GATE, m_creature);
                            m_pInstance->SetData(TYPE_GOTHIK, SPECIAL);
                            m_uiPhase = PHASE_END;
                            m_uiShadowboltTimer = 2000;
                            return;
                        }
                    }

                    if (m_uiTeleportTimer < uiDiff)
                    {
                        uint32 uiTeleportSpell = m_pInstance->IsInRightSideGothArea(m_creature) ? SPELL_TELEPORT_LEFT : SPELL_TELEPORT_RIGHT;

                        if (DoCastSpellIfCan(m_creature, uiTeleportSpell) == CAST_OK)
                        {
                            DoResetThreat();
                            m_uiTeleportTimer = 15000;
                            m_uiShadowboltTimer = 2000;
                            return;
                        }
                    }
                    else
                        m_uiTeleportTimer -= uiDiff;
                }

                if (m_uiShadowboltTimer < uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOWBOLT) == CAST_OK)
                        m_uiShadowboltTimer = 1500;
                }
                else
                    m_uiShadowboltTimer -= uiDiff;

                DoMeleeAttackIfReady();                     // possibly no melee at all
                break;
            }
        }
    }
};

CreatureAI* GetAI_boss_gothik(Creature* pCreature)
{
    return new boss_gothikAI(pCreature);
}

bool EffectDummyCreature_spell_anchor(Unit* pCaster, uint32 uiSpellId, SpellEffectIndex uiEffIndex, Creature* pCreatureTarget)
{
    if (uiEffIndex != EFFECT_INDEX_0 || pCreatureTarget->GetEntry() != NPC_SUB_BOSS_TRIGGER)
        return true;

    instance_naxxramas* pInstance = (instance_naxxramas*)pCreatureTarget->GetInstanceData();

    if (!pInstance)
        return true;

    switch (uiSpellId)
    {
        case SPELL_A_TO_ANCHOR_1:                           // trigger mobs at high right side
        case SPELL_B_TO_ANCHOR_1:
        case SPELL_C_TO_ANCHOR_1:
        {
            if (Creature* pAnchor2 = pInstance->GetClosestAnchorForGoth(pCreatureTarget, false))
            {
                uint32 uiTriggered = SPELL_A_TO_ANCHOR_2;

                if (uiSpellId == SPELL_B_TO_ANCHOR_1)
                    uiTriggered = SPELL_B_TO_ANCHOR_2;
                else if (uiSpellId == SPELL_C_TO_ANCHOR_1)
                    uiTriggered = SPELL_C_TO_ANCHOR_2;

                pCreatureTarget->CastSpell(pAnchor2, uiTriggered, true);
            }

            return true;
        }
        case SPELL_A_TO_ANCHOR_2:                           // trigger mobs at high left side
        case SPELL_B_TO_ANCHOR_2:
        case SPELL_C_TO_ANCHOR_2:
        {
            std::list<Creature*> lTargets;
            pInstance->GetGothSummonPointCreatures(lTargets, false);

            if (!lTargets.empty())
            {
                std::list<Creature*>::iterator itr = lTargets.begin();
                uint32 uiPosition = urand(0, lTargets.size() - 1);
                advance(itr, uiPosition);

                if (Creature* pTarget = (*itr))
                {
                    uint32 uiTriggered = SPELL_A_TO_SKULL;

                    if (uiSpellId == SPELL_B_TO_ANCHOR_2)
                        uiTriggered = SPELL_B_TO_SKULL;
                    else if (uiSpellId == SPELL_C_TO_ANCHOR_2)
                        uiTriggered = SPELL_C_TO_SKULL;

                    pCreatureTarget->CastSpell(pTarget, uiTriggered, true);
                }
            }
            return true;
        }
        case SPELL_A_TO_SKULL:                              // final destination trigger mob
        case SPELL_B_TO_SKULL:
        case SPELL_C_TO_SKULL:
        {
            if (Creature* pGoth = pInstance->instance->GetCreature(pInstance->GetData64(NPC_GOTHIK)))
            {
                uint32 uiNpcEntry = NPC_SPECT_TRAINEE;

                if (uiSpellId == SPELL_B_TO_SKULL)
                    uiNpcEntry = NPC_SPECT_DEATH_KNIGTH;
                else if (uiSpellId == SPELL_C_TO_SKULL)
                    uiNpcEntry = NPC_SPECT_RIDER;

                pGoth->SummonCreature(uiNpcEntry, pCreatureTarget->GetPositionX(), pCreatureTarget->GetPositionY(), pCreatureTarget->GetPositionZ(), pCreatureTarget->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);

                if (uiNpcEntry == NPC_SPECT_RIDER)
                    pGoth->SummonCreature(NPC_SPECT_HORSE, pCreatureTarget->GetPositionX(), pCreatureTarget->GetPositionY(), pCreatureTarget->GetPositionZ(), pCreatureTarget->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
            }
            return true;
        }
    }

    return true;
};

void AddSC_boss_gothik()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_gothik";
    newscript->GetAI = &GetAI_boss_gothik;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_anchor";
    newscript->pEffectDummyCreature = &EffectDummyCreature_spell_anchor;
    newscript->RegisterSelf();
}
