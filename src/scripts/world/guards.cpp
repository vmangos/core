/* Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Guards
SD%Complete: 100
SDComment: All Guard gossip data, quite some npc_text-id's still missing, adding constantly as new id's are known. CombatAI should be organized better for future.
SDCategory: Guards
EndScriptData */

/* ContentData
guard_contested
guard_darnassus
guard_dunmorogh
guard_durotar
guard_elwynnforest
guard_ironforge
guard_mulgore
guard_orgrimmar
guard_stormwind
guard_teldrassil
guard_tirisfal
guard_undercity
EndContentData */

#include "scriptPCH.h"

CreatureAI* GetAI_guard_contested(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_darnassus(Creature* pCreature)
{
    return new guardAI(pCreature, true);
}

CreatureAI* GetAI_guard_dunmorogh(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_durotar(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_elwynnforest(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_ironforge(Creature* pCreature)
{
    return new guardAI(pCreature, true);
}

CreatureAI* GetAI_guard_mulgore(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_orgrimmar(Creature* pCreature)
{
    return new guardAI_orgrimmar(pCreature);
}

CreatureAI* GetAI_guard_stormwind(Creature* pCreature)
{
    return new guardAI_stormwind(pCreature);
}

CreatureAI* GetAI_guard_teldrassil(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_tirisfal(Creature* pCreature)
{
    return new guardAI(pCreature);
}

CreatureAI* GetAI_guard_undercity(Creature* pCreature)
{
    return new guardAI(pCreature, true);
}

CreatureAI* GetAI_guard_bluffwatcher(Creature* pCreature)
{
    return new guardAI(pCreature, true);
}

void AddSC_guards()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "guard_contested";
    newscript->GetAI = &GetAI_guard_contested;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_darnassus";
    newscript->GetAI = &GetAI_guard_darnassus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_dunmorogh";
    newscript->GetAI = &GetAI_guard_dunmorogh;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_durotar";
    newscript->GetAI = &GetAI_guard_durotar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_elwynnforest";
    newscript->GetAI = &GetAI_guard_elwynnforest;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_ironforge";
    newscript->GetAI = &GetAI_guard_ironforge;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_mulgore";
    newscript->GetAI = &GetAI_guard_mulgore;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_orgrimmar";
    newscript->GetAI = &GetAI_guard_orgrimmar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_stormwind";
    newscript->GetAI = &GetAI_guard_stormwind;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_teldrassil";
    newscript->GetAI = &GetAI_guard_teldrassil;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_tirisfal";
    newscript->GetAI = &GetAI_guard_tirisfal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_undercity";
    newscript->GetAI = &GetAI_guard_undercity;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "guard_bluffwatcher";
    newscript->GetAI = &GetAI_guard_bluffwatcher;
    newscript->RegisterSelf();

}
