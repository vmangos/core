/*
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 * Copyright (C) 2010-2011 ScriptDev0 <http://github.com/mangos-zero/scriptdev0>
 *
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
SDName: Boss_Twinemperors
SD%Complete: 
SDComment: 
SDCategory: Temple of Ahn'Qiraj
Rewrtten by Gemt
EndScriptData */

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"


static const uint32 PULL_RANGE      = 50;
//static const uint32 ABUSE_BUG_RANGE = 20;


// todo: uncertain which dialogue should be used on enrage, wowwiki does not add up with db scripts

enum eSpells {
    SPELL_BERSERK               = 26662,
    
    SPELL_TWIN_TELEPORT_SCRIPT  = 799,   // should have a script effect, dosent seem to have one.
    SPELL_TWIN_TELEPORT_MSG     = 800,   // CTRA watches for this spell to start its teleport timer
    SPELL_TWIN_TELEPORT_VISUAL  = 26638, 

    SPELL_HEAL_BROTHER          = 7393,


    // Vek'nilash
    SPELL_UPPERCUT              = 26007,
    SPELL_UNBALANCING_STRIKE    = 26613,
    SPELL_MUTATE_BUG            = 802,
    
    // Vek'lor
    SPELL_SHADOWBOLT            = 26006,
    SPELL_BLIZZARD              = 26607,
    SPELL_ARCANEBURST           = 568,
    SPELL_EXPLODEBUG            = 804,

    // bugs, seems to be defined in db?
    // Virulet Posion
    // Explode Bug
    // Mute Bugs
};

enum eScriptTexts {
    SAY_VEKLOR_AGGRO_1      = -1531019, // its too late to turn away
    SAY_VEKLOR_AGGRO_2      = -1531020, // prepare to embrace oblivion
    SAY_VEKLOR_AGGRO_3      = -1531021, // like a fly in a web
    SAY_VEKLOR_AGGRO_4      = -1531022, // your brash arrogance
    SAY_VEKLOR_SLAY         = -1531023, // you will not escape death
    SAY_VEKLOR_SPECIAL      = -1531025, // to decorate our halls
                                           
    SAY_VEKNILASH_AGGRO_1   = -1531026, // ah, lambs to the slaughter
    SAY_VEKNILASH_AGGRO_2   = -1531027, // let none survive
    SAY_VEKNILASH_AGGRO_3   = -1531028, // join me brother, there is blood to be shed
    SAY_VEKNILASH_AGGRO_4   = -1531029, // look brother, fresh bloood
    SAY_VEKNILASH_SLAY      = -1531030, // your fate is sealed
    SAY_VEKNILASH_SPECIAL   = -1531032, // Shall be your undoing (wipe?)
                                        
    //death is handled by instance_temple_of_ahnqiraj.cpp
    //NOTE: according to wowwiki, the *_SLAY emotes are used during enrage,
    //      while "Oblivion will engulf you", "Like a fly in a web" and "your brash arrogance" 
    //      is used on killing player. Not been able to confirm this.
};

// Shared constants
static const uint32 ENRAGE_TIMER                = 60 * 60000;

static const uint32 JUST_TELEPORTED_FREEZE      = 1500;     // Emperor is "frozen", aka not doing anything, for this long after TP
static const uint32 AFTER_TELEPORT_THREAT       = 3000;     // Threat added to nearest player after TP. TODO: correct amount?

static const uint32 TELEPORTTIME_MIN_CD = 30000;    // Shortest possible cooldown on teleport
static const uint32 TELEPORTTIME_MAX_CD = 40000;    // Longest possible cooldown on teleport

static const uint32 TRY_HEAL_FREQUENCY          = 0;        // How ofthen will the emperors try to heal eachother, 0 for every update
static const uint32 SUCCESS_HEAL_FREQUENCY      = 1500;     // How ofthen will the emperors heal when in range of each other
static const float  HEAL_BROTHER_AMOUNT         = 30000.0f; // How much do they heal when in heal-range
static const float  HEAL_BROTHER_RANGE          = 60.0f;

static const uint32 RESPAWN_BUG_FREQUENCY       = 10000;    // How often do we try to respawn a dead bug
static const float  RESPAWN_BUG_DISTANCE        = 50.0f;    // How far away do we look for dead bugs for respawning
static const float  BUG_SPELL_MAX_DIST          = 20.0f;    // Max distance a bug can be for the twin to choose it

// Vek'nilash constants
static const uint32 UPPERCUT_MIN_CD             = 14000;
static const uint32 UPPERCUT_MAX_CD             = 29000;
static const uint32 UNBALANCING_STRIKE_MIN_CD   = 8000;
static const uint32 UNBALANCING_STRIKE_MAX_CD   = 18000;
static const uint32 MUTATE_BUG_MIN_CD           = 10000;
static const uint32 MUTATE_BUG_MAX_CD           = 15000;

// Vek'lor constants
static const uint32 ARCANE_BURST_COOLDOWN       = 5000;
static const uint32 BLIZZARD_MIN_CD             = 15000;
static const uint32 BLIZZARD_MAX_CD             = 20000;
static const uint32 VEKLOR_DIST                 = 20;       // VL will not come to melee when attacking
static const uint32 SHADOW_BOLT_MIN_CD          = 2000; //todo, use. Looks maybe a bit random on videos?
static const uint32 SHADOW_BOLT_MAX_CD          = 2000; //todo, use. Looks maybe a bit random on videos?
static const uint32 VEKLOR_PULL_YELL_DELAY      = 3000;     // Vek'lors pull yell happens after Vek'nilash
static const uint32 EXPLODE_BUG_MIN_CD          = 7000;
static const uint32 EXPLODE_BUG_MAX_CD          = 10000;

/*
void MoveInLineOfSight(Unit *who)
{
if (!who || m_creature->getVictim())
return;

if (who->isTargetableForAttack() && who->isInAccessablePlaceFor(m_creature) && m_creature->IsHostileTo(who))
{
float attackRadius = m_creature->GetAttackDistance(who);
if (attackRadius < PULL_RANGE)
attackRadius = PULL_RANGE;

// CREATURE_Z_ATTACK_RANGE there are stairs
if (m_creature->IsWithinDistInMap(who, attackRadius) && m_creature->GetDistanceZ(who) <= 7)
AttackStart(who);
}
}
*/

struct boss_twinemperorsAI : public ScriptedAI
{
    instance_temple_of_ahnqiraj* m_pInstance;
    uint32 EnrageTimer;
    
    uint32 justTeleportedTimer;
    bool justTeleported;
    bool didPullDialogue;
    
    uint32 bugMutationTimer;
    uint32 respawnBugTimer;

    virtual uint32 GetBugSpellCooldown() = 0;
    virtual uint32 GetBugSpell() = 0;

    virtual void OnEndTeleportVirtual() = 0;
    virtual void UpdateEmperor(uint32) = 0;

    // Only one of the twins should implement these functions
    virtual void UpdateTeleportToMyBrother(uint32) {}
    virtual void TryHealBrother(uint32 diff) {}

    boss_twinemperorsAI(Creature* pCreature) : 
        ScriptedAI(pCreature)
    {
        instance_temple_of_ahnqiraj* tmpPTr = dynamic_cast<instance_temple_of_ahnqiraj*>(pCreature->GetInstanceData());
        if (!tmpPTr) {
            sLog.outError("boss_twinemperorsAI attempted to cast instance to type instance_temple_of_ahnqiraj, but failed.");
            m_pInstance = nullptr;
        }
        else {
            m_pInstance = (instance_temple_of_ahnqiraj*)pCreature->GetInstanceData();

            //If the encounter has not been started yet this ID they should be kneeling to the eye.
            if (m_pInstance->GetData(TYPE_TWINS) == NOT_STARTED) {
                m_creature->SetStandState(UNIT_STAND_STATE_KNEEL);
            }
        }
        //Reset(); reset is called by child class
    }
    
    virtual void Reset() override
    {
        bugMutationTimer = GetBugSpellCooldown();
        respawnBugTimer = RESPAWN_BUG_FREQUENCY;

        m_creature->clearUnitState(UNIT_STAT_STUNNED);
        EnrageTimer = ENRAGE_TIMER;

        justTeleported = false;
        didPullDialogue = false;
    }

    void DamageTaken(Unit *done_by, uint32 &damage) override
    {
        Creature *pOtherBoss = GetOtherBoss();
        if (pOtherBoss && !pOtherBoss->isDead())
        {
            float dPercent = ((float)damage) / ((float)m_creature->GetMaxHealth());
            int odmg = (int)(dPercent * ((float)pOtherBoss->GetMaxHealth()));
            //int ohealth = pOtherBoss->GetHealth() - odmg;
            //pOtherBoss->SetHealth(ohealth > 0 ? ohealth : 0);

            // Note: does not re-trigger DamageTaken for other target with these flags. 
            m_creature->DealDamage(pOtherBoss, odmg, nullptr, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, nullptr, false);
            /*
            if (ohealth <= 0)
            {
                pOtherBoss->SetDeathState(JUST_DIED);
                pOtherBoss->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
            }
            */
        }
    }

    void JustDied(Unit* Killer) override
    {
        // Only need one of them to kill the other and update instance data
        if (m_pInstance->GetData(TYPE_TWINS) == DONE)
            return;

        if (Creature* pOtherBoss = GetOtherBoss())
        {
            pOtherBoss->SetHealth(0);
            pOtherBoss->SetDeathState(JUST_DIED);
            pOtherBoss->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
        }

        // Death text script is handled by instance upon receiving DONE data
        if (m_pInstance)
            m_pInstance->SetData(TYPE_TWINS, DONE);
    }

    void Aggro(Unit* pWho) override
    {
        if (m_pInstance) {
            if (m_pInstance->GetData(TYPE_TWINS) == IN_PROGRESS) {
                sLog.outBasic("debugging - double Aggr() call");
                return;
            }
            m_pInstance->SetData(TYPE_TWINS, IN_PROGRESS);
        }

        m_creature->SetInCombatWithZone();

        Creature *pOtherBoss = GetOtherBoss();
        if (pOtherBoss)
        {
            // The "other boss" will start running to the same first puller.
            pOtherBoss->AI()->AttackStart(pWho);
            pOtherBoss->SetInCombatWithZone();
        }
    }

    void JustReachedHome() override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_TWINS, FAIL);
    }

    void SpellHit(Unit *caster, const SpellEntry *entry) override
    {
        if (caster == m_creature)
            return;

        Creature *pOtherBoss = GetOtherBoss();
        if (entry->Id != SPELL_HEAL_BROTHER || !pOtherBoss)
            return;

        // add health so we keep same percentage for both brothers
        uint32 mytotal = m_creature->GetMaxHealth(), histotal = pOtherBoss->GetMaxHealth();
        float mult = ((float)mytotal) / ((float)histotal);
        if (mult < 1)
            mult = 1.0f / mult;

        uint32 largerAmount = (uint32)((HEAL_BROTHER_AMOUNT * mult) - HEAL_BROTHER_AMOUNT);

        uint32 myh = m_creature->GetHealth();
        uint32 hish = pOtherBoss->GetHealth();
        if (mytotal > histotal)
        {
            uint32 h = m_creature->GetHealth() + largerAmount;
            m_creature->SetHealth(std::min(mytotal, h));
        }
        else
        {
            uint32 h = pOtherBoss->GetHealth() + largerAmount;
            pOtherBoss->SetHealth(std::min(histotal, h));
        }
    }

    void UpdateAI(const uint32 diff) override
    {
        // The rest of this script requires an instance, less managment and code duplication, and a bit of lazyness
        if (!m_pInstance)
            return;

        /*
        // If we just teleported the emperors won't do shit for a while
        // todo: do they reset cooldowns on teleport to something, or just keep on going once
        // the /afking is complete?
        if (justTeleported) {
            if (justTeleportedTimer <= diff) {
                OnEndTeleport();
            }
            else {
                justTeleportedTimer -= diff;
                
                // These must be called here as well, since selectHostileTarget || getVictim will
                // fail during TP stun effect
                CheckEnrage(diff);
                UpdateTeleportToMyBrother(diff);
                return;
            }
        }
        */

        // Return since we have no target.
        // Since it can be the case when TP stun is on as well, we let the condition pass if we just teleported
        if ( (!m_creature->SelectHostileTarget() || !m_creature->getVictim()) && !justTeleported) {
            return;
        }
        
        if (justTeleported) {
            if (justTeleportedTimer <= diff) {
                OnEndTeleport();
            }
            else {
                justTeleportedTimer -= diff;
            }
        }

        CheckEnrage(diff);
        UpdateTeleportToMyBrother(diff);
        HandleDeadBugs(diff);
        HandleBugSpell(diff);
        TryHealBrother(diff);
        
        // Don't want to update this if we're in the 1.5sec TP stun
        if (!justTeleported) {
            UpdateEmperor(diff);
        }
    }

    Creature* GetOtherBoss()
    {
        if (m_pInstance) 
            return m_pInstance->GetSingleCreatureFromStorage(m_creature->GetEntry() == NPC_VEKLOR ? NPC_VEKNILASH : NPC_VEKLOR);
        return nullptr;
    }

    Unit *GetPlayerInMeleeRange(bool pickFirstTarget)
    {
        std::list<HostileReference*> candidates;

        ThreatList const& tList = m_creature->getThreatManager().getThreatList();
        if (pickFirstTarget && tList.size() > 0)
            return m_creature->GetMap()->GetUnit(tList.front()->getUnitGuid());

        for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i) {
            Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());
            if (!pUnit) continue;

            if (m_creature->IsWithinMeleeRange(pUnit)) {
                candidates.push_back((*i));
            }
        }

        if (!candidates.size())
            return nullptr;

        auto it = candidates.begin();
        std::advance(it, candidates.size() - 1);
        return m_creature->GetMap()->GetUnit((*it)->getUnitGuid());
    }

    Unit *PickNearestPlayer()
    {
        Unit *nearp = nullptr;
        float neardist = std::numeric_limits<float>::max();

        ThreatList const& tList = m_creature->getThreatManager().getThreatList();
        for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i) {
            Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());
            if (!pUnit) continue;

            float pudist = pUnit->GetDistance(m_creature);
            if (neardist > pudist) {
                nearp = pUnit;
                neardist = pudist;
            }
        }
        return nearp;
    }

    // Called as teleport happens
    void OnStartTeleport(float x, float y, float z, float o)
    {
        m_creature->NearTeleportTo(x, y, z, o);


        justTeleported = true;
        justTeleportedTimer = JUST_TELEPORTED_FREEZE;
        m_creature->InterruptNonMeleeSpells(false);
        DoStopAttack();
        
        m_creature->CastSpell(m_creature, SPELL_TWIN_TELEPORT_MSG, true);
        m_creature->CastSpell(m_creature, SPELL_TWIN_TELEPORT_VISUAL, true);
    }

    // Called JUST_TELEPORTED_FREEZE after teleport happened
    void OnEndTeleport()
    {
        justTeleported = false;

        DoResetThreat();

        Unit* closestPlayer = PickNearestPlayer();
        AttackStart(closestPlayer);
        m_creature->getThreatManager().addThreat(closestPlayer, AFTER_TELEPORT_THREAT);

        OnEndTeleportVirtual();
    }

    void HandleDeadBugs(uint32 diff)
    {
        // We try to respawn one random bug every RESPAWN_BUG_FREQUENCY
        if (respawnBugTimer < diff) {
            respawnBugTimer = RESPAWN_BUG_FREQUENCY;

            std::list<Creature*> lUnitList;
            GetCreatureListWithEntryInGrid(lUnitList, m_creature, 15316, RESPAWN_BUG_DISTANCE);
            GetCreatureListWithEntryInGrid(lUnitList, m_creature, 15317, RESPAWN_BUG_DISTANCE);
            std::list<Creature*>::iterator iter;
            for (iter = lUnitList.begin(); iter != lUnitList.end();) {
                Creature *c = *iter;
                if (!c->isDead()){
                    iter = lUnitList.erase(iter);
                }
                else {
                    ++iter;
                }
            }
            if (lUnitList.size() == 0)
                return;
            iter = lUnitList.begin();
            std::advance(iter, urand(0, lUnitList.size() - 1));
            Creature* c = *iter;
            c->Respawn();
            c->setFaction(7);
            c->RemoveAllAuras();
        }
        else {
            respawnBugTimer -= diff;
        }
    }

    void HandleBugSpell(uint32 diff)
    {
        if (bugMutationTimer < diff) {
            // ToDo: not sure about this, but not seen a bug spell during teleport
            if (justTeleported)
                return;
            std::list<Creature*> lUnitList;
            GetCreatureListWithEntryInGrid(lUnitList, m_creature, 15316, BUG_SPELL_MAX_DIST);
            GetCreatureListWithEntryInGrid(lUnitList, m_creature, 15317, BUG_SPELL_MAX_DIST);

            std::list<Creature*>::iterator iter;
            for (iter = lUnitList.begin(); iter != lUnitList.end();) {
                if ((*iter)->isDead()) {
                    iter = lUnitList.erase(iter);
                }
                else {
                    ++iter;
                }
            }
            if (lUnitList.size() == 0)
                return;
            iter = lUnitList.begin();

            std::advance(iter, urand(0, lUnitList.size() - 1));
            Creature* c = *iter;
            c->setFaction(14);
            c->AddAura(GetBugSpell());
            c->SetHealth(c->GetMaxHealth());
            c->SetInCombatWithZone();
            bugMutationTimer = GetBugSpellCooldown();
        }
        else {
            bugMutationTimer -= diff;
        }
    }
    
    void CheckEnrage(uint32 diff)
    {
        if (EnrageTimer < diff)
        {
            if (!m_creature->IsNonMeleeSpellCasted(true))
            {
                if (DoCastSpellIfCan(m_creature, SPELL_BERSERK, CAST_AURA_NOT_PRESENT) == CAST_OK)
                    EnrageTimer = std::numeric_limits<uint32>::max();
            }
            else EnrageTimer = 0;
        }
        else EnrageTimer -= diff;
    }
   
};

struct boss_veklorAI : public boss_twinemperorsAI
{
    boss_veklorAI(Creature* pCreature) : boss_twinemperorsAI(pCreature)
    {
        Reset();
    }

    uint32 ShadowBolt_Timer;
    uint32 blizzardTimer;
    uint32 ArcaneBurst_Timer;

    uint32 pullDialogueTimer;

    uint32 teleportTimer;
    uint32 healTimer;

    void Reset() override
    {
        boss_twinemperorsAI::Reset();

        ShadowBolt_Timer = 0; // No cooldown on pull
        blizzardTimer = urand(BLIZZARD_MIN_CD, BLIZZARD_MAX_CD);
        teleportTimer = urand(TELEPORTTIME_MIN_CD, TELEPORTTIME_MAX_CD);
        healTimer = TRY_HEAL_FREQUENCY;
        ArcaneBurst_Timer = 0; // No cooldown on pull
        pullDialogueTimer = VEKLOR_PULL_YELL_DELAY;


        // Can be removed if its included in DB.
        m_creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, true);

        // todo: he should actually do some damage, but need sources for how much.
        //m_creature->SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, 0);
        //m_creature->SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, 0);
    }

    uint32 GetBugSpellCooldown() override
    {
        return urand(EXPLODE_BUG_MIN_CD, EXPLODE_BUG_MAX_CD);
    }

    uint32 GetBugSpell()
    {
        return SPELL_EXPLODEBUG;
    }

    virtual void UpdateTeleportToMyBrother(uint32 diff) override
    {
        // Updating time and returning if it's not yet time to teleport
        if (teleportTimer >= diff) {
            teleportTimer -= diff;
            return;
        }

        teleportTimer = urand(TELEPORTTIME_MIN_CD, TELEPORTTIME_MAX_CD);

        // If he is attacked during this periode he will instantly engage
        // If noone attacked during that periode, he start attacking after the period.

        Creature *pOtherBoss = GetOtherBoss();
        if (!pOtherBoss) return; // Well, that was too bad...

        //m_creature->MonsterYell("Teleporting ...", LANG_UNIVERSAL);

        float other_x = pOtherBoss->GetPositionX();
        float other_y = pOtherBoss->GetPositionY();
        float other_z = pOtherBoss->GetPositionZ();
        float other_o = pOtherBoss->GetOrientation();
        float me_x = m_creature->GetPositionX();
        float me_y = m_creature->GetPositionY();
        float me_z = m_creature->GetPositionZ();
        float me_o = m_creature->GetOrientation();

        OnStartTeleport(other_x, other_y, other_z, me_o);
        if (boss_twinemperorsAI* pOtherAI = dynamic_cast<boss_twinemperorsAI*>(pOtherBoss->AI())) {
            pOtherAI->OnStartTeleport(me_x, me_y, me_z, other_o);
        }
    }

    void TryHealBrother(uint32 diff) override
    {
        if (healTimer < diff)
        {
            Unit *pOtherBoss = GetOtherBoss();
            if (pOtherBoss && pOtherBoss->IsWithinDist(m_creature, HEAL_BROTHER_RANGE))
            {
                //if (DoCastSpellIfCan(pOtherBoss, SPELL_HEAL_BROTHER) == CAST_OK)
                healTimer = SUCCESS_HEAL_FREQUENCY;
                m_creature->CastSpell(pOtherBoss, SPELL_HEAL_BROTHER, true);
                pOtherBoss->CastSpell(m_creature, SPELL_HEAL_BROTHER, true);
            }
            else {
                healTimer = TRY_HEAL_FREQUENCY;
            }
        }
        else {
            healTimer -= diff;
        }
    }

    void OnEndTeleportVirtual()
    {
        // reset arcane burst after teleport - we need to do this because
        // when VL jumps to VN's location there will be a warrior who will get only 2s to run away
        // which is almost impossible
        ArcaneBurst_Timer = ARCANE_BURST_COOLDOWN;
    }

    void UpdateEmperor(uint32 diff)
    {
        // Vek'lor does his yell second, so we wait out pullDialogueTimer before yelling
        if (!didPullDialogue) {
            if (pullDialogueTimer < diff) {
                didPullDialogue = true;
                DoScriptText(irand(SAY_VEKLOR_AGGRO_4, SAY_VEKLOR_AGGRO_1), m_creature);
            }
            else {
                pullDialogueTimer -= diff;
            }
        }

        if (ShadowBolt_Timer < diff)
        {
            if (!m_creature->IsWithinDist(m_creature->getVictim(), 45.0f)) {
                m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim(), VEKLOR_DIST, 0);
            }
            else
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOWBOLT) == CAST_OK) {
                    ShadowBolt_Timer = urand(SHADOW_BOLT_MIN_CD, SHADOW_BOLT_MAX_CD);
                }
            }
        }
        else {
            ShadowBolt_Timer -= diff;
        }

        if (blizzardTimer < diff)
        {
            Unit* target = NULL;
            target = GetPlayerInMeleeRange(false);
            if (target)
            {
                if (DoCastSpellIfCan(target, SPELL_BLIZZARD) == CAST_OK)
                    blizzardTimer = urand(BLIZZARD_MIN_CD, BLIZZARD_MAX_CD);
            }
        }
        else {
            blizzardTimer -= diff;
        }

        if (ArcaneBurst_Timer < diff)
        {
            Unit *mvic;
            if ((mvic = GetPlayerInMeleeRange(true)) != NULL)
            {
                if (DoCastSpellIfCan(mvic, SPELL_ARCANEBURST) == CAST_OK)
                    ArcaneBurst_Timer = ARCANE_BURST_COOLDOWN;
            }
        }
        else {
            ArcaneBurst_Timer -= diff;
        }


        // VL doesn't melee
        // XXX: this is not necessarily true. 
        // https://www.youtube.com/watch?v=SNOmg7kE68U&t=53s
         DoMeleeAttackIfReady();
    }

    void AttackStart(Unit* who)
    {
        if (!who)
            return;

        // VL doesn't melee
        // ToDo: yes he does, if he is in melee range, and has cooldown
        // on all his spells!
        if (m_creature->Attack(who, false))
        {
            m_creature->AddThreat(who);
            m_creature->SetInCombatWith(who);
            who->SetInCombatWith(m_creature);

            m_creature->GetMotionMaster()->MoveChase(who, VEKLOR_DIST, 0);
        }
    }

    void KilledUnit(Unit*)
    {
        DoScriptText(SAY_VEKLOR_SLAY, m_creature);
    }
};

struct boss_veknilashAI : public boss_twinemperorsAI
{
    boss_veknilashAI(Creature* pCreature) : boss_twinemperorsAI(pCreature)
    {
    }

    uint32 UpperCut_Timer;
    uint32 UnbalancingStrike_Timer;
    uint32 Scarabs_Timer;
    
    void Reset() override
    {
        boss_twinemperorsAI::Reset();

        UpperCut_Timer          = urand(UPPERCUT_MIN_CD, UPPERCUT_MAX_CD);
        UnbalancingStrike_Timer = urand(UNBALANCING_STRIKE_MIN_CD, UNBALANCING_STRIKE_MAX_CD);

        //Added. Can be removed if its included in DB.
        m_creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_MAGIC, true);
    }

    void OnEndTeleportVirtual()
    {
        //todo: anything that needs doing?
    }

    uint32 GetBugSpellCooldown() override
    {
        return urand(MUTATE_BUG_MIN_CD, MUTATE_BUG_MAX_CD);
    }

    uint32 GetBugSpell()
    {
        return SPELL_MUTATE_BUG;
    }

    void UpdateEmperor(uint32 diff)
    {       
        // Vek'nilash goes first, instantly does his yell when we are in combat. 
        if (!didPullDialogue) {
            didPullDialogue = true;
            DoScriptText(irand(SAY_VEKNILASH_AGGRO_4, SAY_VEKNILASH_AGGRO_1), m_creature);
        }

        //UnbalancingStrike_Timer
        if (UnbalancingStrike_Timer < diff) {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_UNBALANCING_STRIKE) == CAST_OK) {
                UnbalancingStrike_Timer = urand(8000, 20000);
            }
        }
        else {
            UnbalancingStrike_Timer -= diff;
        }

        if (UpperCut_Timer < diff) {
            Unit* randomMelee = GetPlayerInMeleeRange(false);
            if (randomMelee) {
                if (DoCastSpellIfCan(randomMelee, SPELL_UPPERCUT) == CAST_OK) {
                    UpperCut_Timer = urand(15000, 30000);
                }
            }
        }
        else {
            UpperCut_Timer -= diff;
        }

        DoMeleeAttackIfReady();
    }

    void KilledUnit(Unit*) override
    {
        DoScriptText(SAY_VEKNILASH_SLAY, m_creature);
    }
};

struct mob_mastersEye : public ScriptedAI {
    mob_mastersEye(Creature* pCreature) : ScriptedAI(pCreature)
    {
        sLog.outBasic("Masters Eye ctor!");
        Reset();
    }
    
    instance_temple_of_ahnqiraj* m_pInstance;
    uint32 flightUpdate;

    void Reset() override
    {
        instance_temple_of_ahnqiraj* tmpPTr = dynamic_cast<instance_temple_of_ahnqiraj*>(m_creature->GetInstanceData());
        if (!tmpPTr) {
            sLog.outError("boss_twinemperorsAI attempted to cast instance to type instance_temple_of_ahnqiraj, but failed.");
            m_pInstance = nullptr;
        }
        else {
            m_pInstance = (instance_temple_of_ahnqiraj*)m_creature->GetInstanceData();
        }
        flightUpdate = 0;
    }

    void UpdateAI(const uint32 diff) override
    {
        if (m_creature->IsDespawned() || m_pInstance->TwinsDialogueStartedOrDone())
            return;
        if (flightUpdate < diff) {
            m_creature->CastSpell(m_creature, 17131, true); // Start flying 
            m_creature->GetMotionMaster()->MovePoint(0, -8952.7f, 1235.39f, -102.0f, MOVE_FLY_MODE, 0.0f, 4.896f);
            flightUpdate = 5000;
        }
        else {
            flightUpdate -= diff;
        }
    }
};

CreatureAI* GetAI_boss_veknilash(Creature* pCreature)
{
    return new boss_veknilashAI(pCreature);
}

CreatureAI* GetAI_boss_veklor(Creature* pCreature)
{
    return new boss_veklorAI(pCreature);
}

CreatureAI* GetAI_masters_eye(Creature* pCreature)
{
    return new mob_mastersEye(pCreature);
}

void AddSC_boss_twinemperors()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_veknilash";
    newscript->GetAI = &GetAI_boss_veknilash;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_veklor";
    newscript->GetAI = &GetAI_boss_veklor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_masters_eye";
    newscript->GetAI = &GetAI_masters_eye;
    newscript->RegisterSelf();
}
