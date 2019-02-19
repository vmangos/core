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
SDName: boss_kirtonos_the_herald
SD%Complete: 100
SDComment:
SDCategory: Scholomance
EndScriptData */

#include "scriptPCH.h"
#include "scholomance.h"

enum Spells
{
	SPELL_SWOOP = 18144,
	SPELL_WING_FLAP = 12882,
	SPELL_PIERCE_ARMOR = 6016,
	SPELL_DISARM = 8379,
	SPELL_KIRTONOS_TRANSFORM = 16467,
	SPELL_SHADOW_BOLT = 17228,
	SPELL_CURSE_OF_TONGUES = 12889,
	SPELL_DOMINATE_MIND = 14515
};

enum Events
{
	INTRO_1 = 1,
	INTRO_2 = 2,
	INTRO_3 = 3,
	INTRO_4 = 4,
	INTRO_5 = 5,
	INTRO_6 = 6,
	EVENT_SWOOP = 7,
	EVENT_WING_FLAP = 8,
	EVENT_PIERCE_ARMOR = 9,
	EVENT_DISARM = 10,
	EVENT_SHADOW_BOLT = 11,
	EVENT_CURSE_OF_TONGUES = 12,
	EVENT_DOMINATE_MIND = 13,
	EVENT_KIRTONOS_TRANSFORM = 14
};

enum Misc
{
	WEAPON_KIRTONOS_STAFF = 11365,
	POINT_KIRTONOS_LAND = 13
};

struct Locations
{
	float x, y, z;
};

static Locations ronde[] =
{
	{316.709f, 71.2683f, 104.584f},
	{321.16f, 72.8097f, 104.668f},
	{332.371f, 77.9899f, 105.862f},
	{333.325f, 86.6016f, 106.64f},
	{334.126f, 101.684f, 106.834f},
	{331.046f, 114.593f, 106.362f},
	{329.544f, 126.702f, 106.14f},
	{335.247f, 136.546f, 105.723f},
	{343.21f, 139.946f, 107.64f},
	{364.329f, 140.901f, 109.945f},
	{362.676f, 115.638f, 110.307f},
	{341.79f, 91.9439f, 105.168f},
	{313.495f, 93.4594f, 104.057f},
	{306.384f, 93.6168f, 104.057f}
};

struct boss_kirtonos_the_heraldAI : public ScriptedAI
{
	boss_kirtonos_the_heraldAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
	}

	ScriptedInstance*	pInstance;
	EventMap			events;
	bool				WayPointsDone = false;

	void Reset()
	{
		// In this Video from 2006 Kirtonos despawned after a wipe: https://www.youtube.com/watch?v=FkxkmDNnv3Y
		// me->ForcedDespawn(true); //<- this is Blizzlike.

		// Here the Boss resets goes to Undead form and waits in the Room for another pull.
		events.Reset();
		OpenDoor();
		me->CombatStop(true);
		me->GetMotionMaster()->MovePoint(0, 314.8673f, 90.30210f, 101.6459f, 0.0f);
		if (WayPointsDone && !me->HasAura(SPELL_KIRTONOS_TRANSFORM))
		{
			me->SetObjectScale(1.35f);
			DoCast(me, SPELL_KIRTONOS_TRANSFORM);
			me->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, uint32(WEAPON_KIRTONOS_STAFF));
		}
	}

	void JustDied(Unit *killer)
	{
		OpenDoor();
	}

	void OnRemoveFromWorld()
	{
		// If the Boss despawns alive for any reason. Reset the Brazier and open the Door.
		if (!me->isDead())
		{
			OpenDoor();
			if (GameObject* pGo = me->FindNearestGameObject(GO_BRAZIER_KIRTONOS, 100.0f))
				pGo->ResetDoorOrButton();
		}
	}

	void OpenDoor()
	{
		if (GameObject* pDoor = me->FindNearestGameObject(GO_GATE_KIRTONOS, 100.0f))
			pDoor->ResetDoorOrButton();
	}

	void CloseDoor()
	{
		if (GameObject* pDoor = me->FindNearestGameObject(GO_GATE_KIRTONOS, 100.0f))
			pDoor->UseDoorOrButton();
	}

	void JustSummoned(Creature* pCreature) override
	{
		// If clicked the Brazier (GOOpen_brazier_herald) from "instance_scholomance.cpp" 
		events.ScheduleEvent(INTRO_1, 500);
		me->SetFly(true);
		me->SetReactState(REACT_PASSIVE);
		me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
	}

	void Aggro(Unit* pWho)
	{
		me->SetInCombatWithZone();
		CloseDoor();
		events.ScheduleEvent(EVENT_SWOOP, urand(8000, 8000));
		events.ScheduleEvent(EVENT_WING_FLAP, urand(15000, 15000));
		events.ScheduleEvent(EVENT_PIERCE_ARMOR, urand(18000, 18000));
		events.ScheduleEvent(EVENT_DISARM, urand(22000, 22000));
		events.ScheduleEvent(EVENT_SHADOW_BOLT, urand(42000, 42000));
		events.ScheduleEvent(EVENT_CURSE_OF_TONGUES, urand(53000, 53000));
		events.ScheduleEvent(EVENT_DOMINATE_MIND, urand(34000, 48000));
		events.ScheduleEvent(EVENT_KIRTONOS_TRANSFORM, urand(20000, 20000));
	}

	void EnterEvadeMode()
	{
		Reset();
	}

	void MovementInform(uint32 type, uint32 uiPointId)
	{
		// I used MOVE_PATHFINDING here, maybe its more Blizzlike without but it looks more like smooth flying.
		if (!me->HasAura(SPELL_KIRTONOS_TRANSFORM))
		{
			if (uiPointId < POINT_KIRTONOS_LAND && !WayPointsDone)
				me->GetMotionMaster()->MovePoint(uiPointId + 1, ronde[uiPointId + 1].x, ronde[uiPointId + 1].y, ronde[uiPointId + 1].z, MOVE_PATHFINDING);
			else if (uiPointId == POINT_KIRTONOS_LAND)
			{
				WayPointsDone = true;
				events.ScheduleEvent(INTRO_2, 1500);
			}
		}
	}

	void UpdateAI(uint32 diff)
	{
		events.Update(diff);

		if (!UpdateVictim())
		{
			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case INTRO_1:
					CloseDoor();
					me->SetSpeedRate(MOVE_WALK, 3.0f, true); // In Videos Kirtonos is flying faster than normal speed.
					me->GetMotionMaster()->MovePoint(0, 316.709f, 71.2683f, 104.584f, 0.0f);
					break;
				case INTRO_2:
					me->GetMotionMaster()->MovePoint(0, 299.4884f, 92.76137f, 105.6335f, 0.0f); // The place where Kirtonos transforms to Undead.
					events.ScheduleEvent(INTRO_3, 1000);
					break;
				case INTRO_3:
					// set movement_type to 0 in creature_template for Kirtonos or he will fly ahead after Landing.
					me->SetFacingTo(0.01745329f);
					me->StopMoving();
					events.ScheduleEvent(INTRO_4, 3000);
					break;
				case INTRO_4:
					me->SetFly(false);
					me->SetWalk(true);
					me->SetSpeedRate(MOVE_WALK, 1.0f, true); // Back to normal speed if landed.
					DoCast(me, SPELL_KIRTONOS_TRANSFORM);
					me->SetObjectScale(1.35f); // In https://www.youtube.com/watch?v=FkxkmDNnv3Y Kirtonos is than than a Player Undead like a Tauren i guess 1.35 scale. You can see how he's growing after landing.
					events.ScheduleEvent(INTRO_5, 1000);
					break;
				case INTRO_5:
					me->HandleEmoteCommand(EMOTE_ONESHOT_ROAR);
					me->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, uint32(WEAPON_KIRTONOS_STAFF));
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
					me->SetReactState(REACT_AGGRESSIVE);
					events.ScheduleEvent(INTRO_6, 5000);
					break;
				case INTRO_6:
					me->GetMotionMaster()->MovePoint(0, 314.8673f, 90.30210f, 101.6459f, 0.0f);
					break;
				default:
					break;
				}
			}

			return;
		}

		if (!me->SelectHostileTarget() || !me->getVictim())
			return;

		while (uint32 eventId = events.ExecuteEvent())
		{
			switch (eventId)
			{
			case EVENT_SWOOP:
				DoCast(me, SPELL_SWOOP);
				events.ScheduleEvent(EVENT_SWOOP, 15000);
				break;
			case EVENT_WING_FLAP:
				DoCast(me, SPELL_WING_FLAP);
				events.ScheduleEvent(EVENT_WING_FLAP, 13000);
				break;
			case EVENT_PIERCE_ARMOR:
				if (DoCastSpellIfCan(m_creature->getVictim(), EVENT_PIERCE_ARMOR) == CAST_OK)
					events.ScheduleEvent(EVENT_PIERCE_ARMOR, 12000);
				break;
			case EVENT_DISARM:
				if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_DISARM) == CAST_OK)
					events.ScheduleEvent(EVENT_DISARM, 11000);
				break;
			case EVENT_SHADOW_BOLT:
				if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOW_BOLT) == CAST_OK)
					events.ScheduleEvent(EVENT_SHADOW_BOLT, 42000);
				break;
			case EVENT_CURSE_OF_TONGUES:
				if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CURSE_OF_TONGUES) == CAST_OK)
					events.ScheduleEvent(EVENT_CURSE_OF_TONGUES, 35000);
				break;
			case EVENT_DOMINATE_MIND:
				if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_DOMINATE_MIND) == CAST_OK)
					events.ScheduleEvent(EVENT_DOMINATE_MIND, urand(44000, 48000));
				break;
			case EVENT_KIRTONOS_TRANSFORM:
				if (me->HasAura(SPELL_KIRTONOS_TRANSFORM))
				{
					me->SetObjectScale(1.0f);
					me->RemoveAurasDueToSpell(SPELL_KIRTONOS_TRANSFORM);
					me->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, uint32(0));
				}
				else
				{
					me->SetObjectScale(1.35f);
					DoCast(me, SPELL_KIRTONOS_TRANSFORM);
					me->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, uint32(WEAPON_KIRTONOS_STAFF));
				}
				events.ScheduleEvent(EVENT_KIRTONOS_TRANSFORM, urand(16000, 18000));
				break;
			default:
				break;
			}

		}

		DoMeleeAttackIfReady();
	}
};

CreatureAI* GetAI_boss_kirtonos_the_herald(Creature* pCreature)
{
    return new boss_kirtonos_the_heraldAI(pCreature);
}

void AddSC_boss_kirtonos_the_herald()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_kirtonos_the_herald";
    newscript->GetAI = &GetAI_boss_kirtonos_the_herald;
    newscript->RegisterSelf();
}
