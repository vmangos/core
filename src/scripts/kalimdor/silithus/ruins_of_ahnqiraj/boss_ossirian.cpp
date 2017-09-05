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
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111=    -1307  USA
 */

/* ScriptData
SDName: Boss_Ossirian
SD%Complete: 99
SDComment:
SDCategory: Ruins of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"
#include "ruins_of_ahnqiraj.h"

enum
{
    SAY_SURPREME1               =    -1509018,
    SAY_SURPREME2               =    -1509019,
    SAY_SURPREME3               =    -1509020,

    SAY_RAND_INTRO1             =    -1509021,
    SAY_RAND_INTRO2             =    -1509022,
    SAY_RAND_INTRO3             =    -1509023,
    SAY_RAND_INTRO4             =    -1509024, // possibly old?

    SAY_AGGRO                   =    -1509025,

    SAY_SLAY                    =    -1509026,
    SAY_DEATH                   =    -1509027,

    SPELL_CURSE_OF_TONGUES      =  25195,
    SPELL_STRENGTH_OF_OSSIRIAN  =  25176,
    SPELL_SUMMON_PLAYER         =  20477,
    SPELL_WAR_STOMP             =  25188,

    // Tornado
    NPC_TORNADO                 =  15428,
    SPELL_ENVELOPING_WINDS      =  25189,
    SPELL_SANDSTORM             =  25160
};

const uint32 SpellWeakness[] =
{
    25177, //Fire weakness
    25178, //Frost weakness
    25180, //Nature weakness
    25183, //Shadow weakness
    25181  //Arcane weakness
};


struct boss_ossirianAI : public ScriptedAI
{
    struct SpawnLocations
    {
        float x, y, z;
    };

    boss_ossirianAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiSpeed_Timer;
    uint32 m_uiCurseOfTongues_Timer;
    uint32 m_uiStrengthOfOssirian_Timer;
    uint32 m_uiWarStomp_Timer;
    uint32 m_uiEnvelopingWinds_Timer;

    std::vector<ObjectGuid> TmpThreatList;
    std::vector<float> TmpThreatVal;
    std::vector<uint64> TornadoGUIDs;

    std::list<ObjectGuid> crystalGuids;
    bool m_bIsEnraged;
    bool m_bAggro;

    void Reset()
    {
        m_bAggro = false;

        DoCast(m_creature, SPELL_STRENGTH_OF_OSSIRIAN);

        m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_02, 1000);     // Fire
        m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_03, 1000);     // Nature
        m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_05, 1000);     // Shadow
        m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_04, 1000);     // Frost
        m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_06, 1000);     // Arcane

        m_uiSpeed_Timer = 10000;
        m_creature->SetSpeedRate(MOVE_RUN,  1.0f, true);
        m_creature->SetSpeedRate(MOVE_WALK, 1.0f, true);

        m_uiCurseOfTongues_Timer     = 30000;
        m_uiStrengthOfOssirian_Timer = 25000;
        m_uiWarStomp_Timer           = 25000;
        m_uiEnvelopingWinds_Timer    = 20000;

        TmpThreatList.clear();
        TmpThreatVal.clear();

        m_bIsEnraged = true;

        if (!TornadoGUIDs.empty())
        {
            int i = -1;
            while (++i < TornadoGUIDs.size())
            {
                Creature *Crea = m_creature->GetMap()->GetCreature(TornadoGUIDs[i]);
                if (Crea)
                    Crea->AddObjectToRemoveList();
            }
        }

        TornadoGUIDs.clear();

        /** weather reseted to normal, seems like after aggro of Ossirian, weather needs to stay in sandstorm mode */
        uint32 zoneid = m_creature->GetZoneId();
        Weather* wth = sWorld.FindWeather(zoneid);
        if (wth)
            wth->SetWeather(WeatherType(0), 0);

        while (!crystalGuids.empty())
        {
            ObjectGuid guid = crystalGuids.front();
            crystalGuids.pop_front();
            if (GameObject* invoc = m_creature->GetMap()->GetGameObject(guid))
                invoc->AddObjectToRemoveList();
        }
        crystalGuids.clear();

        SpawnCrystal(0);
    }

    void SpellHitTarget(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_ENVELOPING_WINDS)
        {
            TmpThreatVal.push_back(m_creature->getThreatManager().getThreat(pCaster));
            TmpThreatList.push_back(pCaster->GetObjectGuid());
            m_creature->getThreatManager().modifyThreatPercent(pCaster, -100);
        }
    }

    void SpellHit(Unit* pUnit, const SpellEntry* pSpell)
    {
        for (int i = 0; i < sizeof(SpellWeakness)/sizeof(SpellWeakness[0]); ++i)
        {
            if (pSpell->Id == SpellWeakness[i])
            {
                m_uiStrengthOfOssirian_Timer = 45000;

                if(pSpell->Id == 25177) //Fire weakness
                    m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_02, 15);     // Fire
                else if (pSpell->Id == 25178) //Frost weakness
                    m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_04, 15);     // Frost
                else if (pSpell->Id == 25180) //Nature weakness
                    m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_03, 15);     // Nature
                else if (pSpell->Id == 25181) //Arcane weakness
                    m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_06, 15);     // Arcane
                else if (pSpell->Id == 25183)  //Shadow weakness
                    m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_05, 15);     // Shadow

                if (m_bIsEnraged)
                {
                    m_creature->RemoveAurasDueToSpell(SPELL_STRENGTH_OF_OSSIRIAN);
//                    m_creature->SetSpeedRate(MOVE_RUN, 2.0f, true);
                    m_bIsEnraged = false;
                }
            }
        }
    }

    void Aggro(Unit* pWho)
    {
        static SpawnLocations TornadoSpawn[] =
        {
            { -9444.0f, 1857.0f, 85.55f},
            { -9352.0f, 2012.0f, 85.55f}
        };

        DoScriptText(SAY_AGGRO, m_creature);
        m_creature->SetInCombatWithZone();
        DoCast(m_creature, SPELL_STRENGTH_OF_OSSIRIAN);
        for (uint8 i = 0; i < 2; ++i)
        {
            Creature *pCreature = m_creature->SummonCreature(NPC_TORNADO,
                                  TornadoSpawn[i].x,
                                  TornadoSpawn[i].y,
                                  TornadoSpawn[i].z,
                                  0,
                                  TEMPSUMMON_MANUAL_DESPAWN,
                                  0);
            if (pCreature)
            {
                pCreature->CastSpell(pCreature, SPELL_SANDSTORM, true);
                pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                pCreature->AI()->AttackStart(m_creature->getVictim());
                TornadoGUIDs.push_back(pCreature->GetGUID());
            }
        }

        if (!m_bAggro)
        {
            m_bAggro = true;
            m_uiSpeed_Timer = 10000;
            SpawnCrystal(urand(1, 10));
        }

        uint32 zoneid = m_creature->GetZoneId();
        if (Weather* wth = sWorld.FindWeather(zoneid))
            wth->SetWeather(WeatherType(3), 2);
    }

    void SpawnCrystal(uint32 pylonIdx)
    {
        static SpawnLocations CrystalSpawn[] =
        {
            { -9407.164062f, 1959.240845f, 85.558998f },
            { -9357.931641f, 1930.596802f, 85.556198f },
            { -9383.113281f, 2011.042725f, 85.556389f },
            { -9243.36f, 1979.04f, 85.556f },
            { -9281.68f, 1886.66f, 85.5558f },
            { -9241.8f, 1806.39f, 85.5557f },
            { -9366.78f, 1781.76f, 85.5561f },
            { -9297.668945f, 1747.256348f, 85.5566f },
            { -9430.37f, 1786.86f, 85.557f },
            { -9187.087891f, 1940.501099f, 85.5564f },
            { -9406.73f, 1863.13f, 85.5558f }
        };

        GameObject* pCrystal = m_creature->SummonGameObject(GO_OSSIRIAN_CRYSTAL,
                               CrystalSpawn[pylonIdx].x,
                               CrystalSpawn[pylonIdx].y,
                               CrystalSpawn[pylonIdx].z,
                               0, 0, 0, 0, 0, -1, false);

        if (!pCrystal)
        {
            sLog.outError("[OSSIRIAN] Unable to spawn crystal %u at position #%u", GO_OSSIRIAN_CRYSTAL, pylonIdx);
            return;
        }

        crystalGuids.push_back(pCrystal->GetObjectGuid());
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, m_creature);
        if (!TornadoGUIDs.empty())
        {
            int i = -1;
            while (++i < TornadoGUIDs.size())
            {
                Creature *Crea = m_creature->GetMap()->GetCreature(TornadoGUIDs[i]);
                if (Crea)
                    Crea->ForcedDespawn();
            }
        }
    }

    void KilledUnit(Unit* pVictim)
    {
        if (pVictim->GetTypeId() == TYPEID_PLAYER)
            DoScriptText(SAY_SLAY, m_creature);
    }

    void DoAction(const uint32 action)
    {
        if (action == 0xBEEF)
            SpawnCrystal(urand(1, 10));
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiCurseOfTongues_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CURSE_OF_TONGUES) == CAST_OK)
                m_uiCurseOfTongues_Timer = 10000 + rand() % 10000;
        }
        else
            m_uiCurseOfTongues_Timer -= uiDiff;

        if (m_uiSpeed_Timer < uiDiff)
        {
        }
        else
        {
            m_uiSpeed_Timer -= uiDiff;
            m_creature->SetSpeedRate(MOVE_RUN, (2.0f - m_uiSpeed_Timer*1.0f/10000), true);
        }

        if (!m_bIsEnraged && m_uiStrengthOfOssirian_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_STRENGTH_OF_OSSIRIAN) == CAST_OK)
            {
                m_bIsEnraged = true;
                m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_02, 1000);     // Fire
                m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_03, 1000);     // Nature
                m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_05, 1000);     // Shadow
                m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_04, 1000);     // Frost
                m_creature->SetUInt32Value(UNIT_FIELD_RESISTANCES_06, 1000);     // Arcane
            }
        }
        else
            m_uiStrengthOfOssirian_Timer -= uiDiff;

        if (m_uiWarStomp_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_WAR_STOMP) == CAST_OK)
                m_uiWarStomp_Timer = 25000 + (rand() % 10000);
        }
        else
            m_uiWarStomp_Timer -= uiDiff;

        if (m_uiEnvelopingWinds_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_ENVELOPING_WINDS) == CAST_OK)
                m_uiEnvelopingWinds_Timer = 15000;
        }
        else
            m_uiEnvelopingWinds_Timer -= uiDiff;

        if (!TmpThreatList.empty())
        {
            int i = -1;
            while (++i < TmpThreatList.size())
            {
                if (Unit* unit = m_creature->GetMap()->GetUnit(TmpThreatList[i]))
                {
                    if (unit->isAlive())
                    {
                        if (unit->HasAura(SPELL_ENVELOPING_WINDS))
                            continue;
                        m_creature->getThreatManager().addThreat(unit, TmpThreatVal[i]);
                    }
                }
                TmpThreatList.erase(TmpThreatList.begin() + i);
                TmpThreatVal.erase(TmpThreatVal.begin() + i);
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_ossirian(Creature* pCreature)
{
    return new boss_ossirianAI(pCreature);
}

struct generic_random_moveAI : public ScriptedAI
{
    generic_random_moveAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiTimer;

    void Reset()
    {
        m_uiTimer = 5000;
        SetCombatMovement(false);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiTimer < uiDiff)
        {
            if (!urand(0, 2))
            {
                std::vector<Player*> PlayerList;
                Map::PlayerList const &liste = m_creature->GetMap()->GetPlayers();
                for (Map::PlayerList::const_iterator i = liste.begin(); i != liste.end(); ++i)
                {
                    if (i->getSource()->GetDistance2d(m_creature) < MAX_VISIBILITY_DISTANCE)
                        PlayerList.push_back(i->getSource());
                }
                if (PlayerList.size())
                {
                    Player *tmp = PlayerList[urand(0, PlayerList.size() - 1)];
                    m_creature->MonsterMove(tmp->GetPositionX(), tmp->GetPositionY(), tmp->GetPositionZ());
                    m_uiTimer = (urand(5000, 20000));
                }
            }
            else if (urand(0, 3))
            {
                float rx;
                float ry;
                float rz;
                m_creature->GetRandomPoint(m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 50.0f, rx, ry, rz);
                m_creature->MonsterMove(rx, ry, rz);
                m_uiTimer = (urand(3000, 10000));
            }
            m_uiTimer = 2000;
        }
        else
            m_uiTimer -= uiDiff;
    }
};

struct ossirian_crystalAI : public GameObjectAI
{
    ossirian_crystalAI(GameObject* pGo) : GameObjectAI(pGo) {}

    bool OnUse(Unit* user)
    {
        ScriptedInstance* m_pInstance = (ScriptedInstance*)me->GetInstanceData();

        if (!m_pInstance)
        {
            sLog.outInfo("[OSSIRIAN/Crystal][Inst %03u] ERROR: No instance", user->GetInstanceId());
            return false;
        }

        Creature* ossirian = me->GetMap()->GetCreature(m_pInstance->GetData64(DATA_OSSIRIAN));

        if (!ossirian)
        {
            sLog.outInfo("[OSSIRIAN/Crystal][Inst %03u] ERROR: No Ossirian found (guid %u)", user->GetInstanceId(), m_pInstance->GetData64(DATA_OSSIRIAN));
            return false;
        }

        if (!ossirian->SelectHostileTarget() || !ossirian->getVictim())
        {
            sLog.outInfo("[OSSIRIAN/Crystal][Inst %03u] ERROR: Ossirian not in combat", user->GetInstanceId(), m_pInstance->GetData64(DATA_OSSIRIAN));
            return true;
        }

        if (me->FindNearCreature(CRYSTAL_TRIGGER, 10.0f))
        {
            sLog.outInfo("[OSSIRIAN/Crystal][Inst %03u] ERROR: Crystal already activated. Race condition attempt.", user->GetInstanceId());
            return true;
        }

        Creature* triggerCrystalPylons = me->SummonCreature(CRYSTAL_TRIGGER,
                                         me->GetPositionX(),
                                         me->GetPositionY(),
                                         me->GetPositionZ(),
                                         me->GetOrientation(),
                                         TEMPSUMMON_TIMED_DESPAWN,
                                        8000);

        if (triggerCrystalPylons)
        {
            triggerCrystalPylons->CastSpell(ossirian, SpellWeakness[urand(0, 4)], true);
            ossirian->AI()->DoAction(0xBEEF);
        }
        return false;
    }
};


GameObjectAI* GetAI_ossirian_crystal(GameObject* pGo)
{
    return new ossirian_crystalAI(pGo);
}


CreatureAI* GetAI_generic_random_move(Creature* pCreature)
{
    return new generic_random_moveAI(pCreature);
}

void AddSC_boss_ossirian()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_ossirian";
    newscript->GetAI = &GetAI_boss_ossirian;
    newscript->RegisterSelf();
    /*
    newscript = new Script;
    newscript->Name = "generic_random_move";
    newscript->GetAI = &GetAI_generic_random_move;
    newscript->RegisterSelf();
    */
    newscript = new Script;
    newscript->Name = "ossirian_crystal";
    newscript->GOGetAI = &GetAI_ossirian_crystal;
    newscript->RegisterSelf();
}
