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

#include "scriptPCH.h"

// Script used by two npcs:
// https://www.wowhead.com/classic/npc=6172/henze-faulk
// https://www.wowhead.com/classic/npc=6177/narm-faulk

static constexpr uint32 SAY_HEAL             = 2283;
static constexpr uint32 SPELL_SYMBOL_OF_LIFE = 8593;

enum State
{
    STATE_RESET        = 0,
    STATE_JUST_REVIVED = 1,
    STATE_DO_EMOTE     = 2
};

struct tome_of_divinityAI : public ScriptedAI
{
    explicit tome_of_divinityAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint8 m_uiState{};
    uint32 m_uiResetTimer{};
    uint32 m_uiTalkTimer{};
    uint32 m_uiEmoteTimer{};
    ObjectGuid m_playerGuid{};
    bool m_bSpellHit{};

    void Reset() override
    {
        m_uiState = STATE_RESET;

        m_uiResetTimer = 120000;
        m_uiTalkTimer  = 1000;
        m_uiEmoteTimer = 1000;

        m_playerGuid.Clear();

        m_bSpellHit = false;

        m_creature->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
        m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
        m_creature->SetDeathState(JUST_DIED);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_creature->IsStandingUp())
        {
            switch (m_uiState)
            {
                case STATE_JUST_REVIVED:
                {
                    if (m_uiTalkTimer < uiDiff)
                    {
                        if (Player* pPlayer = sObjectAccessor.FindPlayer(m_playerGuid))
                        {
                            m_creature->SetFacingToObject(pPlayer);
                            DoScriptText(SAY_HEAL, m_creature, pPlayer);
                        }

                        m_playerGuid.Clear();

                        m_uiState = STATE_DO_EMOTE;
                    }
                    else
                    {
                        m_uiTalkTimer -= uiDiff;
                    }

                    break;
                }
                case STATE_DO_EMOTE:
                {
                    if (m_uiEmoteTimer < uiDiff)
                    {
                        m_creature->HandleEmote(EMOTE_ONESHOT_BOW);
                        m_uiState = STATE_RESET;
                    }
                    else
                    {
                        m_uiEmoteTimer -= uiDiff;
                    }

                    break;
                }
                case STATE_RESET: // no break
                default:
                {
                    if (m_uiResetTimer < uiDiff)
                    {
                        Reset();
                    }
                    else
                    {
                        m_uiResetTimer -= uiDiff;
                    }

                    break;
                }
            }
        }
    }

    void SpellHit(SpellCaster* pCaster, SpellEntry const* pSpellEntry) override
    {
        if (pSpellEntry->Id == SPELL_SYMBOL_OF_LIFE && !m_bSpellHit)
        {
            m_creature->SetStandState(UNIT_STAND_STATE_STAND);
            m_creature->SetUInt32Value(UNIT_DYNAMIC_FLAGS, 0);

            m_uiState = STATE_JUST_REVIVED;

            if (Player* pPlayer = pCaster->ToPlayer())
            {
                m_playerGuid = pPlayer->GetObjectGuid();
                m_bSpellHit = true;
            }
        }
    }
};

CreatureAI* GetAI_tome_of_divinity(Creature* pCreature)
{
    return new tome_of_divinityAI(pCreature);
}

void AddSC_elwynn_forest()
{
    Script* newscript = new Script;
    newscript->Name = "npc_tome_of_divinity";
    newscript->GetAI = &GetAI_tome_of_divinity;
    newscript->RegisterSelf();
}
