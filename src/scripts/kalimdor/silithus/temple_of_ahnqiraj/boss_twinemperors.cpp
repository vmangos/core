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
SD%Complete: 95
SDComment:
SDCategory: Temple of Ahn'Qiraj
EndScriptData */

#include "scriptPCH.h"
#include "temple_of_ahnqiraj.h"


static const uint32 PULL_RANGE      = 50;
static const uint32 ABUSE_BUG_RANGE = 20;
static const uint32 TELEPORTTIME    = 30000;
static const uint32 VEKLOR_DIST     = 20;// VL will not come to melee when attacking


enum eSpells {
    SPELL_BERSERK               = 26662,
    
    SPELL_UPPERCUT              = 26007,
    SPELL_UNBALANCING_STRIKE    = 26613,
    
    SPELL_HEAL_BROTHER          = 7393,
    SPELL_TWIN_TELEPORT         = 800,   // CTRA watches for this spell to start its teleport timer
    SPELL_TWIN_TELEPORT_VISUAL  = 26638, // visual
    
    SPELL_EXPLODEBUG            = 804,
    SPELL_MUTATE_BUG            = 802,
    
    SPELL_SHADOWBOLT            = 26006,
    SPELL_BLIZZARD              = 26607,
    SPELL_ARCANEBURST           = 568,
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

static const SIDialogueEntry pullDialogue[] =
{
    { EMOTE_EYE_INTRO,       NPC_MASTERS_EYE, 7000 },
    { SAY_EMPERORS_INTRO_1,  NPC_VEKLOR,      6000 },
    { SAY_EMPERORS_INTRO_2,  NPC_VEKNILASH,   8000 },
    { SAY_EMPERORS_INTRO_3,  NPC_VEKLOR,      3000 },
    { SAY_EMPERORS_INTRO_4,  NPC_VEKNILASH,   3000 },
    { SAY_EMPERORS_INTRO_5,  NPC_VEKLOR,      3000 },
    { SAY_EMPERORS_INTRO_6,  NPC_VEKNILASH,   0 },
    { 0, 0, 0 }
};

struct boss_twinemperorsAI : public ScriptedAI
{
    instance_temple_of_ahnqiraj* m_pInstance;
    uint32 Heal_Timer;
    uint32 Teleport_Timer;
    bool AfterTeleport;
    uint32 AfterTeleportTimer;
    bool DontYellWhenDead;
    uint32 Abuse_Bug_Timer, BugsTimer;
    bool tspellcasted;
    uint32 EnrageTimer;
    
    SIDialogueEntry pullScriptedText;

    virtual bool IAmVeklor() = 0;
    virtual void Reset() = 0;
    virtual void CastSpellOnBug(Creature *target) = 0;

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
        }
        TwinReset();
    }

    void TwinReset()
    {
        Heal_Timer = 0;                                     // first heal immediately when they get close together
        Teleport_Timer = TELEPORTTIME;
        AfterTeleport = false;
        tspellcasted = false;
        AfterTeleportTimer = 0;
        Abuse_Bug_Timer = urand(10000, 17000);
        BugsTimer = 2000;
        m_creature->clearUnitState(UNIT_STAT_STUNNED);
        DontYellWhenDead = false;
        EnrageTimer = 15 * 60000; // todo: uncertain which dialogue should be used on enrage, wowwiki does not add up with db scripts

    }

    Creature* GetOtherBoss()
    {
        if (m_pInstance)
            return m_pInstance->GetSingleCreatureFromStorage(IAmVeklor() ? NPC_VEKNILASH : NPC_VEKLOR);
        return NULL;
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        Creature *pOtherBoss = GetOtherBoss();
        if (pOtherBoss)
        {
            float dPercent = ((float)damage) / ((float)m_creature->GetMaxHealth());
            int odmg = (int)(dPercent * ((float)pOtherBoss->GetMaxHealth()));
            int ohealth = pOtherBoss->GetHealth() - odmg;
            pOtherBoss->SetHealth(ohealth > 0 ? ohealth : 0);
            if (ohealth <= 0)
            {
                pOtherBoss->SetDeathState(JUST_DIED);
                pOtherBoss->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
            }
        }
    }

    void JustDied(Unit* Killer)
    {
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

    void Aggro(Unit* pWho)
    {
        Creature *pOtherBoss = GetOtherBoss();
        if (pOtherBoss)
        {
            // TODO: we should activate the other boss location so he can start attackning even if nobody
            // is near I dont know how to do that
            if (!pOtherBoss->isInCombat())
            {
                pOtherBoss->AI()->AttackStart(pWho);
            }
        }

        if (m_pInstance)
            m_pInstance->SetData(TYPE_TWINS, IN_PROGRESS);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_TWINS, FAIL);
    }

    void SpellHit(Unit *caster, const SpellEntry *entry)
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
#define HEAL_BROTHER_AMOUNT 30000.0f
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

    void TryHealBrother(uint32 diff)
    {
        if (IAmVeklor())                                    // this spell heals caster and the other brother so let VN cast it
            return;

        if (Heal_Timer < diff)
        {
            Unit *pOtherBoss = GetOtherBoss();
            if (pOtherBoss && pOtherBoss->IsWithinDist(m_creature, 60.0f))
            {
                if (DoCastSpellIfCan(pOtherBoss, SPELL_HEAL_BROTHER) == CAST_OK)
                    Heal_Timer = 1000;
            }
        }
        else Heal_Timer -= diff;
    }

    Unit *GetAnyoneCloseEnough(bool totallyRandom)
    {
        int cnt = 0;
        std::list<HostileReference*> candidates;

        ThreatList const& tList = m_creature->getThreatManager().getThreatList();
        for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
        {
            Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());

            if (m_creature->IsWithinMeleeRange(pUnit))
            {
                if (!totallyRandom)
                    return pUnit;
                candidates.push_back((*i));
                ++cnt;
            }
        }
        if (!cnt)
            return NULL;
        for (int randomi = rand() % cnt; randomi > 0; randomi --)
            candidates.pop_front();

        Unit *ret = m_creature->GetMap()->GetUnit(candidates.front()->getUnitGuid());
        candidates.clear();
        return ret;
    }

    Unit *PickNearestPlayer()
    {
        Unit *nearp = NULL;
        float neardist = 0.0f;
        ThreatList const& tList = m_creature->getThreatManager().getThreatList();
        for (ThreatList::const_iterator i = tList.begin(); i != tList.end(); ++i)
        {
            Unit* pUnit = m_creature->GetMap()->GetUnit((*i)->getUnitGuid());

            if (!pUnit)
                continue;

            float pudist = pUnit->GetDistance(m_creature);
            if (!nearp || (neardist > pudist))
            {
                nearp = pUnit;
                neardist = pudist;
            }
        }
        return nearp;
    }

    void TeleportToMyBrother()
    {
        if (!m_pInstance)
            return;

        Teleport_Timer = TELEPORTTIME;

        // mechanics handled by veknilash so they teleport exactly at the same time and to correct coordinates
        if (IAmVeklor())
            return;  

        Creature *pOtherBoss = GetOtherBoss();
        if (pOtherBoss)
        {
            //m_creature->MonsterYell("Teleporting ...", LANG_UNIVERSAL);
            float other_x = pOtherBoss->GetPositionX();
            float other_y = pOtherBoss->GetPositionY();
            float other_z = pOtherBoss->GetPositionZ();
            float other_o = pOtherBoss->GetOrientation();

 	          pOtherBoss->NearTeleportTo(m_creature->GetPositionX(),
 				           m_creature->GetPositionY(),
 				           m_creature->GetPositionZ(),
                m_creature->GetOrientation());
 	          m_creature->NearTeleportTo(other_x, other_y, other_z, other_o);


            SetAfterTeleport();

            if (boss_twinemperorsAI* pOtherAI = dynamic_cast<boss_twinemperorsAI*>(pOtherBoss->AI()))
                pOtherAI->SetAfterTeleport();
        }
    }

    void SetAfterTeleport()
    {
        m_creature->InterruptNonMeleeSpells(false);
        DoStopAttack();
        DoResetThreat();
        DoCastSpellIfCan(m_creature, SPELL_TWIN_TELEPORT_VISUAL);
        m_creature->addUnitState(UNIT_STAT_STUNNED);
        AfterTeleport = true;
        AfterTeleportTimer = 2000;
        tspellcasted = false;
    }

    bool TryActivateAfterTTelep(uint32 diff)
    {
        if (AfterTeleport)
        {
            if (!tspellcasted)
            {
                m_creature->clearUnitState(UNIT_STAT_STUNNED);
                DoCastSpellIfCan(m_creature, SPELL_TWIN_TELEPORT);
                m_creature->addUnitState(UNIT_STAT_STUNNED);
            }

            tspellcasted = true;

            if (AfterTeleportTimer < diff)
            {
                AfterTeleport = false;
                m_creature->clearUnitState(UNIT_STAT_STUNNED);
                Unit *nearu = PickNearestPlayer();
                //DoYell(nearu->GetName(), LANG_UNIVERSAL, 0);
                AttackStart(nearu);
                m_creature->getThreatManager().addThreat(nearu, 100000);
                return true;
            }
            else
            {
                AfterTeleportTimer -= diff;
                // update important timers which would otherwise get skipped
                if (EnrageTimer > diff)
                    EnrageTimer -= diff;
                else
                    EnrageTimer = 0;
                if (Teleport_Timer > diff)
                    Teleport_Timer -= diff;
                else
                    Teleport_Timer = 0;
                return false;
            }
        }
        else
            return true;
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!who || m_creature->getVictim())
            return;

        if (who->isTargetableForAttack() && who->isInAccessablePlaceFor(m_creature) && m_creature->IsHostileTo(who))
        {
            float attackRadius = m_creature->GetAttackDistance(who);
            if (attackRadius < PULL_RANGE)
                attackRadius = PULL_RANGE;
            if (m_creature->IsWithinDistInMap(who, attackRadius) && m_creature->GetDistanceZ(who) <= /*CREATURE_Z_ATTACK_RANGE*/7 /*there are stairs*/)
                AttackStart(who);
        }
    }

    Creature *RespawnNearbyBugsAndGetOne()
    {
        std::list<Creature*> lUnitList;
        GetCreatureListWithEntryInGrid(lUnitList, m_creature, 15316, ABUSE_BUG_RANGE);
        GetCreatureListWithEntryInGrid(lUnitList, m_creature, 15317, ABUSE_BUG_RANGE);

        if (lUnitList.empty())
            return NULL;

        Creature *nearb = NULL;

        for (std::list<Creature*>::iterator iter = lUnitList.begin(); iter != lUnitList.end(); ++iter)
        {
            Creature *c = *iter;
            if (c->isDead())
            {
                c->Respawn();
                c->setFaction(7);
                c->RemoveAllAuras();
            }
            if (!nearb || !urand(0, 3))
                nearb = c;
        }
        return nearb;
    }

    void HandleBugs(uint32 diff)
    {
        if (BugsTimer < diff || Abuse_Bug_Timer < diff)
        {
            Creature *c = RespawnNearbyBugsAndGetOne();
            if (Abuse_Bug_Timer < diff)
            {
                if (c)
                {
                    CastSpellOnBug(c);
                    Abuse_Bug_Timer = urand(10000, 17000);
                }
                else
                    Abuse_Bug_Timer = 1000;
            }
            else
                Abuse_Bug_Timer -= diff;
            BugsTimer = 2000;
        }
        else
        {
            BugsTimer -= diff;
            Abuse_Bug_Timer -= diff;
        }
    }

    void CheckEnrage(uint32 diff)
    {
        if (EnrageTimer < diff)
        {
            if (!m_creature->IsNonMeleeSpellCasted(true))
            {
                if (DoCastSpellIfCan(m_creature, SPELL_BERSERK, CAST_AURA_NOT_PRESENT) == CAST_OK)
                    EnrageTimer = 60 * 60000;
            }
            else EnrageTimer = 0;
        }
        else EnrageTimer -= diff;
    }

    void SharedUpdate(uint32 diff) 
    {
        // Update the pull dialogue
        if (pullScriptedText.uiTimer < diff) {
            DoScriptText(pullScriptedText.iTextEntry, m_creature);
            pullScriptedText.uiTimer = std::numeric_limits<uint32>::max();
        }
        else {
            pullScriptedText.uiTimer -= diff;
        }
    }
};

struct boss_veknilashAI : public boss_twinemperorsAI
{
    bool IAmVeklor()
    {
        return false;
    }
    boss_veknilashAI(Creature* pCreature) : boss_twinemperorsAI(pCreature)
    {
        Reset();
    }

    uint32 UpperCut_Timer;
    uint32 UnbalancingStrike_Timer;
    uint32 Scarabs_Timer;
    int Rand;
    int RandX;
    int RandY;

    Creature* Summoned;

    void Reset()
    {
        TwinReset();
        UpperCut_Timer = urand(14000, 29000);
        UnbalancingStrike_Timer = urand(8000, 18000);
        Scarabs_Timer = urand(7000, 14000);

        //Added. Can be removed if its included in DB.
        m_creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_MAGIC, true);

        pullScriptedText = SIDialogueEntry{ irand(SAY_VEKNILASH_AGGRO_4, SAY_VEKNILASH_AGGRO_1), NPC_VEKNILASH, 2000 };
    }

    void CastSpellOnBug(Creature *target)
    {
        target->setFaction(14);
        target->AddAura(SPELL_MUTATE_BUG);
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
        
        SharedUpdate(diff);

        if (!TryActivateAfterTTelep(diff))
            return;

        //UnbalancingStrike_Timer
        if (UnbalancingStrike_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_UNBALANCING_STRIKE) == CAST_OK)
                UnbalancingStrike_Timer = urand(8000, 20000);
        }
        else UnbalancingStrike_Timer -= diff;

        if (UpperCut_Timer < diff)
        {
            Unit* randomMelee = GetAnyoneCloseEnough(true);
            if (randomMelee)
            {
                if (DoCastSpellIfCan(randomMelee, SPELL_UPPERCUT) == CAST_OK)
                    UpperCut_Timer = urand(15000, 30000);
            }
        }
        else UpperCut_Timer -= diff;

        HandleBugs(diff);

        //Heal brother when 60yrds close
        TryHealBrother(diff);

        //Teleporting to brother
        if (Teleport_Timer < diff)
            TeleportToMyBrother();
        else Teleport_Timer -= diff;

        CheckEnrage(diff);

        DoMeleeAttackIfReady();
    }

    void KilledUnit(Unit*) override
    {
        DoScriptText(SAY_VEKNILASH_SLAY, m_creature);
    }
};

struct boss_veklorAI : public boss_twinemperorsAI
{
    bool IAmVeklor()
    {
        return true;
    }
    boss_veklorAI(Creature* pCreature) : boss_twinemperorsAI(pCreature)
    {
        Reset();
    }

    uint32 ShadowBolt_Timer;
    uint32 Blizzard_Timer;
    uint32 ArcaneBurst_Timer;
    uint32 Scorpions_Timer;
    int Rand;
    int RandX;
    int RandY;

    Creature* Summoned;

    void Reset()
    {
        TwinReset();
        ShadowBolt_Timer = 0;
        Blizzard_Timer = urand(15000, 20000);
        ArcaneBurst_Timer = 1000;
        Scorpions_Timer = urand(7000, 14000);

        //Added. Can be removed if its included in DB.
        m_creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, true);
        m_creature->SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, 0);
        m_creature->SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, 0);
        pullScriptedText = SIDialogueEntry{ irand(SAY_VEKLOR_AGGRO_4, SAY_VEKLOR_AGGRO_1), NPC_VEKLOR, 0 };
    }

    void CastSpellOnBug(Creature *target)
    {
        target->setFaction(14);
        target->AddAura(SPELL_EXPLODEBUG);
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        SharedUpdate(diff);

        // reset arcane burst after teleport - we need to do this because
        // when VL jumps to VN's location there will be a warrior who will get only 2s to run away
        // which is almost impossible
        if (AfterTeleport)
            ArcaneBurst_Timer = 5000;
        if (!TryActivateAfterTTelep(diff))
            return;

        //ShadowBolt_Timer
        if (ShadowBolt_Timer < diff)
        {
            if (!m_creature->IsWithinDist(m_creature->getVictim(), 45.0f))
                m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim(), VEKLOR_DIST, 0);
            else
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHADOWBOLT) == CAST_OK)
                    ShadowBolt_Timer = 2000;
            }
        }
        else ShadowBolt_Timer -= diff;

        //Blizzard_Timer
        if (Blizzard_Timer < diff)
        {
            Unit* target = NULL;
            target = GetAnyoneCloseEnough(true);
            if (target)
            {
                if (DoCastSpellIfCan(target, SPELL_BLIZZARD) == CAST_OK)
                    Blizzard_Timer = urand(15000, 30000);
            }
        }
        else Blizzard_Timer -= diff;

        if (ArcaneBurst_Timer < diff)
        {
            Unit *mvic;
            if ((mvic = GetAnyoneCloseEnough(false)) != NULL)
            {
                if (DoCastSpellIfCan(mvic, SPELL_ARCANEBURST) == CAST_OK)
                    ArcaneBurst_Timer = 5000;
            }
        }
        else ArcaneBurst_Timer -= diff;

        HandleBugs(diff);

        //Heal brother when 60yrds close
        TryHealBrother(diff);

        //Teleporting to brother
        if (Teleport_Timer < diff)
            TeleportToMyBrother();
        else Teleport_Timer -= diff;

        CheckEnrage(diff);

        //VL doesn't melee
        //DoMeleeAttackIfReady();
    }

    void AttackStart(Unit* who)
    {
        if (!who)
            return;

        // VL doesn't melee
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

CreatureAI* GetAI_boss_veknilash(Creature* pCreature)
{
    return new boss_veknilashAI(pCreature);
}

CreatureAI* GetAI_boss_veklor(Creature* pCreature)
{
    return new boss_veklorAI(pCreature);
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
}
