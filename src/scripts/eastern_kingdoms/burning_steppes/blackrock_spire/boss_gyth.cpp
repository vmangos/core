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
SDName: Boss_Gyth
SD%Complete: 100
SDComment: Whole Event needs some rewrite
SDCategory: Blackrock Spire
EndScriptData */

#include "scriptPCH.h"
#include "blackrock_spire.h"
// INSERT INTO  nostalrius_string(entry, content_default, content_loc2) VALUES
// (156,"Foolsss... Kill the one in the dress!","Imbeciles ... Tuez celui qui porte une robe !"),
// (157,"Concentrate your attacks upon the healer!","Concentrez vos attaques sur le Guerisseur !"),
// (158,"Inconceivable!","Inconcevable !");
// INSERT INTO  nostalrius_string(entry, content_default) VALUES
// (159,"Do not force my hand, children! I shall use your hides to line my boots.");
// INSERT INTO  nostalrius_string(entry, content_default, content_loc2) VALUES
// (160,"Defilers!","Profanateurs !"),
// (161,"Impossible!","Impossible ..."),
// (162,"Your efforts will prove fruitless. None shall stand in our way!","Vos efforts seront vains. Personne ne nous arretera."),
// (163,"THIS CANNOT BE!!! Rend, deal with these insects.","CELA NE PEUT PAS ETRE !!! Rend, occupe toi de ces insectes."),
// (164,"With pleasure...","Avec plaisir, Sire."),
// (165,"Your victory shall be short lived. The days of both the Alliance and Horde are coming to an end. The next time we meet shall be the last.","Votre victoire sera de courte duree. Les jours de l'Alliance et la Horde sont comptes : la prochaine fois que nous rencontrons sera la derniere."),
// (166,"The Warchief shall make quick work of you, mortals. Prepare yourselves!","Le Chef de Guerre ne devrait faire qu'une bouchee de vous. Preparez vous !"),
// (167,"Let not even a drop of their blood remain upon the arena floor, my children. Feast on their souls!","Ne laissez pas meme une goutte de leur sang sur le sol de l'arene, mes enfants. Régalez vous de leur ame !"),
// (168,"Sire, let me join the fray! I shall tear their spines out with my bare hands!!","Sire, permettez moi de rejoindre le combat. Je dechirerai leurs épines de mes propres mains !"),
// (169,"Excellent... it would appear as if the meddlesome insects have arrived just in time to feed my legion. Welcome, mortals!","Excellent ... Il semblerait que ces insectes fouineurs soient arrives juste a temps pour nourir ma Legion. Bienvenu, mortels !");

enum
{
    SPELL_CORROSIVEACID     = 20667,
    SPELL_FREEZE            = 16350,                        // ID was wrong!
    SPELL_FLAMEBREATH       = 20712,
    SPELL_KNOCKAWAY         = 10101,
    SPELL_CHROMATICCHAOS    = 16337,
// Spell BC !!
//    SPELL_ROOT_SELF         = 33356,

    MODEL_ID_INVISIBLE      = 11686,
    MODEL_ID_GYTH_MOUNTED   = 9723,
    MODEL_ID_GYTH           = 9806,

    NPC_FIRE_TONGUE         = 10372,
    NPC_CHROMATIC_WHELP     = 10442,
    NPC_CHROMATIC_DRAGON    = 10447,
    NPC_BLACKHAND_ELITE     = 10317,
    NPC_REND_BLACKHAND      = 10429
};

// NOSTALRIUS
//#define DEBUG_ON
enum
{
#ifdef DEBUG_ON
    WAVE_TIMER = 10000,
#else
    WAVE_TIMER = 60000,
#endif
    NEFARIAN_ENTRY            = 10162,
};
#define SPAWN_X  210.0f
#define SPAWN_Y -420.0f
#define SPAWN_Z 110.94f
#define SPAWN_O 3.14f

struct boss_gythAI : public ScriptedAI
{
    boss_gythAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_blackrock_spire*) pCreature->GetInstanceData();
        nefarianGUID  = 0;
        m_bInitialized = false;
        Reset();
    }

    instance_blackrock_spire* m_pInstance;
    uint64 m_uiCombatDoorGUID;
    uint32 uiAggroTimer;
    uint32 uiDragonsTimer;
    uint32 uiOrcTimer;
    uint32 uiCorrosiveAcidTimer;
    uint32 uiFreezeTimer;
    uint32 uiFlamebreathTimer;
    uint32 uiKnockAwayTimer;
    uint32 uiLine1Count;
    uint32 uiLine2Count;

    bool m_bSummonedRend;
    bool m_bAggro;
    bool m_bRootSelf;

    // NOSTALRIUS
    uint64 nefarianGUID;
    uint32 mobCount;
    uint32 uiWaveNum;
    uint32 waveRemainingCount;
    bool m_bInitialized;
    std::list<uint64> m_lSummonedGuids;
    bool bChromaticChaosCasted;

    void Reset()
    {
        uiDragonsTimer = 3000;
        uiOrcTimer = WAVE_TIMER;
        uiAggroTimer = WAVE_TIMER;
        uiCorrosiveAcidTimer = 8000;
        uiFreezeTimer = 11000;
        uiFlamebreathTimer = 4000;
        uiKnockAwayTimer = urand(5000, 10000);
        m_bSummonedRend = false;
        m_bAggro = false;
        m_bRootSelf = false;
        bChromaticChaosCasted = false;

        // how many times should the two lines of summoned creatures be spawned
        // min 2 x 2, max 7 lines of attack in total
#ifdef DEBUG_ON
        uiLine1Count = urand(2, 5);
        uiLine2Count = urand(2, 7 - uiLine1Count);
#else
        uiLine1Count = urand(2, 5);
        uiLine2Count = urand(2, 7 - uiLine1Count);
#endif

        // Invisible for event start
#ifndef DEBUG_ON
        m_creature->SetDisplayId(MODEL_ID_INVISIBLE);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
#endif

        // NOSTALRIUS
        uiWaveNum    = 0;
        waveRemainingCount = 0;
        DespawnAdds();
#ifdef DEBUG_ON
        sLog.outString("Boss GYTH RESET");
#endif
    }

    // NOSTALRIUS
    void Initialize()
    {
        Creature* nefarian = GetClosestCreatureWithEntry(m_creature, NEFARIAN_ENTRY,  150.0f);
        if (nefarian)
            nefarianGUID = nefarian->GetGUID();
        else
            nefarianGUID = 0;
#ifdef DEBUG_ON
        sLog.outString("Nefarian trouve : %u", nefarianGUID);
#endif
    }

    void NefarianSay(int32 what)
    {
        if (Unit* nefarian = Unit::GetUnit(*m_creature, nefarianGUID))
            nefarian->MonsterSay(what, LANG_UNIVERSAL, 0);
        else
            sLog.outString("Nefarian introuvable.");
#ifdef DEBUG_ON
        sLog.outString("[Nefarian] : %s", what);
#endif
    }
    void RendSay(int32 what)
    {
        m_creature->MonsterSay(what, LANG_UNIVERSAL, 0);
#ifdef DEBUG_ON
        sLog.outString("[Rend]     : %s", what);
#endif
    }
    void SummonedCreatureJustDied(Creature* summ)
    {
        // Rend - invoque par Gyth - peut mourir apres Gyth.
        if (m_creature->isAlive())
            m_creature->SetInCombatWithZone();

        // Ne doit pas etre negatif
        if (waveRemainingCount > 0)
            --waveRemainingCount;

        if (uiWaveNum == 1 && waveRemainingCount == 2)
            NefarianSay(5665);
        else if (uiWaveNum == 3 && waveRemainingCount == 3)
            NefarianSay(5671);
        else if (uiWaveNum == 3 && waveRemainingCount == 2)
            NefarianSay(5666);
        else if (uiWaveNum == 3 && waveRemainingCount == 1)
            NefarianSay(5667);
        else if (uiWaveNum == 4 && waveRemainingCount == 2)
            RendSay(5678);
        else if (uiWaveNum == 4 && waveRemainingCount == 1)
            RendSay(5673);
        else if (uiWaveNum == 5 && waveRemainingCount == 1)
            NefarianSay(5668);
        else if (uiWaveNum == 6 && waveRemainingCount == 2)
            NefarianSay(5709);
        else if (uiWaveNum == 6 && waveRemainingCount == 1)
            RendSay(5722);
        else if (summ && summ->GetEntry() == NPC_REND_BLACKHAND)
            NefarianSay(5824);
#ifdef DEBUG_ON
        sLog.outString("Creature %u morte. Vague %u / reste %u", summ->GetEntry(), uiWaveNum, waveRemainingCount);
#endif
        //summ->AddObjectToRemoveList();
    }

    void DespawnAdds()
    {
#ifdef DEBUG_ON
        sLog.outString("Despawn %u Adds", m_lSummonedGuids.size());
#endif
        while (!m_lSummonedGuids.empty())
        {
            uint64 guid = m_lSummonedGuids.front();
            m_lSummonedGuids.pop_front();
            if (Unit* invoc = Unit::GetUnit(*m_creature, guid))
            {
                invoc->AddObjectToRemoveList();
#ifdef DEBUG_ON
                sLog.outString("Despawn de %u (entry %u)", invoc->GetGUIDLow(), invoc->GetEntry());
#endif
            }
        }
    }

    // NOSTALRIUS END
    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_GYTH, IN_PROGRESS);
            m_uiCombatDoorGUID = m_pInstance->GetData64(GO_GYTH_COMBAT_DOOR);
        }
    }
    void AttackStart(Unit *target)
    {
        // $target commence a nous attaquer.
        if (!m_bAggro)
        {
            m_creature->Attack(target, false);
            m_creature->AddThreat(target);
            m_creature->SetInCombatWith(target);
            target->SetInCombatWith(m_creature);
        }
        // Sinon, go attaquer.
        else if (m_creature->Attack(target, true))
        {
            m_creature->AddThreat(target);
            m_creature->SetInCombatWith(target);
            target->SetInCombatWith(m_creature);

            m_creature->GetMotionMaster()->MoveChase(target);
        }
    }

    void JustDied(Unit* pKiller)
    {
#ifdef DEBUG_ON
        sLog.outString("Boss GYTH JustDied");
#endif
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GYTH, DONE);
    }

    void EnterEvadeMode()
    {
#ifdef DEBUG_ON
        sLog.outString("Boss GYTH EnterEvadeMode");
#endif
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GYTH, FAIL);
        DespawnAdds();

        if (m_creature->isAlive())
        {
            m_creature->SetDeathState(JUST_DIED);
            m_creature->Respawn();
        }
        Reset();
    }
    void JustReachedHome()
    {
#ifdef DEBUG_ON
        sLog.outString("Boss GYTH JustReachedHome");
#endif
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GYTH, FAIL);
        DespawnAdds();

        if (m_creature->isAlive())
        {
            m_creature->SetDeathState(JUST_DIED);
            m_creature->Respawn();
        }
        Reset();
    }

    void SummonCreatureWithRandomTarget(uint32 uiCreatureId)
    {
        float fX, fY, fZ;
        m_creature->GetRandomPoint(m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 2 * INTERACTION_DISTANCE, fX, fY, fZ);
        fX = std::min(m_creature->GetPositionX(), fX);      // Halfcircle - suits better the rectangular form
        if (Creature* pSummoned = m_creature->SummonCreature(uiCreatureId, SPAWN_X + irand(-10, 10), SPAWN_Y + irand(-10, 10), SPAWN_Z, SPAWN_O, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 240000))
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                pSummoned->AI()->AttackStart(pTarget);
            m_lSummonedGuids.push_back(pSummoned->GetGUID());
        }
        ++waveRemainingCount;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_bInitialized)
        {
            Initialize();
            m_bInitialized = true;
        }
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!m_bRootSelf)
        {
            //DoCastSpellIfCan(m_creature, SPELL_ROOT_SELF);
            m_creature->addUnitState(UNIT_STAT_ROOT);
            m_bRootSelf = true;
        }

        bool bWaveSummoned = false;
        if (!m_bAggro && uiLine1Count == 0 && uiLine2Count == 0)
        {
            if (uiAggroTimer < uiDiff)
            {
                m_bAggro = true;
                NefarianSay(5720);
                // Visible now!
                //m_creature->Relocate(SPAWN_X, SPAWN_Y, SPAWN_Z, SPAWN_O);
                m_creature->GetMap()->CreatureRelocation(m_creature, SPAWN_X, SPAWN_Y, SPAWN_Z, SPAWN_O);
                //m_creature->GetMotionMaster()->Initialize();

                m_creature->SetDisplayId(MODEL_ID_GYTH_MOUNTED);
                m_creature->setFaction(14);
                m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                //m_creature->RemoveAurasDueToSpell(SPELL_ROOT_SELF);
                m_creature->clearUnitState(UNIT_STAT_ROOT);

                DoResetThreat();
                
                if (m_pInstance)
                    m_pInstance->DoUseDoorOrButton(m_uiCombatDoorGUID);
            }
            else
                uiAggroTimer -= uiDiff;
        }

        // Summon Dragon pack. 2 Dragons and 3 Whelps
        if (!m_bAggro && !m_bSummonedRend && uiLine1Count > 0)
        {
            if (uiDragonsTimer < uiDiff)
            {
                waveRemainingCount = 0;
                SummonCreatureWithRandomTarget(NPC_FIRE_TONGUE);
                SummonCreatureWithRandomTarget(NPC_FIRE_TONGUE);
                SummonCreatureWithRandomTarget(NPC_CHROMATIC_WHELP);
                SummonCreatureWithRandomTarget(NPC_CHROMATIC_WHELP);
                SummonCreatureWithRandomTarget(NPC_CHROMATIC_WHELP);
                --uiLine1Count;
                if (m_pInstance)
                    m_pInstance->DoUseDoorOrButton(m_uiCombatDoorGUID);
                uiDragonsTimer = WAVE_TIMER;
                bWaveSummoned = true;
            }
            else
                uiDragonsTimer -= uiDiff;
        }

        //Summon Orc pack. 1 Orc Handler 1 Elite Dragonkin and 3 Whelps
        if (!m_bAggro && !m_bSummonedRend && uiLine1Count == 0 && uiLine2Count > 0)
        {
            if (uiOrcTimer < uiDiff)
            {
                waveRemainingCount = 0;
                SummonCreatureWithRandomTarget(NPC_CHROMATIC_DRAGON);
                SummonCreatureWithRandomTarget(NPC_BLACKHAND_ELITE);
                SummonCreatureWithRandomTarget(NPC_CHROMATIC_WHELP);
                SummonCreatureWithRandomTarget(NPC_CHROMATIC_WHELP);
                SummonCreatureWithRandomTarget(NPC_CHROMATIC_WHELP);
                if (m_pInstance)
                    m_pInstance->DoUseDoorOrButton(m_uiCombatDoorGUID);
                --uiLine2Count;
                uiOrcTimer = WAVE_TIMER;
                bWaveSummoned = true;
            }
            else
                uiOrcTimer -= uiDiff;
        }
        if (bWaveSummoned)
        {
            ++uiWaveNum;
            if (uiWaveNum == 1)
                NefarianSay(5640);
            else if (uiWaveNum == 3)
                RendSay(5672);
        }

        // we take part in the fight
        if (m_bAggro)
        {
            // CorrosiveAcid_Timer
            if (uiCorrosiveAcidTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_CORROSIVEACID) == CAST_OK)
                    uiCorrosiveAcidTimer = 7000;
            }
            else
                uiCorrosiveAcidTimer -= uiDiff;

            // Freeze_Timer
            if (uiFreezeTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_FREEZE) == CAST_OK)
                    uiFreezeTimer = 16000;
            }
            else
                uiFreezeTimer -= uiDiff;

            // Flamebreath_Timer
            if (uiFlamebreathTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_FLAMEBREATH) == CAST_OK)
                    uiFlamebreathTimer = 10500;
            }
            else
                uiFlamebreathTimer -= uiDiff;

            if (uiKnockAwayTimer < uiDiff)
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                {
                    if (pTarget->GetDistance(m_creature) < 10.0f)
                    {
                        if (DoCastSpellIfCan(pTarget, SPELL_KNOCKAWAY) == CAST_OK)
                            uiKnockAwayTimer = urand(8000, 12000);
                    }
                }
            }
            else
                uiKnockAwayTimer -= uiDiff;

            if (!bChromaticChaosCasted && m_creature->GetHealthPercent() < 50.0f)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_CHROMATICCHAOS) == CAST_OK)
                    bChromaticChaosCasted = true;
            }
            //Summon Rend
            if (!m_bSummonedRend && m_creature->GetHealthPercent() < 20.0f)
            {
                // summon Rend and Change model to normal Gyth
                // Inturrupt any spell casting
                m_creature->InterruptNonMeleeSpells(false);
                // Gyth model
                m_creature->SetDisplayId(MODEL_ID_GYTH);
                m_creature->SummonCreature(NPC_REND_BLACKHAND, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 900000);
                m_bSummonedRend = true;
            }

            DoMeleeAttackIfReady();
        }                                                   // end if Aggro
    }
};

CreatureAI* GetAI_boss_gyth(Creature* pCreature)
{
    return new boss_gythAI(pCreature);
}

void AddSC_boss_gyth()
{
    Script* pNewScript;
    pNewScript = new Script;
    pNewScript->Name = "boss_gyth";
    pNewScript->GetAI = &GetAI_boss_gyth;
    pNewScript->RegisterSelf();
}
