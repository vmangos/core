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

    SPELL_SELF_SPAWN_5          = 29105,        // These spells should spawn corpse scarabs, but only show the explosion anim.
    SPELL_SELF_SPAWN_10         = 28864,        // If we fix them to spawn scarbs, code must be changed to not manually spawn them too.
    
    SPELL_CRYPTGUARD_ENRAGE     = 28747,        // 50% attackspeed increase and 100 extra dmg on attack. could be wrong spell.
    SPELL_CRYPTGUARD_CLEAVE     = 26350,        // could be wrong spell. 
    SPELL_CRYPTGUARD_WEB        = 28991,
    SPELL_CRYPTGUARD_ACID       = 28969,

    MOB_CRYPT_GUARD             = 16573,
    MOB_CORPSE_SCARAB           = 16698

    
};



static const float CGs[2][4] = 
{
    { 3291.26f, -3502.08f, 287.26f, 2.14f },
    { 3285.29f, -3446.64f, 287.26f, 4.2f }
};

static constexpr float CRYPTGUARD_DESPAWN       = 15000;


static constexpr uint32 CRYPTGUARD_CLEAVE_CD    = 6000;  // Todo: find correct timer
static constexpr uint32 CRYPTGUARD_WEB_CD       = 12000; // 10 second duration, so 12sec cd makes sense. 
                                                         // From videos you can see there is 1-2sec between consecutive nets.
static constexpr uint32 CRYPTGUARD_ACID_CD      = 5000;  // Todo: find correct timer. 


struct boss_anubrekhanAI : public ScriptedAI
{
    instance_naxxramas* m_pInstance;
    
    // Loaded on first pull of anub
    ObjectGuid cryptGuards[2] = { 0, 0 };

    uint32 m_uiImpaleTimer;
    uint32 m_uiLocustSwarmTimer;
    uint32 m_uiSummonTimer;
    std::vector<std::pair<uint32, ObjectGuid>> deadCryptGuards;
    boss_anubrekhanAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        CheckSpawnInitialCryptGuards();
        Reset();
    }

    void CheckSpawnInitialCryptGuards()
    {
        if (m_pInstance->GetData(TYPE_ANUB_REKHAN) == DONE)
            return;

        for (int i = 0; i < 2; i++)
        {
            // Create the creature if it dosent exist
            if (cryptGuards[i].IsEmpty())
            {
                // While the crypt guard will be despawned manually after CRYPTGUARD_DESPAWN time, when it explodes,
                // we make it a TEMPSUMMON_CORPSE_TIMED_DESPAWN with a slightly longer duration, because if anub is killed
                // before the last crypt guard dies, anubs updateAI will not be able to manually explode and despawn it.z   
                if (Creature* c = m_creature->SummonCreature(MOB_CRYPT_GUARD, CGs[i][0], CGs[i][1], CGs[i][2], CGs[i][3], 
                    TEMPSUMMON_CORPSE_TIMED_DESPAWN, CRYPTGUARD_DESPAWN+10000))
                {
                    cryptGuards[i] = c->GetObjectGuid();
                }
                else 
                {
                    sLog.outError("boss_anubrekhanAI::CheckSpawnInitialCryptGuards failed to spawn initial crypt guard");
                }
            }
            else
            {
                if (Creature* c = m_pInstance->GetCreature(cryptGuards[i]))
                {
                    if (c->isDead()) 
                        c->Respawn();
                }
            }
        }
    }

    void SummonedCreatureJustDied(Creature* pSummoned) override
    {
        if (pSummoned->GetEntry() != MOB_CRYPT_GUARD)
            return;
        // If the crypt guard is one of the two initial crypt guards,
        // set its guid in cryptGuards[] to 0 so it's respawned on JustReachedHome()
        for (int i = 0; i < 2; i++) 
        {
            if (pSummoned->GetObjectGuid() == cryptGuards[i])
                cryptGuards[i] = 0;
        }
        deadCryptGuards.push_back(std::make_pair(CRYPTGUARD_DESPAWN,pSummoned->GetObjectGuid()));
    }

    void Reset()
    {
        m_uiImpaleTimer = 15000;                            // 15 seconds
        m_uiLocustSwarmTimer = urand(80000, 120000);        // Random time between 80 seconds and 2 minutes for initial cast
        m_uiSummonTimer = m_uiLocustSwarmTimer + 45000;     // 45 seconds after initial locust swarm
    }

    void JustReachedHome() override
    {
        m_pInstance->SetData(TYPE_ANUB_REKHAN, FAIL);
        CheckSpawnInitialCryptGuards();
    }

    void KilledUnit(Unit* pVictim)
    {
        // Scarabs are summoned by instance script when a player dies.
        // See instance_naxxramas::OnPlayerDeath(Player*)

        if (urand(0, 4))
            return;

        DoScriptText(SAY_SLAY, m_creature);
    }

    void Aggro(Unit* pWho)
    {
        m_pInstance->SetData(TYPE_ANUB_REKHAN, IN_PROGRESS);
        // Setting in combat with zone and pulling the two crypt-guards
        m_creature->SetInCombatWithZone();
        for (int i = 0; i < 2; i++) {
            if (Creature* cg = m_pInstance->GetCreature(cryptGuards[i])) {
                cg->AI()->AttackStart(pWho);
                cg->SetInCombatWithZone();
            }
        }

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

    void UpdateCorpses(const uint32 diff)
    {
        for (auto it = deadCryptGuards.begin(); it != deadCryptGuards.end();)
        {
            if ((*it).first < diff)
            {
                if (Creature* cg = m_pInstance->GetCreature((*it).second))
                {
                    cg->AI()->DoCast(cg, SPELL_SELF_SPAWN_10, true);
                    
                    // summoning 10 corpse scarabs under the Crypt Guard
                    for (int i = 0; i < 10; i++)
                    {
                        if (Creature* cs = m_creature->SummonCreature(MOB_CORPSE_SCARAB, cg->GetPositionX(), cg->GetPositionY(), cg->GetPositionZ(), 0,
                            TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 60000))
                        {
                            cs->SetInCombatWithZone();
                            if (Unit* csTarget = cs->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                            {
                                cs->AI()->AttackStart(csTarget);
                                cs->AddThreat(csTarget, 5000);
                            }
                        }
                    }

                    if (TemporarySummon* tmpSumm = static_cast<TemporarySummon*>(cg)) {
                        tmpSumm->UnSummon();
                    }

                }
                it = deadCryptGuards.erase(it);
            }
            else 
            {
                (*it).first -= diff;
                ++it;
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        UpdateCorpses(uiDiff);

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
            DoSpawnCreature(MOB_CRYPT_GUARD, 5, 5, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
            m_uiSummonTimer = 45000;
        }
        else
            m_uiSummonTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

struct mob_cryptguardsAI : public ScriptedAI
{
    instance_naxxramas* m_pInstance;
    bool isEnraged;
    uint32 webTimer;
    uint32 acidSpitTimer;
    uint32 cleaveTimer;

    mob_cryptguardsAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    void Reset() override
    {
        isEnraged = false;

        webTimer        = CRYPTGUARD_WEB_CD;
        acidSpitTimer   = CRYPTGUARD_ACID_CD;
        cleaveTimer     = CRYPTGUARD_CLEAVE_CD;
    }

    void Aggro(Unit* pWho)
    {
        // Make sure anub is pulled too. Anub will take care of pulling the other crypt-guard
        if (Creature* anub = m_pInstance->GetCreature(m_pInstance->GetData64(NPC_ANUB_REKHAN)))
        {
            anub->AI()->AttackStart(pWho);
        }
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Crypt guards enrage at 50%
        if (!isEnraged && m_creature->GetHealthPercent() <= 50.0f) {
            if (DoCastSpellIfCan(m_creature, SPELL_CRYPTGUARD_ENRAGE) == CanCastResult::CAST_OK) {
                isEnraged = true;
            }
        }

        if (webTimer < diff) {
            if (DoCastSpellIfCan(m_creature, SPELL_CRYPTGUARD_WEB) == CanCastResult::CAST_OK) {
                webTimer = CRYPTGUARD_WEB_CD;
            }
        }
        else {
            webTimer -= diff;
        }

        if (cleaveTimer < diff) {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CRYPTGUARD_CLEAVE) == CanCastResult::CAST_OK) {
                cleaveTimer = CRYPTGUARD_CLEAVE_CD;
            }
        }
        else {
            cleaveTimer -= diff;
        }

        if (acidSpitTimer < diff) {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CRYPTGUARD_ACID) == CanCastResult::CAST_OK) {
                acidSpitTimer = CRYPTGUARD_ACID_CD;
            }
        }
        else {
            acidSpitTimer -= diff;
        }

        DoMeleeAttackIfReady();
    }
};

struct anub_doorAI : public GameObjectAI
{
    bool haveDoneIntro;
    ScriptedInstance* m_pInstance;

    anub_doorAI(GameObject* pGo) : 
        GameObjectAI(pGo),
        haveDoneIntro(false)
    {
        m_pInstance = (ScriptedInstance*)me->GetInstanceData();
    }

    bool OnUse(Unit* user)
    {
        if (haveDoneIntro)
            return false;
        
        haveDoneIntro = true;

        if (!m_pInstance)
        {
            sLog.outInfo("[boss_anubrekhan/anub_doorAI][Inst %03u] ERROR: No instance", user->GetInstanceId());
            return false;
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