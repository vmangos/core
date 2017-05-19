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
SDName: Elwynn_Forest
SD%Complete: 50
SDComment: Quest support: 1786
SDCategory: Elwynn Forest
EndScriptData */

/* ContentData
npc_henze_faulk
EndContentData */

#include "scriptPCH.h"

/*######
## npc_henze_faulk
######*/

#define SAY_HEAL    -1000187

struct npc_henze_faulkAI : public ScriptedAI
{
    uint32 lifeTimer;
    bool spellHit;

    npc_henze_faulkAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset()
    {
        lifeTimer = 120000;
        m_creature->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
        m_creature->SetStandState(UNIT_STAND_STATE_DEAD);   // lay down
        spellHit = false;
    }

    void MoveInLineOfSight(Unit *who) { }

    void UpdateAI(const uint32 diff)
    {
        if (m_creature->IsStandState())
        {
            if (lifeTimer < diff)
                m_creature->AI()->EnterEvadeMode();
            else
                lifeTimer -= diff;
        }
    }

    void SpellHit(Unit *Hitter, const SpellEntry *Spellkind)
    {
        if (Spellkind->Id == 8593 && !spellHit)
        {
            DoCastSpellIfCan(m_creature, 32343);
            m_creature->SetStandState(UNIT_STAND_STATE_STAND);
            m_creature->SetUInt32Value(UNIT_DYNAMIC_FLAGS, 0);
            //m_creature->RemoveAllAuras();
            DoScriptText(SAY_HEAL, m_creature, Hitter);
            spellHit = true;
        }
    }

};
CreatureAI* GetAI_npc_henze_faulk(Creature* pCreature)
{
    return new npc_henze_faulkAI(pCreature);
}
enum
{
//guid 12609 entry 177673 Serpant statue
    NPC_SPIRIT                  = 2044,
    QUEST_STALVANS_LEGEND       = 75

};
struct go_marshal_haggards_chestAI: public GameObjectAI
{
    go_marshal_haggards_chestAI(GameObject* pGo) : GameObjectAI(pGo)
    {
        timer = 0;
        state = 0;
        guid_spirit = 0;
    }
    uint64 guid_spirit;
    uint32 timer;
    bool state;//0 = usual, can launch. //1 = in use, cannot launch

    void UpdateAI(const uint32 uiDiff)
    {
        if (state)
        {
            if (timer < uiDiff)
                state = 0;
            else
                timer -= uiDiff;
        }
    }
    bool CheckCanStartEvent()
    {
        if (!state && !me->GetMap()->GetCreature(guid_spirit))
            return true;
        return false;
    }

    void SetInUse(Creature* spirit)
    {
        guid_spirit = spirit->GetGUID();
        state = 1;
        timer = 60000;
    }
};
GameObjectAI* GetAIgo_marshal_haggards_chest(GameObject *pGo)
{
    return new go_marshal_haggards_chestAI(pGo);
}
bool GOHello_go_marshal_haggards_chest(Player* pPlayer, GameObject* pGo)
{
    if (go_marshal_haggards_chestAI* pMarkAI = dynamic_cast<go_marshal_haggards_chestAI*>(pGo->AI()))
    {
        if (pMarkAI->CheckCanStartEvent())
        {
            if (pPlayer->GetQuestStatus(QUEST_STALVANS_LEGEND) == QUEST_STATUS_INCOMPLETE)
            {
                if (Creature* spirit = pGo->SummonCreature(NPC_SPIRIT, -9552.67, -1431.93, 62.3, 5.03, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 300000))
                {
                    pMarkAI->SetInUse(spirit);
                    spirit->AI()->AttackStart(pPlayer);
                }
            }
        }
    }
    return true;
}
void AddSC_elwynn_forest()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_henze_faulk";
    newscript->GetAI = &GetAI_npc_henze_faulk;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_marshal_haggards_chest";
    newscript->GOGetAI = &GetAIgo_marshal_haggards_chest;
    newscript->pGOHello = &GOHello_go_marshal_haggards_chest;
    newscript->RegisterSelf();
}
