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
SDName: Battleground
SD%Complete: 100
SDComment: Spirit guides in battlegrounds will revive all players every 30 sec
SDCategory: Battlegrounds
EndScriptData */

#include "scriptPCH.h"

// **** Script Info ****
// Spiritguides in battlegrounds resurrecting many players at once
// every 30 seconds - through a channeled spell, which gets autocasted
// the whole time
// if spiritguide despawns all players around him will get teleported
// to the next spiritguide
// here i'm not sure, if a dummyspell exist for it

// **** Quick Info ****
// battleground spiritguides - this script handles gossipHello
// and JustDied also it let autocast the channel-spell

enum
{
    SPELL_SPIRIT_HEAL_CHANNEL       = 22011,                // Spirit Heal Channel

    SPELL_SPIRIT_HEAL               = 22012,                // Spirit Heal

    SPELL_WAITING_TO_RESURRECT      = 2584                  // players who cancel this aura don't want a resurrection
};

struct npc_spirit_guideAI : ScriptedAI
{
    explicit npc_spirit_guideAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        uiTimerRez = 0;
        uiInterruptTimer = 0;
        uiDelayCast = 0;

        npc_spirit_guideAI::Reset();
    }

    void Reset() override
    {
    }

    uint32 uiTimerRez;          // main cycle timer
    uint32 uiInterruptTimer;    // when to interrupt the channel
    uint32 uiDelayCast;         // delay before casting 22012 (after interrupt)

    uint32 GetData(uint32 /*type*/) override
    {
        return uiTimerRez;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        // Delayed cast after interrupt
        if (uiDelayCast)
        {
            if (uiDelayCast <= uiDiff)
            {
                // Find a dead player with aura 2584 in range (to cast on)
                Player* target = nullptr;
                Map* map = m_creature->GetMap();
                if (map)
                {
                    Map::PlayerList const& players = map->GetPlayers();
                    for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                    {
                        Player* player = itr->getSource();
                        if (player && player->IsInWorld() && player->GetDistance(m_creature) < 20.0f)
                        {
                            if (!player->IsAlive() && player->HasAura(2584))
                            {
                                target = player;
                                break;
                            }
                        }
                    }
                }

                if (target)
                {
                    // Cast on the player, this triggers the NPC's cast animation
                    m_creature->CastSpell(target, SPELL_SPIRIT_HEAL, false);
                }
                // no eligible target, skip casting
                uiDelayCast = 0;
            }
            else
                uiDelayCast -= uiDiff;
        }

        // Interrupt the channel and prepare to cast 22012
        if (uiInterruptTimer)
        {
            if (uiInterruptTimer <= uiDiff)
            {
                // Stop channeling and remove the aura
                m_creature->InterruptNonMeleeSpells(true);
                m_creature->RemoveAurasDueToSpell(SPELL_SPIRIT_HEAL_CHANNEL);
                // Wait 50ms to let the NPC fully exit the channeling state
                uiDelayCast = 50;
                uiInterruptTimer = 0;
            }
            else
                uiInterruptTimer -= uiDiff;
        }

        // Start a new channel cycle (only if no cast is pending)
        if (uiTimerRez < uiDiff && uiDelayCast == 0)
        {
            m_creature->InterruptNonMeleeSpells(true);
            m_creature->CastSpell(m_creature, SPELL_SPIRIT_HEAL_CHANNEL, false);
            uiInterruptTimer = 30000;   // interrupt after 30s
            uiTimerRez = 31000;         // next cycle at 31s
        }
        else if (uiTimerRez >= uiDiff)
            uiTimerRez -= uiDiff;
    }

    void CorpseRemoved(uint32 &) override
    {
        // TODO: would be better to cast a dummy spell
        Map* pMap = m_creature->GetMap();

        if (!pMap || !pMap->IsBattleGround())
            return;

        Map::PlayerList const &PlayerList = pMap->GetPlayers();

        for (const auto& itr : PlayerList)
        {
            Player* pPlayer = itr.getSource();
            if (!pPlayer || !pPlayer->IsWithinDistInMap(m_creature, 20.0f) || !pPlayer->HasAura(SPELL_WAITING_TO_RESURRECT) || pPlayer->IsAlive())
                continue;

            // repop player again - now this node won't be counted and another node is searched
            pPlayer->RepopAtGraveyard();
        }
    }

    void AttackedBy(Unit* /*pWho*/) override
    {
    }

    void AttackStart(Unit* /*pWho*/) override
    {
    }

    void DamageTaken(Unit* /*pFrom*/, uint32 &damage) override
    {
        damage = 0;
    }
};

bool GossipHello_npc_spirit_guide(Player* pPlayer, Creature* pCreature)
{
    pPlayer->CastSpell(pPlayer, SPELL_WAITING_TO_RESURRECT, true);
    return true;
}

CreatureAI* GetAI_npc_spirit_guide(Creature* pCreature)
{
    return new npc_spirit_guideAI(pCreature);
}

enum
{
    SPELL_SPAWN_EFFECT     = 23235,
    SPELL_BUFF_ALLIANCE_15 = 23033,
    SPELL_BUFF_HORDE_15    = 23033,
    SPELL_BUFF_ALLIANCE_10 = 23574,
    SPELL_BUFF_HORDE_10    = 23033,
};
/*
[SQL]
-- script_name
UPDATE creature_template SET script_name="npc_etendard" WHERE entry IN
(
-- Alliance Alterac
14752,
-- Alliance
14465,
-- Horde Alterac
14751,
-- Horde
14466
);
-- Ajout des sorts
-- Alliance Alterac
UPDATE creature_template SET spell1=23574 WHERE entry = 14752;
-- Alliance
UPDATE creature_template SET spell1=23033 WHERE entry = 14465;
-- Horde Alterac
-- Horde
UPDATE creature_template SET spell1=23576 WHERE entry = 14751;
UPDATE creature_template SET spell1=23036 WHERE entry = 14466;
*/
struct npc_etendardAI : NullCreatureAI
{
    explicit npc_etendardAI(Creature* pCreature) : NullCreatureAI(pCreature)
    {
        m_bSpawned = false;
        m_bAutoRepeatSpell = pCreature->GetCreatureInfo()->totem_spell_id;
    }

    bool m_bSpawned;
    uint32 m_bAutoRepeatSpell;

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_bSpawned)
        {
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
            m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);
            m_creature->CastSpell(m_creature, SPELL_SPAWN_EFFECT, true);
            m_creature->CastSpell(m_creature, m_bAutoRepeatSpell, true);
            m_bSpawned = true;
        }
    }
};


CreatureAI* GetAI_npc_etendard(Creature* pCreature)
{
    return new npc_etendardAI(pCreature);
}

void AddSC_battleground()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_spirit_guide";
    newscript->GetAI = &GetAI_npc_spirit_guide;
    newscript->pGossipHello = &GossipHello_npc_spirit_guide;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_etendard";
    newscript->GetAI = &GetAI_npc_etendard;
    newscript->RegisterSelf();
}
