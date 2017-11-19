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
SDName: Boss_Buru
SD%Complete: 100%
SDComment: Ras, en attente de tests.
SDCategory: Ruins of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"
#include "ruins_of_ahnqiraj.h"

enum
{
    EMOTE_TARGET                =   -1509002,

    SPELL_CREEPING_PLAGUE       =   20512,
    SPELL_DISMEMBER             =   96,
    SPELL_GAIN_SPEED            =   1834,
    SPELL_FULL_SPEED            =   1557,
    SPELL_THORNS                =   25640,
    SPELL_BURU_TRANSFORM        =   24721,
    SPELL_SELF_FREEZE            =   29826,

    NPC_BURU_EGG                =   15514,
    SPELL_SUMMON_HATCHLING      =   1881,
    SPELL_EXPLODE               =   19593,
    NPC_BURU_EGG_TRIGGER        =   15964,

    NPC_HIVEZARA_HATCHLING      =   15521,

    MODEL_INVISIBLE             =   11686
};

const float THREAT_LOCK = FLT_MAX;

struct SpawnLocations
{
    float x, y, z;
};

static SpawnLocations AddPop[] =
{
    { -9312.0f, 1281.0f, -62.0f },
    { -9268.0f, 1249.0f, -62.0f },
    { -9263.0f, 1292.0f, -63.0f }
};

static SpawnLocations Eggs[] =
{
    { -9312.73f, 1281.51f, -63.56f },
    { -9300.03f, 1304.52f, -63.25f },
    { -9263.38f, 1293.48f, -63.84f },
    { -9245.11f, 1280.30f, -63.33f },
    { -9234.96f, 1244.95f, -63.05f },
    { -9267.78f, 1249.26f, -63.58f }
};

struct boss_buruAI : public ScriptedAI
{
    boss_buruAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    bool m_bIsEnraged;
    bool m_HatchPop;

    uint32 m_uiDismember_Timer;
    uint32 m_uiSpeed_Timer;
    uint32 m_uiCreepingPlague_Timer;
    uint32 m_uiTransform_Timer;
    uint32 m_uiRespawnEgg_Timer[6];

    uint64 m_eggsGUID[6];

    void Reset()
    {
        m_creature->SetDisplayId(15654);
        m_creature->RemoveAllAuras();
        m_creature->UpdateSpeed(MOVE_RUN, true, 0.5f);
        m_bIsEnraged = false;
        m_HatchPop = false;
        m_uiDismember_Timer = 1000;
        m_uiSpeed_Timer = 30000;
        m_uiCreepingPlague_Timer = 6000;

        for (int i = 0; i < 6; i++)
            m_uiRespawnEgg_Timer[i] = 120000;

        Creature* egg;
        for (int i = 0; i < 6; i++)
        {
            egg = m_pInstance->GetCreature(m_eggsGUID[i]);
            if (egg != NULL)
                egg->AddObjectToRemoveList();
            if (Creature* egg = m_creature->SummonCreature(NPC_BURU_EGG, Eggs[i].x, Eggs[i].y, Eggs[i].z, 0))
                m_eggsGUID[i] = egg->GetGUID();
        }
    }

    void Aggro(Unit *pWho)
    {
        m_creature->SetInCombatWithZone();
        DoCast(m_creature, SPELL_THORNS);
        m_creature->SetArmor(20000);
    }

    void JustDied(Unit* pKiller)
    {
        // Le debuff fade quand il est mort, sinon le raid se fait decimer
        Map::PlayerList const &liste = m_creature->GetMap()->GetPlayers();
        for (Map::PlayerList::const_iterator i = liste.begin(); i != liste.end(); ++i)
            i->getSource()->RemoveAurasDueToSpell(SPELL_CREEPING_PLAGUE);
    }

    void UpdateAI(const uint32 uiDiff)
    {

        Creature* egg;
        for (int i = 0; i < 6 && !m_bIsEnraged; i++)
        {
            egg = m_pInstance->GetCreature(m_eggsGUID[i]);
            if (egg == NULL)
            {
                if (Creature* egg = m_creature->SummonCreature(NPC_BURU_EGG, Eggs[i].x, Eggs[i].y, Eggs[i].z, 0))
                    m_eggsGUID[i] = egg->GetGUID();
            }
            else if (!egg->isAlive())
            {
                if (m_uiRespawnEgg_Timer[i] < uiDiff)
                {
                    m_uiRespawnEgg_Timer[i] = 120000;
                    egg->Respawn();
                }
                else
                    m_uiRespawnEgg_Timer[i] -= uiDiff;

            }
        }

        // Transition de phase. Tout ca pour avoir un joli visuel :)
        if (m_bIsEnraged && m_creature->HasAura(SPELL_SELF_FREEZE))
        {
            if (!m_uiTransform_Timer)
                return;

            if (m_uiTransform_Timer <= uiDiff)
            {
                m_creature->RemoveAllAuras(); // Delete Thorns ability during Phase 2
                m_creature->AddAura(SPELL_BURU_TRANSFORM);
                m_uiTransform_Timer = 0;
                m_creature->SetInCombatWithZone(); // Arrive qu'il revienne a sa place si on ne le tape pas sans ca
            }
            else
                m_uiTransform_Timer -= uiDiff;
            return;
        }
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Si il n'est pas enrage et qu'il n'a plus de threat list, il choisi une personne a focus au hasard
        if (!m_bIsEnraged)
        {
            if (m_creature->GetHealthPercent() < 20)
            {
                m_bIsEnraged = true;

                // Freeze
                if (SpellAuraHolder* aura = m_creature->AddAura(SPELL_SELF_FREEZE))
                {
                    // m_uiTransform_Timer + temps du visuel cote client. Le visuel se casse en cas de mvt.
                    aura->SetAuraMaxDuration(5600);
                    aura->SetAuraDuration(5600);
                    aura->SetPassive(false);
                    aura->SetPermanent(false);
                }
                // Le sort de transformation ne doit pas etre lance tout de suite si on veut avoir le visuel.
                m_uiTransform_Timer = 200;

                // Suppression de son armure, enrage, reset de la liste d'aggro et vitesse remise à la normal
                m_creature->SetArmor(0);
                m_creature->DeleteThreatList();
                m_creature->RemoveAurasDueToSpell(SPELL_GAIN_SPEED);
                m_creature->UpdateSpeed(MOVE_RUN, true, 1.0f);

                if (m_creature->getVictim())
                    m_creature->SetFacingToObject(m_creature->getVictim());

                // Despawn des oeufs lors de l'enrage
                for (int i = 0 ; i < 6 ; i++)
                {
                    if (m_eggsGUID[i])
                    {
                        if (Creature* egg = m_pInstance->GetCreature(m_eggsGUID[i]))
                            egg->AddObjectToRemoveList();

                        m_eggsGUID[i] = 0;
                    }
                }
            }
            else if (m_creature->getThreatManager().getThreat(m_creature->getVictim()) < (THREAT_LOCK / 1000))
            {
                uint64 GUIDs[40];
                for (int i = 0; i < 40; i++)
                    GUIDs[i] = 0;

                int var = 0;
                ThreatList const& tList = m_creature->getThreatManager().getThreatList();
                for (ThreatList::const_iterator itr = tList.begin(); itr != tList.end(); ++itr)
                {
                    Player* pPlayer = m_creature->GetMap()->GetPlayer((*itr)->getUnitGuid());
                    if (pPlayer && pPlayer->isAlive())
                    {
                        GUIDs[var] = (*itr)->getUnitGuid();
                        ++var;
                    }
                }

                if (var)
                {

                    if (Player* pTarget = m_creature->GetMap()->GetPlayer(GUIDs[urand(0, var - 1)]))
                    {
                        DoScriptText(EMOTE_TARGET, m_creature, pTarget);

                        // Pour verouiller la cible, on applique une menace tres elevee
                        m_creature->getThreatManager().addThreat(pTarget, THREAT_LOCK);

                        m_creature->RemoveAurasDueToSpell(SPELL_GAIN_SPEED);
                        m_creature->UpdateSpeed(MOVE_RUN, true, 0.5f);
                        m_uiSpeed_Timer = 30000;
                    }
                }
            }
        }

        // Dismember - A stacking bleed effect that does 1248 damage every 2 second. Buru will use this if he catches up to whoever he is targeting.
        if (m_uiDismember_Timer < uiDiff && !m_bIsEnraged)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_DISMEMBER) == CAST_OK)
                m_uiDismember_Timer = 6000;
        }
        else
            m_uiDismember_Timer -= uiDiff;

        // Creeping plague
        if (m_bIsEnraged)
        {
            if (m_uiCreepingPlague_Timer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_CREEPING_PLAGUE) == CAST_OK)
                    m_uiCreepingPlague_Timer = 6000;
            }
            else
                m_uiCreepingPlague_Timer -= uiDiff;

            // Pop des add lors de l'enrage (3, mais je ne suis pas sur de ce nombre et ne sait pas s'ils arrivent tous d'un coup)
            if (!m_HatchPop)
            {
                for (int i = 0; i < 3; i++)
                {
                    if (Creature* summoned = m_creature->SummonCreature(NPC_HIVEZARA_HATCHLING, AddPop[i].x, AddPop[i].y, AddPop[i].z, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                        summoned->SetInCombatWithZone();
                }
                m_HatchPop = true;
            }
        }

        // Gain speed
        if (m_uiSpeed_Timer < uiDiff)
        {
            m_creature->CastSpell(m_creature, SPELL_GAIN_SPEED, true);
            m_uiSpeed_Timer = 30000;
        }
        else
            m_uiSpeed_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};


struct mob_buru_eggAI : public ScriptedAI
{
    mob_buru_eggAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    Creature* pBuru;

    void Reset()
    {
        // Empêche les oeufs d'aggro et de tourner
        SetCombatMovement(false);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
    {
        // Aggro de Buru quand on tape un oeuf
        if (Creature* pBuru = m_pInstance->GetCreature(m_pInstance->GetData64(DATA_BURU)))
        {
            if (!pBuru->isInCombat())
                pBuru->SetInCombatWithZone();
        }
    }

    void JustDied(Unit* pKiller)
    {
        if (!m_pInstance)
            return;

        // Explose et fait pop une creature quand il meurs
        m_creature->CastSpell(m_creature, SPELL_EXPLODE, false);

        if (Creature* add = m_creature->SummonCreature(NPC_HIVEZARA_HATCHLING, m_creature->GetPositionX(), m_creature->GetPositionY(),
            m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
        {
            add->SetInCombatWithZone();
        }

        // Si Buru est a portee, il inflige des degats a celui-ci et changement de cible
        if (Creature* pBuru = m_pInstance->GetCreature(m_pInstance->GetData64(DATA_BURU)))
        {
            if (pBuru->isAlive() && pBuru->GetDistance2d(m_creature) < 5.0f && pBuru->GetHealthPercent() >= 20)
            {
                pBuru->getThreatManager().modifyThreatPercent(pBuru->getVictim(), -100);

                pBuru->SetHealth(pBuru->GetHealth() - 45000);
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        return;
    }
};

CreatureAI* GetAI_boss_buru(Creature* pCreature)
{
    return new boss_buruAI(pCreature);
}

CreatureAI* GetAI_mob_buru_egg(Creature* pCreature)
{
    return new mob_buru_eggAI(pCreature);
}

void AddSC_boss_buru()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_buru";
    newscript->GetAI = &GetAI_boss_buru;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_buru_egg";
    newscript->GetAI = &GetAI_mob_buru_egg;
    newscript->RegisterSelf();
}

