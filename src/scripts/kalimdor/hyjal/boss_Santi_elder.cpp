/* ScriptData
SDName: boss_Santi_elder
SDCategory:
EndScriptData */

#include "scriptPCH.h"

enum
{
	EMOTE_SERVICE          = -1100000,
	EMOTE_SERVICE1         = -1100001,
	EMOTE_SERVICE2         = -1100002,

	SPELL_INFERNO          = 19695,      //µØÓü»ð
	SPELL_LIVINGBOMB       = 20475,      //»îÌåÕ¨µ¯
	SPELL_RAGE             = 27680,      //¿ñ±©
	SPELL_MAGMASHACKLES    = 19496,      //ÈÛÑÒÁÍîí
	SPELL_INVOCATION       = 26446       //ÕÙ»½Íæ¼Ò
};

struct boss_Santi_elderAI : ScriptedAI
{
	boss_Santi_elderAI::boss_Santi_elderAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		boss_Santi_elderAI::Reset();
	}

	uint32 m_uiIgniteManaTimer;
	uint32 m_uiLivingBombTimer;
	uint32 m_uiInfernoTimer;
	uint32 m_uiInfernoAltTimer;
	uint32 m_uiRestoreTargetTimer;
	uint32 InfCount;
	uint32 Tick;

	uint32 m_uiMagmaShacklesTimer;
	uint32 m_uiTrash_Invocation;

	bool m_bInferno;
	bool m_bArmaelder;

	void boss_Santi_elderAI::Reset()
	{
		m_uiIgniteManaTimer = urand(10000, 15000);
		m_uiLivingBombTimer = urand(15000, 20000);
		m_uiInfernoTimer = urand(18000, 24000);
		m_uiRestoreTargetTimer = 0;

		m_uiMagmaShacklesTimer = 10000;
		m_uiTrash_Invocation = 10000;

		m_bInferno = false;
		m_bArmaelder = false;

	}

	void boss_Santi_elderAI::UpdateAI(uint32 const uiDiff)
	{
		if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
			return;

		if (!m_bArmaelder)
		{
			if (m_creature->GetHealthPercent() < 15.0f)
			{
				m_creature->InterruptNonMeleeSpells(true);
				if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_RAGE) == CAST_OK)
					DoScriptText(EMOTE_SERVICE, m_creature);
				m_bArmaelder = true;
				return;
			}
		}

		if (m_uiLivingBombTimer < uiDiff)
		{
			if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0, nullptr, SELECT_FLAG_PLAYER))
			{
				if (DoCastSpellIfCan(pTarget, SPELL_LIVINGBOMB) == CAST_OK)
				{
					m_creature->SetInFront(pTarget);
					m_creature->SetTargetGuid(pTarget->GetObjectGuid());
					m_uiLivingBombTimer = urand(12000, 15000);
					m_uiRestoreTargetTimer = 800;
				}
			}
		}
		else
			m_uiLivingBombTimer -= uiDiff;

		// Restore original target after casting Living Bomb on someone
		if (m_uiRestoreTargetTimer)
		{
			if (m_uiRestoreTargetTimer <= uiDiff)
			{
				if (Unit* pTarget = m_creature->GetVictim())
				{
					m_creature->SetInFront(pTarget);
					m_creature->SetTargetGuid(pTarget->GetObjectGuid());
					m_uiRestoreTargetTimer = 0;
				}
			}
			else
				m_uiRestoreTargetTimer -= uiDiff;
		}

		//
		if (m_uiIgniteManaTimer < uiDiff)
		{
			if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MAGMASHACKLES) == CAST_OK)
				m_uiIgniteManaTimer = 15000;
		}
		else
			m_uiIgniteManaTimer -= uiDiff;

		/* Invocation */
		if (m_uiTrash_Invocation < uiDiff)
		{
			if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_INVOCATION) == CAST_OK)
				m_uiTrash_Invocation = 10000 + (rand() % 10000);
			    DoScriptText(EMOTE_SERVICE1, m_creature);
		}
		else
			m_uiTrash_Invocation -= uiDiff;

		DoMeleeAttackIfReady();
		//

		if (m_uiMagmaShacklesTimer < uiDiff)
		{
			if (DoCastSpellIfCan(m_creature, SPELL_INFERNO) == CAST_OK)
			{
				m_uiMagmaShacklesTimer = urand(18000, 24000);
				InfCount = 0;
				Tick = 1000;
				m_bInferno = true;
				m_creature->AddUnitState(UNIT_STAT_ROOT);
				DoScriptText(EMOTE_SERVICE2, m_creature);
			}
		}
		else
			m_uiMagmaShacklesTimer -= uiDiff;

		// Inferno damage increases with each tick
		if (m_bInferno)
		{
			if (Tick >= 1000)
			{
				int Damage = 0;
				switch (InfCount)
				{
				case 0:
				case 1:
					Damage = 35500;
					break;
				case 2:
				case 3:
					Damage = 45000;
					break;
				case 4:
				case 5:
					Damage = 55500;
					break;
				case 6:
				case 7:
					Damage = 62000;
					break;
				case 8:
					Damage = 188500;
					m_bInferno = false;
					m_creature->ClearUnitState(UNIT_STAT_ROOT);
					break;
				}
				m_creature->CastCustomSpell(m_creature, 19698, &Damage, nullptr, nullptr, true);
				InfCount++;
				Tick = 0;
			}
			Tick += uiDiff;
			return;
		}

		DoMeleeAttackIfReady();
	}
};

CreatureAI* GetAI_boss_Santi_elder(Creature* pCreature)
{
	return new boss_Santi_elderAI(pCreature);
}

void AddSC_boss_Santi_elder()
{
	Script* newscript;
	newscript = new Script;
	newscript->Name = "boss_Santi_elder";
	newscript->GetAI = &GetAI_boss_Santi_elder;
	newscript->RegisterSelf();
}
