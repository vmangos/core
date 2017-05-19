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
SDName: Boss_Maexxna
SD%Complete: 60
SDComment: this needs review, and rewrite of the webwrap ability
SDCategory: Naxxramas
EndScriptData */

#include "scriptPCH.h"
#include "naxxramas.h"
#include <random>
#include <algorithm>
#include <array>
enum
{
    SPELL_WEBWRAP           = 28622,    //Spell is normally used by the webtrap on the wall NOT by Maexxna

    SPELL_WEBSPRAY          = 29484,
    SPELL_POISONSHOCK       = 28741,
    SPELL_NECROTICPOISON    = 28776,    // 90% reduced healing. Dispelllable
    SPELL_FRENZY            = 28747,    // 30% enrage

    //spellId invalid
    SPELL_SUMMON_SPIDERLING = 29434,


    // from cmangos, unimplemented
    EMOTE_SPIN_WEB = -1533146,
    EMOTE_SPIDERLING = -1533147,
    EMOTE_SPRAY = -1533148,
    EMOTE_BOSS_GENERIC_FRENZY = -1000005,

    SPELL_DOUBLE_ATTACK = 19818, // seems it adds an aura, must be removed manually?

    //SPELL_WEBWRAP = 28622,
    SPELL_WEBWRAP_2 = 28673,                    // purpose unknown

    NPC_WEB_WRAP = 16486,
    NPC_SPIDERLING = 17055,

    // SPELL_SUMMON_SPIDERLING_1 = 29434,                   // works.
    // SPELL_SUMMON_SPIDERLING_2 = 30076,                   // works
    // SPELL_SUMMON_WEB_WRAP     = 28627,                   // Auras: unknown creature id = 17286 (only need its modelid) Form Spell Aura Transform in Spell ID = 28627
    // SPELL_WEB_WRAP = 28673, // does an attack animation, presumably used by maexxna when web-wrap is cast

    /*
    SPELL_WEB_WRAP_UNKNOWN   = 28617,
    SPELL_WEB_WRAP_1         = 28618,
    SPELL_WEB_WRAP_2         = 28619,
    SPELL_WEB_WRAP_3         = 28620,
    SPELL_WEB_WRAP_4         = 28621,
    SPELL_WEB_WRAP_TRIGGERED = 28622, //triggered by SPELL_WEB_WRAP_1-4
    SPELL_CLEAR_WEB_WRAP     = 28628,
    SPELL_CLEAR_WEB_WRAP     = 28629,
    */

    MAX_SPIDERLINGS = 10, // 8 in cmangos, should be 10 
    MAX_WEB_WRAP_POSITIONS = 3,
};

static const float WebWrapCooldown(bool initial = false)            { return initial ? 20000 : 40000; }
static const float SummonSpiderlingsCooldown(bool initial = false)  { return initial ? 30000 : 40000; }
static const float WebSprayCooldown(bool initial = false)           { return initial ? 40000 : 40000; }
static const float PoisonShockCooldown(bool initial = false)        { return initial ? 30000 : 30000; } // todo: probably not correct
static const float NecroticPoisonCooldown(bool initial = false)     { return initial ? 20000 : 20000; } // todo: probably not correct

/* note:
It has been witnessed that with surgical timing Rogues (using Vanish) and Mages (with Iceblock) 
can avoid the Web Spray and continue to DPS her down during the final Web Spray when they 
would normally be immobilised. Also, since a Web Wrap takes a half second to be removed after 
it's been DPS'd down, a player can avoid Web Spray if timed correctly.
*/

static constexpr float locs[MAX_WEB_WRAP_POSITIONS][3] =
{
    { 3546.796f, -3869.082f, 296.450f },
    { 3546.796f, -3847.424f, 299.450f },
    { 3546.796f, -3843.384f, 302.384f }
};
static const float aWebWrapLoc[MAX_WEB_WRAP_POSITIONS][3] =
{
    { 3546.796f, -3869.082f, 296.450f },
    { 3531.271f, -3847.424f, 299.450f },
    { 3497.067f, -3843.384f, 302.384f }
};

/*
static constexpr float webWrapLocations[7][3]  = 
{
    { 3562.60f, -3891.90f, 314.70f },
    { 3555.49f, -3864.53f, 312.94f },
    { 3544.95f, -3849.77f, 314.41f },
    { 3534.70f, -3841.90f, 316.75f },
    { 3522.00f, -3835.80f, 317.83f },
    { 3504.73f, -3832.30f, 319.30f },
    { 3488.00f, -3833.81f, 318.78f }
};
*/
struct mob_webwrapAI : public ScriptedAI
{
    mob_webwrapAI(Creature* pCreature) : ScriptedAI(pCreature) {
        Reset(); 
        m_creature->SetVisibility(UnitVisibility::VISIBILITY_OFF);
    }

    ObjectGuid m_victimGuid;
    uint32 m_uiWebWrapTimer;
    bool webWrapDone;
    void Reset() override
    {
        m_uiWebWrapTimer = 0;
        webWrapDone = false;
    }

    void MoveInLineOfSight(Unit* /*pWho*/) override {}
    void AttackStart(Unit* /*pWho*/) override {}

    void SetVictim(Unit* pVictim)
    {
        if (pVictim && pVictim->GetTypeId() == TYPEID_PLAYER)
        {
            // Vanilla spell 28618, 28619, 28620, 28621 had effect SPELL_EFFECT_PLAYER_PULL with EffectMiscValue = 200, 300, 400 and 500
            // All these spells trigger 28622 after 1 or 2 seconds
            // the EffectMiscValue may have been based on the distance between the victim and the target

            // NOTE: This implementation may not be 100% correct, but it gets very close to the expected result

            DoCastSpellIfCan(pVictim, 28619, CAST_TRIGGERED);
            m_victimGuid = pVictim->GetObjectGuid();
            m_uiWebWrapTimer = 2000;
            /*
            float fDist = m_creature->GetDistance2d(pVictim);
            // Switch the speed multiplier based on the distance from the web wrap
            uint32 uiEffectMiscValue = 500;
            if (fDist < 25.0f)
                uiEffectMiscValue = 200;
            else if (fDist < 50.0f)
                uiEffectMiscValue = 300;
            else if (fDist < 75.0f)
                uiEffectMiscValue = 400;

            // This doesn't give the expected result in all cases
            ((Player*)pVictim)->KnockBackFrom(m_creature, -fDist, uiEffectMiscValue * 0.033f);

            // Jump movement not supported on 2.4.3 or 1.12.1
            //float fSpeed = fDist * (uiEffectMiscValue * 0.01f);
            //pVictim->GetMotionMaster()->MoveJump(m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), fSpeed, 0.0f);

            m_victimGuid = pVictim->GetObjectGuid();
            m_uiWebWrapTimer = uiEffectMiscValue == 200 ? 1000 : 2000;
            */
        }
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (m_victimGuid)
        {
            if (Player* pVictim = m_creature->GetMap()->GetPlayer(m_victimGuid))
            {
                if (pVictim->isAlive()) {
                    pVictim->RemoveAurasDueToSpell(SPELL_WEBWRAP);
                }
            }
        }
        ((TemporarySummon*)m_creature)->UnSummon();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_victimGuid)
            return;

        Player* pVictim = m_creature->GetMap()->GetPlayer(m_victimGuid);
        if (!pVictim || pVictim->isDead()) {
            ((TemporarySummon*)m_creature)->UnSummon();
            return;
        }
        
        if (!webWrapDone && m_uiWebWrapTimer < uiDiff)
        {
            DoTeleportTo(pVictim->GetPositionX(), pVictim->GetPositionY(), pVictim->GetPositionZ(), 0);
            m_creature->SetVisibility(UnitVisibility::VISIBILITY_ON);
            webWrapDone = true;
            m_creature->GetMotionMaster()->MovePoint(0, pVictim->GetPositionX(), pVictim->GetPositionY(), pVictim->GetPositionZ(),
                MOVE_FLY_MODE|MOVE_CYCLIC, 0.0f, 0);
        }
        else if(!webWrapDone){
            m_uiWebWrapTimer -= uiDiff;
        }
        /*
        if (m_uiWebWrapTimer)
        {
            // Finally the player gets web wrapped and he should change the display id until the creature is killed
            if (m_uiWebWrapTimer <= uiDiff)
            {
                if (Player* pVictim = m_creature->GetMap()->GetPlayer(m_victimGuid))
                    pVictim->CastSpell(pVictim, SPELL_WEBWRAP, true, nullptr, nullptr, m_creature->GetObjectGuid());

                m_uiWebWrapTimer = 0;
            }
            else
                m_uiWebWrapTimer -= uiDiff;
        }
        */
    }
};

/*
struct mob_webwrapAI : public ScriptedAI
{
    mob_webwrapAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint64 m_uiVictimGUID;

    void Reset()
    {
        m_uiVictimGUID = 0;
    }

    void SetVictim(Unit* pVictim)
    {
        if (pVictim)
        {
            m_uiVictimGUID = pVictim->GetGUID();
            pVictim->CastSpell(pVictim, SPELL_WEBWRAP, true);
        }
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage)
    {
        if (uiDamage > m_creature->GetHealth())
        {
            if (m_uiVictimGUID)
            {
                if (Unit* pVictim = m_creature->GetMap()->GetUnit(m_uiVictimGUID))
                    pVictim->RemoveAurasDueToSpell(SPELL_WEBWRAP);
            }
        }
    }

    void MoveInLineOfSight(Unit* pWho) { }
    void UpdateAI(const uint32 uiDiff) { }
};
*/
struct boss_maexxnaAI : public ScriptedAI
{
    boss_maexxnaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    instance_naxxramas* m_pInstance;

    uint32 m_uiWebWrapTimer;
    uint32 m_uiWebSprayTimer;
    uint32 m_uiPoisonShockTimer;
    uint32 m_uiNecroticPoisonTimer;
    uint32 m_uiSummonSpiderlingTimer;
    bool   m_bEnraged;
    std::random_device m_randDevice;
    std::mt19937 m_random{ m_randDevice() };

    std::vector<std::array<float,3>> wepWrapLoc =
    {
        { 3562.60f, -3891.90f, 314.70f },
        { 3555.49f, -3864.53f, 312.94f },
        { 3544.95f, -3849.77f, 314.41f },
        { 3534.70f, -3841.90f, 316.75f },
        { 3522.00f, -3835.80f, 317.83f },
        { 3504.73f, -3832.30f, 319.30f },
        { 3488.00f, -3833.81f, 318.78f }
    };

    void Reset()
    {
        
        m_uiWebWrapTimer = WebWrapCooldown(true);
        m_uiWebSprayTimer = WebSprayCooldown(true);
        m_uiPoisonShockTimer = PoisonShockCooldown(true);
        m_uiNecroticPoisonTimer = NecroticPoisonCooldown(true);
        m_uiSummonSpiderlingTimer = SummonSpiderlingsCooldown(true);
        m_bEnraged = false;
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_MAEXXNA, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_MAEXXNA, DONE);
    }

    void JustReachedHome() override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_MAEXXNA, FAIL);
    }

    /*
    void DoCastWebWrap()
    {
        ThreatList const& tList = m_creature->getThreatManager().getThreatList();
        std::vector<Unit *> targets;

        //This spell doesn't work if we only have 1 player on threat list
        if (tList.size() < 2)
            return;

        //begin + 1 , so we don't target the one with the highest threat
        ThreatList::const_iterator itr = tList.begin();
        std::advance(itr, 1);

        //store the threat list in a different container
        for (; itr != tList.end(); ++itr)
        {
            Unit* target = m_creature->GetMap()->GetUnit((*itr)->getUnitGuid());

            //only on alive players
            if (target && target->isAlive() && target->GetTypeId() == TYPEID_PLAYER)
                targets.push_back(target);
        }

        //cut down to size if we have more than 3 targets
        while (targets.size() > 3)
            targets.erase(targets.begin() + rand() % targets.size());

        int i = 0;

        for (std::vector<Unit *>::iterator iter = targets.begin(); iter != targets.end(); ++iter, ++i)
        {
            // Teleport the 3 targets to a location on the wall and summon a Web Wrap on them
            DoTeleportPlayer((*iter), locs[i][0], locs[i][1], locs[i][2], (*iter)->GetOrientation());
            if (Creature* pWrap = m_creature->SummonCreature(16486, locs[i][0], locs[i][1], locs[i][2], 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 120000))
                ((mob_webwrapAI*)pWrap->AI())->SetVictim((*iter));
        }
    }
    */
    
    bool DoCastWebWrap()
    {
        // If we can't select a player for web wrap then skip the summoning
        if (!m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0/*1*/, uint32(0), SELECT_FLAG_PLAYER))
            return false;

        std::shuffle(wepWrapLoc.begin(), wepWrapLoc.end(), m_random);
        for (int i = 0; i < 1/*3*/; i++)
        {
            if (Creature* pC = m_creature->SummonCreature(NPC_WEB_WRAP, wepWrapLoc[i][0], wepWrapLoc[i][1], wepWrapLoc[i][2], 0,
                TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 60000))
            {
                // anything to be done?
            }
        }
        /*
        uint8 uiPos1 = urand(0, MAX_WEB_WRAP_POSITIONS - 1);
        m_creature->SummonCreature(NPC_WEB_WRAP, aWebWrapLoc[uiPos1][0], aWebWrapLoc[uiPos1][1], aWebWrapLoc[uiPos1][2], 0, TEMPSUMMON_TIMED_COMBAT_OR_DEAD_DESPAWN, 60000);

        uint8 uiPos2 = (uiPos1 + urand(1, MAX_WEB_WRAP_POSITIONS - 1)) % MAX_WEB_WRAP_POSITIONS;
        m_creature->SummonCreature(NPC_WEB_WRAP, aWebWrapLoc[uiPos2][0], aWebWrapLoc[uiPos2][1], aWebWrapLoc[uiPos2][2], 0, TEMPSUMMON_TIMED_COMBAT_OR_DEAD_DESPAWN, 60000);
        */

        return true;
    }

    void JustSummoned(Creature* pSummoned) override
    {
        if (pSummoned->GetEntry() == NPC_WEB_WRAP)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, /*1*/0, nullptr/*SPELL_WEBWRAP*/, SELECT_FLAG_PLAYER))
            {
                if (mob_webwrapAI* pWebAI = dynamic_cast<mob_webwrapAI*>(pSummoned->AI()))
                    pWebAI->SetVictim(pTarget);
            }
        }
        else if (pSummoned->GetEntry() == NPC_SPIDERLING)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                pSummoned->AI()->AttackStart(pTarget);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Web Wrap
        if (m_uiWebWrapTimer < uiDiff)
        {
            DoCastWebWrap();
            m_uiWebWrapTimer = WebWrapCooldown();
        }
        else
            m_uiWebWrapTimer -= uiDiff;

        // Web Spray
        if (m_uiWebSprayTimer < uiDiff)
        {
            if(DoCastSpellIfCan(m_creature->getVictim(), SPELL_WEBSPRAY) == CAST_OK)
                m_uiWebSprayTimer = WebSprayCooldown();
        }
        else
            m_uiWebSprayTimer -= uiDiff;

        // Poison Shock
        if (m_uiPoisonShockTimer < uiDiff)
        {
            if(DoCastSpellIfCan(m_creature->getVictim(), SPELL_POISONSHOCK) == CAST_OK)
                m_uiPoisonShockTimer = PoisonShockCooldown();
        }
        else
            m_uiPoisonShockTimer -= uiDiff;

        // Necrotic Poison
        if (m_uiNecroticPoisonTimer < uiDiff)
        {
            if(DoCastSpellIfCan(m_creature->getVictim(), SPELL_NECROTICPOISON) == CAST_OK)
                m_uiNecroticPoisonTimer = NecroticPoisonCooldown();
        }
        else
            m_uiNecroticPoisonTimer -= uiDiff;

        // Summon Spiderling
        if (m_uiSummonSpiderlingTimer < uiDiff)
        {
            if(DoCastSpellIfCan(m_creature, SPELL_SUMMON_SPIDERLING) == CAST_OK)
                m_uiSummonSpiderlingTimer = SummonSpiderlingsCooldown();
        }
        else
            m_uiSummonSpiderlingTimer -= uiDiff;

        //Enrage if not already enraged and below 30%
        if (!m_bEnraged && m_creature->GetHealthPercent() < 30.0f)
        {
            if(DoCastSpellIfCan(m_creature, SPELL_FRENZY) == CAST_OK)
                m_bEnraged = true;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_webwrap(Creature* pCreature)
{
    return new mob_webwrapAI(pCreature);
}

CreatureAI* GetAI_boss_maexxna(Creature* pCreature)
{
    return new boss_maexxnaAI(pCreature);
}

void AddSC_boss_maexxna()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_maexxna";
    NewScript->GetAI = &GetAI_boss_maexxna;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_webwrap";
    NewScript->GetAI = &GetAI_mob_webwrap;
    NewScript->RegisterSelf();
}
