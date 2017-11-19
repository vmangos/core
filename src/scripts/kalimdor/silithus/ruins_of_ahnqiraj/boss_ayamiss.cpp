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
SDName: Boss_Ayamiss
SD%Complete: 80
SDComment: evade return to start position missing
SDCategory: Ruins of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"
#include "ruins_of_ahnqiraj.h"

enum
{
    SPELL_STINGERSPRAY          =  25749,
    SPELL_POISONSTINGER         =  25748,                          //only used in phase1
    SPELL_PARALYZE              =  25725,
    SPELL_TRASH                 =  3391,
    SPELL_FRENZY                =  8269,
    SPELL_LASH                  =  25852,

    EMOTE_FRENZY                =  -1000002,

    NPC_HIVEZARA_LARVA          =  15555,

    SPELL_FEED                  =  25721,

    NPC_HIVEZARA_HORNET         =  15934,
    NPC_HIVEZARA_SWARMER        =  15546
};

struct SpawnLocations
{
    float x, y, z;
};

struct MoveLocations
{
    float x, y, z, an;
};

static SpawnLocations Larva[] =
{
    { -9700.200195f, 1567.980835f, 23.901463f}, //old value:  {-9695.0f, 1585.0f, 25.0f},
    { -9659.252930f, 1530.876587f, 22.336987f} //old value:  {-9627.0f, 1538.0f, 21.44f}
};

static SpawnLocations Swarmers[] =
{
    { -9650.0f, 1577.0f, 47.0f}
};

/** Waypoint used by Swarmer from the Hive'Zara to reach player sacrified */
static MoveLocations LarvaMove[] =
{
    { -9696.986328f, 1537.282959f, 21.444189f},
    { -9703.679688f, 1530.602783f, 21.444435f},
    { -9711.226562f, 1523.762695f, 27.463711f},
    { -9715.258789f, 1519.577881f, 27.468229f}
};

struct boss_ayamissAI : public ScriptedAI
{
    boss_ayamissAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiStingerSpray_Timer;
    uint32 m_uiPoisonStinger_Timer;
    uint32 m_uiSummonSwarmer_Timer;
    uint32 m_uiSummonPlayer_Timer;
    uint32 m_uiTrash_Timer;
    uint32 m_uiRelocate_Timer;
    uint32 m_uiLash_Timer;
    uint32 m_uiSacrifice_Timer;

    bool m_bIsInPhaseTwo;
    bool m_bIsEnraged;
    bool m_bRelocated;
    bool m_bStartBattle;
    bool m_bPhaseTwoBeforeTeleport;

    ObjectGuid m_uiSacrificeGuid;
    float m_fSacrificeAggro;

    void Reset()
    {
        m_uiStingerSpray_Timer = 10000;
        m_uiPoisonStinger_Timer = 5000;
        m_uiSummonSwarmer_Timer = 60000;
        m_uiSummonPlayer_Timer = 10000;
        m_uiTrash_Timer = 10000;
        m_uiRelocate_Timer = 5000;
        m_uiLash_Timer = 15000;
        m_uiSacrifice_Timer = 0;

        m_bIsInPhaseTwo = false;
        m_bIsEnraged = false;
        m_bRelocated = false;
        m_bStartBattle = false;
        m_bPhaseTwoBeforeTeleport = false;

        m_uiSacrificeGuid.Clear();
        m_fSacrificeAggro = 0;

        /** Configure Ayamiss into flying mode */
        m_creature->SetFly(true);
        m_creature->SetWalk(false);
        if (IsCombatMovement())
            SetCombatMovement(false);

        /** Force despawn of invocated Hornet and Larva from Hive'Zara */
        std::list<Creature*> GardiensListe;
        GetCreatureListWithEntryInGrid(GardiensListe, m_creature, NPC_HIVEZARA_HORNET, 300.0f);
        for (std::list<Creature*>::iterator itr = GardiensListe.begin(); itr != GardiensListe.end(); ++itr)
        {
            if ((*itr)->isAlive())
                (*itr)->AddObjectToRemoveList();
        }
        GetCreatureListWithEntryInGrid(GardiensListe, m_creature, NPC_HIVEZARA_SWARMER, 300.0f);
        for (std::list<Creature*>::iterator itr = GardiensListe.begin(); itr != GardiensListe.end(); ++itr)
        {
            if ((*itr)->isAlive())
                (*itr)->AddObjectToRemoveList();
        }
    }

    void Aggro(Unit* pWho)
    {
    }

    void SpellHitTarget(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_PARALYZE)
        {
            if (pCaster->GetTypeId() != TYPEID_PLAYER)
                return;

//                    DoTeleportPlayer(pCaster, -9717.2, 1517.81, 27.4683, pCaster->GetOrientation());

            m_uiSacrificeGuid = pCaster->GetObjectGuid();
            m_fSacrificeAggro = m_creature->getThreatManager().getThreat(pCaster);
            m_creature->getThreatManager().modifyThreatPercent(pCaster, -100);
            m_bPhaseTwoBeforeTeleport = m_bIsInPhaseTwo;
        }
    }

    void JustSummoned(Creature* pSummoned)
    {
        pSummoned->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!m_bRelocated && m_uiRelocate_Timer < uiDiff && !m_bIsInPhaseTwo)
        {
            m_creature->GetMotionMaster()->MovePoint(0,
                    m_creature->GetPositionX(),
                    m_creature->GetPositionY(),
                    m_creature->GetPositionZ() + 20.0f);

            m_creature->MonsterMove(m_creature->GetPositionX(),
                                    m_creature->GetPositionY(),
                                    m_creature->GetPositionZ() + 20.0f);

            m_bRelocated = true;
        }
        else
            m_uiRelocate_Timer -= uiDiff;

        if (!m_bIsInPhaseTwo && ((m_creature->GetHealth() * 100) / m_creature->GetMaxHealth()) < 70)
        {
            SetCombatMovement(true);
            m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
            m_creature->AttackerStateUpdate(m_creature->getVictim(), BASE_ATTACK, true);
            m_creature->addUnitState(UNIT_STAT_IGNORE_PATHFINDING); //pathfinding desactivation
            m_bIsInPhaseTwo = true;

            /** Aggro list reset */
            ThreatList const& tList = m_creature->getThreatManager().getThreatList();
            for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
            {
                Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());
                if (pUnit && (pUnit->GetTypeId() == TYPEID_PLAYER))
                    m_creature->getThreatManager().modifyThreatPercent(pUnit, -100);
            }
        }

        if (!m_bIsEnraged && ((m_creature->GetHealth() * 100) / m_creature->GetMaxHealth()) < 20)
        {
            DoCast(m_creature, SPELL_FRENZY);
            DoScriptText(EMOTE_FRENZY, m_creature);
            m_bIsEnraged = true;
        }

        if (m_uiSummonSwarmer_Timer < uiDiff)
        {
            for (uint8 i = 0; i < 20; ++i)
            {
                m_creature->SummonCreature(NPC_HIVEZARA_SWARMER,
                                           Swarmers[0].x + rand() % 10,
                                           Swarmers[0].y + rand() % 10,
                                           Swarmers[0].z + rand() % 10,
                                           0,
                                           TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,
                                           15000);
            }
            std::list<Creature*> SwarmerList;
            GetCreatureListWithEntryInGrid(SwarmerList, m_creature, NPC_HIVEZARA_SWARMER, 300.0f);
            for (std::list<Creature*>::iterator itr = SwarmerList.begin(); itr != SwarmerList.end(); ++itr)
                (*itr)->addUnitState(UNIT_STAT_IGNORE_PATHFINDING);

            m_uiSummonSwarmer_Timer = 60000;
        }
        else
            m_uiSummonSwarmer_Timer -= uiDiff;

        if (m_uiSummonPlayer_Timer < uiDiff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_PARALYZE) == CAST_OK)
                {
                    uint32 random = urand(0, 1);
                    if (Creature *m_larva = m_creature->SummonCreature(NPC_HIVEZARA_LARVA,
                        Larva[random].x, Larva[random].y, Larva[random].z, 0, TEMPSUMMON_TIMED_DESPAWN, 15000))
                    {
                        m_larva->SetFly(false);
                        m_larva->SetWalk(true);
                    }

                    m_uiSummonPlayer_Timer = 15000;
                    m_uiSacrifice_Timer = 10000;
                }
            }
        }
        else
            m_uiSummonPlayer_Timer -= uiDiff;

        if (m_uiSacrifice_Timer < uiDiff && m_uiSacrificeGuid)
        {
            if (!m_bPhaseTwoBeforeTeleport)
                if (Player* player = m_creature->GetMap()->GetPlayer(m_uiSacrificeGuid))
                    if (player->isAlive())
                        m_creature->getThreatManager().addThreatDirectly(player, m_fSacrificeAggro);
            m_uiSacrificeGuid.Clear();
            m_fSacrificeAggro = 0;
        }
        else
            m_uiSacrifice_Timer -= uiDiff;


        if (!m_bIsInPhaseTwo)
        {
            if (m_uiPoisonStinger_Timer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_POISONSTINGER) == CAST_OK)
                    m_uiPoisonStinger_Timer = 3000;
            }
            else
                m_uiPoisonStinger_Timer -= uiDiff;

            if (m_uiStingerSpray_Timer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_STINGERSPRAY) == CAST_OK)
                    m_uiStingerSpray_Timer = urand(10000, 15000);
            }
            else
                m_uiStingerSpray_Timer -= uiDiff;

        }
        else
        {
            if (m_uiStingerSpray_Timer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_STINGERSPRAY) == CAST_OK)
                    m_uiStingerSpray_Timer = urand(10000, 15000);
            }
            else
                m_uiStingerSpray_Timer -= uiDiff;

            if (m_uiLash_Timer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_LASH) == CAST_OK)
                    m_uiLash_Timer = 10000 + rand() % 10000;
            }
            else
                m_uiLash_Timer -= uiDiff;

            if (m_uiTrash_Timer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_TRASH) == CAST_OK)
                    m_uiTrash_Timer = 10000 + rand() % 10000;
            }
            else
                m_uiTrash_Timer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    }
};

struct mob_zara_larvaAI : public ScriptedAI
{
    mob_zara_larvaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 Active;
    uint8 m_waypoint;
    Unit * m_victim;

    void Reset()
    {
        m_victim = NULL;
        m_waypoint = 0;
        Active = 2000;
        SetCombatMovement(false);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (Active > uiDiff)
        {
            Active -= uiDiff;
            return;
        }
        Map::PlayerList const &liste = m_creature->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator i = liste.begin(); i != liste.end(); ++i)
        {

            if (i->getSource()->HasAura(SPELL_PARALYZE) &&
                    m_creature->GetPositionX() == LarvaMove[0].x &&
                    m_creature->GetPositionY() == LarvaMove[0].y &&
                    m_creature->GetPositionZ() == LarvaMove[0].z && m_waypoint == 1)
            {
                m_creature->MonsterMove(LarvaMove[1].x, LarvaMove[1].y, LarvaMove[1].z);
                ++m_waypoint;
            }
            else if (i->getSource()->HasAura(SPELL_PARALYZE) &&
                     m_creature->GetPositionX() == LarvaMove[1].x &&
                     m_creature->GetPositionY() == LarvaMove[1].y &&
                     m_creature->GetPositionZ() == LarvaMove[1].z && m_waypoint == 2)
            {
                m_creature->MonsterMove(LarvaMove[2].x, LarvaMove[2].y, LarvaMove[2].z);
                ++m_waypoint;
            }
            else if (i->getSource()->HasAura(SPELL_PARALYZE) &&
                     m_creature->GetPositionX() == LarvaMove[2].x &&
                     m_creature->GetPositionY() == LarvaMove[2].y &&
                     m_creature->GetPositionZ() == LarvaMove[2].z && m_waypoint == 3)
            {
                m_creature->MonsterMove(LarvaMove[3].x, LarvaMove[3].y, LarvaMove[3].z);
                ++m_waypoint;
            }
            else if (m_waypoint == 0)
            {
                m_creature->MonsterMove(LarvaMove[m_waypoint].x,
                                        LarvaMove[m_waypoint].y,
                                        LarvaMove[m_waypoint].z);
                ++m_waypoint;
                m_victim = i->getSource();
                m_creature->AI()->AttackStart(m_victim);
                m_creature->getThreatManager().addThreat(m_victim, 5000000000);
            }
            else if (m_victim)
            {
                if (i->getSource()->HasAura(SPELL_PARALYZE) &&
                        m_creature->GetPositionX() == LarvaMove[3].x &&
                        m_creature->GetPositionY() == LarvaMove[3].y &&
                        m_creature->GetPositionZ() == LarvaMove[3].z && m_waypoint == 4)
                {


                    // Spell which summon a Hornet from Hive'Zara
                    m_creature->CastSpell(m_victim, SPELL_FEED, true);

                }
            }
        }
    }
};


CreatureAI* GetAI_mob_zara_larva(Creature* pCreature)
{
    return new mob_zara_larvaAI(pCreature);
}

CreatureAI* GetAI_boss_ayamiss(Creature* pCreature)
{
    return new boss_ayamissAI(pCreature);
}

void AddSC_boss_ayamiss()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_ayamiss";
    newscript->GetAI = &GetAI_boss_ayamiss;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_zara_larva";
    newscript->GetAI = &GetAI_mob_zara_larva;
    newscript->RegisterSelf();
}
