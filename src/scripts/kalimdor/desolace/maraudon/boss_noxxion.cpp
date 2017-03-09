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
SDName: Boss_Noxxion
SD%Complete: 100
SDComment:
SDCategory: Maraudon
EndScriptData */

#include "scriptPCH.h"

#define SPELL_TOXICVOLLEY           21687
#define SPELL_UPPERCUT              22916

struct boss_noxxionAI : public ScriptedAI
{
    boss_noxxionAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 ToxicVolley_Timer;
    uint32 Uppercut_Timer;
    uint32 Adds_Timer;
    uint32 Invisible_Timer;
    bool Invisible;

    void Reset()
    {
        ToxicVolley_Timer = 7000;
        Uppercut_Timer = 16000;
        Adds_Timer = 19000;
        Invisible_Timer = 15000;                            //Too much too low?
        Invisible = false;
    }

    void SummonAdds(Unit* victim)
    {
        if (Creature* summoned = DoSpawnCreature(13456, 8.0f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 90000))
            if (summoned->AI())
                summoned->AI()->AttackStart(victim);
    }

    void UpdateAI(const uint32 diff)
    {
        if (Invisible && Invisible_Timer < diff)
        {
            //Become visible again
            m_creature->setFaction(14);
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            //Noxxion model
            m_creature->SetDisplayId(11172);
            Invisible = false;
            //m_creature->m_canMove = true;
        }
        else if (Invisible)
        {
            Invisible_Timer -= diff;
            //Do nothing while invisible
            return;
        }

        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //ToxicVolley_Timer
        if (ToxicVolley_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_TOXICVOLLEY) == CAST_OK)
                ToxicVolley_Timer = 9000;
        }
        else
            ToxicVolley_Timer -= diff;

        //Uppercut_Timer
        if (Uppercut_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_UPPERCUT) == CAST_OK)
                Uppercut_Timer = 12000;
        }
        else
            Uppercut_Timer -= diff;

        //Adds_Timer
        if (!Invisible && Adds_Timer < diff)
        {
            //Inturrupt any spell casting
            m_creature->InterruptNonMeleeSpells(false);
            m_creature->setFaction(35);
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            // Invisible Model
            m_creature->SetDisplayId(11686);
            for (int i = 0; i < 5; ++i)
                SummonAdds(m_creature->getVictim());
            Invisible = true;
            Invisible_Timer = 15000;

            Adds_Timer = 40000;
        }
        else
            Adds_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_noxxion(Creature* pCreature)
{
    return new boss_noxxionAI(pCreature);
}

enum
{
    SPELL_SHOOT             =   16100, /* Distance spell */
    SPELL_BOMB              =   9143,  /* Distance spell */
    SPELL_FLASH_BOMB        =   29419, /* Only Fear beast, Druid form included */
    SPELL_GOBLIN_DRAGON_GUN =   21833, /* Contact spell */
};

struct TinkererGizlockAI : public ScriptedAI
{
    TinkererGizlockAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool   m_bIsOutOfRange;
    bool   m_bIsBombLaunched;
    uint32 m_uiShoot_Timer;
    uint32 m_uiBomb_Timer;
    uint32 m_uiFlashBomb_Timer;
    uint32 m_uiGoblinDragonGun_Timer;

    void Reset()
    {
        m_creature->clearUnitState(UNIT_STAT_ROOT);
        m_bIsBombLaunched         = false;
        m_bIsOutOfRange           = false;
        m_uiShoot_Timer           = 3000;
        m_uiBomb_Timer            = 2700;
        m_uiFlashBomb_Timer       = 5000;
        m_uiGoblinDragonGun_Timer = 7500;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        /** Techniques changes depending on the distance of his target */
        if (m_creature->GetDistance2d(m_creature->getVictim()) > 8.0f &&
                m_creature->GetDistance2d(m_creature->getVictim()) < 25.0f)
        {
            m_creature->addUnitState(UNIT_STAT_ROOT);
            m_bIsOutOfRange = true;
        }
        else
        {
            m_creature->clearUnitState(UNIT_STAT_ROOT);
            m_bIsOutOfRange = false;
        }

        /*        A druid in changeform is also condisered as a pet.
         *
         *        Source : "Apparently, he is impossible to tank as a bear.
         *        I got feared by his Flash Bomb attack four times over the
         *        course of the fight - each time for a full 9 seconds."*/
        if (m_uiFlashBomb_Timer < uiDiff)
        {
            m_bIsBombLaunched = false;
            Map* pMap = m_creature->GetMap();
            if (!pMap)
                return;

            Map::PlayerList const &PlayerList = pMap->GetPlayers();

            for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end() && !m_bIsBombLaunched; ++itr)
            {
                Player* pPlayer = itr->getSource();

                if(!pPlayer)
                    continue;

                Unit*   pPet    = pPlayer->GetPet();

                /** Range limit set to 35 meters/yards */
                if (pPlayer->IsInFeralForm() && m_creature->GetDistance2d(pPlayer) < 35.0f)
                {
                    if (DoCastSpellIfCan(pPlayer, SPELL_FLASH_BOMB) == CAST_OK)
                        m_uiFlashBomb_Timer = 7500;
                    m_bIsBombLaunched = true;
                }
                else if (pPet && m_creature->GetDistance2d(pPet) < 35.0f)
                {
                    if (DoCastSpellIfCan(pPet, SPELL_FLASH_BOMB) == CAST_OK)
                        m_uiFlashBomb_Timer = 7500;
                    m_bIsBombLaunched = true;
                }
            }
        }
        else
            m_uiFlashBomb_Timer -= uiDiff;

        switch (m_bIsOutOfRange)
        {
            case 0:
                if (m_uiGoblinDragonGun_Timer < uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_GOBLIN_DRAGON_GUN) == CAST_OK)
                        m_uiGoblinDragonGun_Timer = urand(7500, 10000);
                }
                else
                    m_uiGoblinDragonGun_Timer -= uiDiff;
                break;
            case 1:
                /** Launch a Bomb on random target */
                if (m_uiBomb_Timer < uiDiff)
                {
                    Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
                    if (target)
                    {
                        DoCastSpellIfCan(m_creature->getVictim(), SPELL_BOMB);
                        m_uiBomb_Timer = 7500;
                    }
                }
                else
                    m_uiBomb_Timer -= uiDiff;

                if (m_uiShoot_Timer < uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHOOT) == CAST_OK)
                        m_uiShoot_Timer = 3000;
                }
                else
                    m_uiShoot_Timer -= uiDiff;
                break;
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_TinkererGizlockAI(Creature* pCreature)
{
    return new TinkererGizlockAI(pCreature);
}

void AddSC_boss_noxxion()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_noxxion";
    newscript->GetAI = &GetAI_boss_noxxion;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_tinkerer";
    newscript->GetAI = &GetAI_TinkererGizlockAI;
    newscript->RegisterSelf();

}
