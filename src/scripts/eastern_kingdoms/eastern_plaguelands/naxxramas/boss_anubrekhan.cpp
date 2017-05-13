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
SDName: Boss_Anubrekhan
SD%Complete: 70
SDComment:
SDCategory: Naxxramas
EndScriptData */

#include "scriptPCH.h"
#include "naxxramas.h"

enum
{
    SAY_GREET                   = -1533000,
    SAY_AGGRO1                  = -1533001,
    SAY_AGGRO2                  = -1533002,
    SAY_AGGRO3                  = -1533003,
    SAY_TAUNT1                  = -1533004,
    SAY_TAUNT2                  = -1533005,
    SAY_TAUNT3                  = -1533006,
    SAY_TAUNT4                  = -1533007,
    SAY_SLAY                    = -1533008,

    SPELL_IMPALE                = 28783,        //May be wrong spell id. Causes more dmg than I expect
    SPELL_LOCUSTSWARM           = 28785,        //This is a self buff that triggers the dmg debuff

    SPELL_SELF_SPAWN_5          = 29105,        //This spawns 5 corpse scarabs ontop of us (most likely the pPlayer casts this on death)
    SPELL_SELF_SPAWN_10         = 28864,        //This is used by the crypt guards when they die

    MOB_CRYPT_GUARD             = 16573
};

struct boss_anubrekhanAI : public ScriptedAI
{
    boss_anubrekhanAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    instance_naxxramas* m_pInstance;

    uint32 m_uiImpaleTimer;
    uint32 m_uiLocustSwarmTimer;
    uint32 m_uiSummonTimer;

    void Reset()
    {
        m_uiImpaleTimer = 15000;                            // 15 seconds
        m_uiLocustSwarmTimer = urand(80000, 120000);        // Random time between 80 seconds and 2 minutes for initial cast
        m_uiSummonTimer = m_uiLocustSwarmTimer + 45000;     // 45 seconds after initial locust swarm
    }

    void JustReachedHome() override
    {
        m_pInstance->SetData(TYPE_ANUB_REKHAN, FAIL);
    }

    void KilledUnit(Unit* pVictim)
    {
        //Force the player to spawn corpse scarabs via spell
        if (pVictim->GetTypeId() == TYPEID_PLAYER)
            pVictim->CastSpell(pVictim, SPELL_SELF_SPAWN_5, true);

        if (urand(0, 4))
            return;

        DoScriptText(SAY_SLAY, m_creature);
    }

    void Aggro(Unit* pWho)
    {
        switch (urand(0, 2))
        {
            case 0:
                DoScriptText(SAY_AGGRO1, m_creature);
                break;
            case 1:
                DoScriptText(SAY_AGGRO2, m_creature);
                break;
            case 2:
                DoScriptText(SAY_AGGRO3, m_creature);
                break;
        }

        if (m_pInstance)
            m_pInstance->SetData(TYPE_ANUB_REKHAN, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_ANUB_REKHAN, DONE);
    }

    void MoveInLineOfSight(Unit* pWho)
    {
        if (pWho->GetTypeId() == TYPEID_PLAYER 
            && !m_creature->isInCombat() 
            && m_creature->IsWithinDistInMap(pWho, 55.0f) 
            && !pWho->HasAuraType(SPELL_AURA_FEIGN_DEATH))
        {
            AttackStart(pWho);
        }

        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Impale
        if (m_uiImpaleTimer < uiDiff)
        {
            //Cast Impale on a random target
            //Do NOT cast it when we are afflicted by locust swarm
            if (!m_creature->HasAura(SPELL_LOCUSTSWARM))
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    DoCastSpellIfCan(target, SPELL_IMPALE);
            }

            m_uiImpaleTimer = 15000;
        }
        else
            m_uiImpaleTimer -= uiDiff;

        // Locust Swarm
        if (m_uiLocustSwarmTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature, SPELL_LOCUSTSWARM);
            m_uiLocustSwarmTimer = 90000;
        }
        else
            m_uiLocustSwarmTimer -= uiDiff;

        // Summon
        if (m_uiSummonTimer < uiDiff)
        {
            DoSpawnCreature(MOB_CRYPT_GUARD, 5, 5, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 60000);
            m_uiSummonTimer = 45000;
        }
        else
            m_uiSummonTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

struct mob_cryptguardsAI : public ScriptedAI
{
    mob_cryptguardsAI(Creature* pCreature) : ScriptedAI(pCreature)
    {

    }

    void Reset() override
    {
    }

    void KilledUnit(Unit* pVictim) override
    {
        //Force the player to spawn corpse scarabs via spell
        if (pVictim->GetTypeId() == TYPEID_PLAYER)
            pVictim->CastSpell(pVictim, SPELL_SELF_SPAWN_5, true);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* pKiller) override
    {
        DoCastSpellIfCan(m_creature, SPELL_SELF_SPAWN_10);
    }
};

struct anub_doorAI : public GameObjectAI
{
    bool haveDoneIntro;

    anub_doorAI(GameObject* pGo) : 
        GameObjectAI(pGo),
        haveDoneIntro(false)
    {
    }

    bool OnUse(Unit* user)
    {
        if (haveDoneIntro)
            return true;
        
        haveDoneIntro = true;

        ScriptedInstance* m_pInstance = (ScriptedInstance*)me->GetInstanceData();

        if (!m_pInstance)
        {
            sLog.outInfo("[boss_anubrekhan/anub_doorAI][Inst %03u] ERROR: No instance", user->GetInstanceId());
            return true; // always true, door should be used regardless
        }

        // Not entirely sure if anub should be able to do all of these SAY_TAUNT* texts on door-open.
        // Wowwiki seems quite sure of it, but it makes more sense if it's just the GREET being used
        // on door open, while the rest are said at random points during the fight?
        if (Creature* anubRekhan = me->GetMap()->GetCreature(m_pInstance->GetData64(NPC_ANUB_REKHAN))) 
        {
            if (anubRekhan->isAlive()) {
                switch (urand(0, 4))
                {
                case 0:
                    DoScriptText(SAY_GREET, anubRekhan);
                    break;
                case 1:
                    DoScriptText(SAY_TAUNT1, anubRekhan);
                    break;
                case 2:
                    DoScriptText(SAY_TAUNT2, anubRekhan);
                    break;
                case 3:
                    DoScriptText(SAY_TAUNT3, anubRekhan);
                    break;
                case 4:
                    DoScriptText(SAY_TAUNT4, anubRekhan);
                    break;
                }
            }
            // "hack" to set the correct variables so we can use reset/open when he is pulled.
            // If we don't do this, some variables are wrong on first pull of the boss,
            // and the door wont close.
            m_pInstance->DoOpenDoor(m_pInstance->GetData64(GO_ARAC_ANUB_DOOR));
            me->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
        }
        
        return true;
    }

};

CreatureAI* GetAI_boss_anubrekhan(Creature* pCreature)
{
    return new boss_anubrekhanAI(pCreature);
}

CreatureAI* GetAI_mob_cryptguards(Creature* pCreature)
{
    return new mob_cryptguardsAI(pCreature);
}

GameObjectAI* GetAI_anub_door(GameObject* pGo)
{
    return new anub_doorAI(pGo);
}

void AddSC_boss_anubrekhan()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_anubrekhan";
    NewScript->GetAI = &GetAI_boss_anubrekhan;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_cryptguards";
    NewScript->GetAI = &GetAI_mob_cryptguards;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "go_anub_door";
    NewScript->GOGetAI = &GetAI_anub_door;
    NewScript->RegisterSelf();
}