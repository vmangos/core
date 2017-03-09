/*
 * Warlock.cpp
 *
 *  Created on: 23 janv. 2015
 *      Author: Daemon
 */

#include "TestPCH.h"

enum
{
    SPELL_FEL_DOMINATION        = 18708,    // Your next Imp, Voidwalker, Succubus, Felhunter or Felguard Summon spell has its casting time reduced by 5.5 sec
    SPELL_SUMMON_IMP            = 688,      // 10 sec cast by default

    SPELL_LIFE_TAP              = 1454,     // Converts 20 health into 20 mana.
    SPELL_IMPROVED_LIFE_TAP     = 18182,    // Increases the amount of Mana awarded by your Life Tap spell by 10%.

    SPELL_SOULSTONE             = 20763,

    SPELL_MASTER_SUMMONER_R1    = 18709,    // Reduces the casting time of your Imp, Voidwalker, Succubus, and Felhunter Summoning spells by 4 sec and the Mana cost by 40%.
    SPELL_MASTER_SUMMONER_R2    = 18710,    // Reduces the casting time of your Imp, Voidwalker, Succubus, and Felhunter Summoning spells by 4 sec and the Mana cost by 40%.

    SPELL_DRAIN_SOUL            = 11675,
    SPELL_IMPROVED_DRAIN_SOUL   = 18372,

    ITEM_SOULSHARD              = 6265,
    CREATURE_MURLOC             = 46,//~lvl10
    SPELL_HOWL_OF_TERROR        = 5484
};

class warlock_feldomination : public SingleTest
{
public:
    warlock_feldomination() : SingleTest("warlock_feldomination")
    {
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_GNOME);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* p = GetTestPlayer(0);
                p->GiveLevel(60);
                p->ModifyPower(POWER_MANA, 100000);
                p->CastSpell(p, SPELL_SUMMON_IMP, false);
                Spell* summon = p->GetCurrentSpell(CURRENT_GENERIC_SPELL);
                TEST_ASSERT(summon);
                TEST_ASSERT(summon->GetCastTime() == 10000);
                p->InterruptNonMeleeSpells(false);
                p->CastSpell(p, SPELL_FEL_DOMINATION, false);
                Wait(2000);
                break;
            }
            case 2:
            {
                Player* p = GetTestPlayer(0);
                TEST_ASSERT(p->HasAura(SPELL_FEL_DOMINATION));
                p->CastSpell(p, SPELL_SUMMON_IMP, false);
                Spell* summon = p->GetCurrentSpell(CURRENT_GENERIC_SPELL);
                TEST_ASSERT(summon);
                TEST_ASSERT(summon->GetCastTime() == 4500);
                Finish(true);
                break;
            }
        }
        NextStep();
    }
};

class warlock_improved_life_tap : public SingleTest
{
public:
    warlock_improved_life_tap() : SingleTest("warlock_improved_life_tap"), manaWithoutTalent(0)
    {
    }

    uint32 manaWithoutTalent;
    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                manaWithoutTalent = 0;
                SpawnPlayer(0, CLASS_WARLOCK, RACE_GNOME);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* p = GetTestPlayer(0);
                p->SetHealth(100);
                p->SetMaxPower(POWER_MANA, 100);
                p->SetPower(POWER_MANA, 50);
                p->CastSpell(p, SPELL_LIFE_TAP, false);
                Wait(2000); // GCD
                break;
            }
            case 2:
            {
                Player* p = GetTestPlayer(0);
                manaWithoutTalent = p->GetPower(POWER_MANA);
                p->AddAura(SPELL_IMPROVED_LIFE_TAP);
                p->SetHealth(100);
                p->SetPower(POWER_MANA, 50);
                p->CastSpell(p, SPELL_LIFE_TAP, false);
                Wait(2000);
                break;
            }
            case 3:
            {
                Player* p = GetTestPlayer(0);
                TEST_ASSERT(manaWithoutTalent < p->GetPower(POWER_MANA));
                Finish(true);
                break;
            }
        }
        NextStep();
    }
};

class warlock_soulstone : public SingleTest
{
public:
    warlock_soulstone() : SingleTest("warlock_soulstone")
    {
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_GNOME);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* p = GetTestPlayer(0, TESTPLAYER_NO_GODMODE);
                p->AddAura(SPELL_SOULSTONE);
                p->DoKillUnit();
                TEST_ASSERT(p->GetUInt32Value(PLAYER_SELF_RES_SPELL));
                Finish(true);
                break;
            }
        }
        NextStep();
    }
};

class warlock_master_summoner : public SingleTest
{
public:
    warlock_master_summoner() : SingleTest("warlock_master_summoner")
    {
    }

    void TestCastTime(Player* p, uint32 expectedCastTime)
    {
        TEST_ASSERT(p->GetCurrentSpell(CURRENT_GENERIC_SPELL));
        if (p->GetCurrentSpell(CURRENT_GENERIC_SPELL)->GetCastTime() != expectedCastTime)
            Fail("CastTime: %u. Expected: %u", p->GetCurrentSpell(CURRENT_GENERIC_SPELL)->GetCastTime(), expectedCastTime);
    }
    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_GNOME);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* p = GetTestPlayer(0);
                p->GiveLevel(60);
                p->AddAura(SPELL_MASTER_SUMMONER_R1);
                p->CastSpell(p, SPELL_SUMMON_IMP, false);
                Wait(2000);
                break;
            }
            case 2:
            {
                Player* p = GetTestPlayer(0);
                TestCastTime(p, 8000);
                p->InterruptNonMeleeSpells(false);
                p->RemoveAurasDueToSpell(SPELL_MASTER_SUMMONER_R1);
                p->AddAura(SPELL_MASTER_SUMMONER_R2);
                p->CastSpell(p, SPELL_SUMMON_IMP, false);
                Wait(2000);
                break;
            }
            case 4:
            {
                Player* p = GetTestPlayer(0);
                TestCastTime(p, 6000);
                p->InterruptNonMeleeSpells(false);
                p->AddAura(SPELL_FEL_DOMINATION);
                p->CastSpell(p, SPELL_SUMMON_IMP, false);
                Wait(100);
                break;
            }
            case 5:
            {
                Player* p = GetTestPlayer(0);
                TestCastTime(p, 500);
                Finish();
                break;
            }
        }
        NextStep();
    }
};

class warlock_stun_pet_at_summon_pet : public SingleTest
{
public:
    warlock_stun_pet_at_summon_pet() : SingleTest("warlock_stun_pet_at_summon_pet")
    {
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_GNOME);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* p = GetTestPlayer(0, TESTPLAYER_MAXLEVEL);
                p->EnableOption(PLAYER_CHEAT_NO_CAST_TIME);
                p->CastSpell(p, SPELL_SUMMON_IMP, false);
                Wait(2000); // GCD
                break;
            }
            case 2:
            {
                Player* p = GetTestPlayer(0, TESTPLAYER_MAXLEVEL);
                p->RemoveOption(PLAYER_CHEAT_NO_CAST_TIME);
                p->CastSpell(p, SPELL_SUMMON_IMP, false);
                Wait(500);
                break;
            }
            case 3:
            {
                Player* p = GetTestPlayer(0);
                TEST_ASSERT(p->IsNonMeleeSpellCasted());
                TEST_ASSERT(p->GetPet());
                TEST_ASSERT(p->GetPet()->hasUnitState(UNIT_STAT_STUNNED));
                Finish();
                break;
            }
        }
        NextStep();
    }
};
//BT1013
class warlock_area_fear : public SingleTest
{
public:
    warlock_area_fear() : SingleTest("warlock_area_fear", MAP_SPECIAL_GURUBASHI)
    {

    }
    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_HUMAN, 0, 0);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* warlock = GetTestPlayer(0, TESTPLAYER_MAXLEVEL);
                for (int i = 0; i < 12; ++i)
                    SpawnCreature(i + 1, CREATURE_MURLOC, 5.0f * cos(2 * i * M_PI / 40), 5.0f * sin(2 * i * M_PI / 40));
                Wait(100);
                break;
            }
            case 2:
            {
                Player* warlock = GetTestPlayer(0);
                warlock->CastSpell(warlock, SPELL_HOWL_OF_TERROR, true);
                Wait(2000);
                break;
            }
            case 3:
            {
                int nbCreaWithDebuff = 0;
                int nbCreaWithMovement = 0;
                Creature* murloc = NULL;
                for (int i = 1; i < 13; i++)
                {
                    murloc = GetTestCreature(i);
                    if (murloc->HasAura(SPELL_HOWL_OF_TERROR))
                        nbCreaWithDebuff++;
                    if (murloc->GetMotionMaster()->GetCurrentMovementGeneratorType() == FLEEING_MOTION_TYPE)
                        nbCreaWithMovement++;
                    TEST_ASSERT(!(murloc->HasAura(SPELL_HOWL_OF_TERROR) ^ (murloc->GetMotionMaster()->GetCurrentMovementGeneratorType() == FLEEING_MOTION_TYPE)));
                }
                TEST_ASSERT(nbCreaWithDebuff <= 5);
                TEST_ASSERT(nbCreaWithMovement <= 5);
                Finish();
                break;
            }
        }
        NextStep();
    }
};

class warlock_improved_drain_soul : public SingleTest
{
public:
    warlock_improved_drain_soul() : SingleTest("warlock_improved_drain_soul", MAP_SPECIAL_GURUBASHI)
    {

    }
    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_HUMAN, 0, 0);
                SpawnPlayer(1, CLASS_WARRIOR, RACE_ORC, 10, 0);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* warlock = GetTestPlayer(0, TESTPLAYER_MAXLEVEL | TESTPLAYER_FFA_ON | TESTPLAYER_PVP_ON);
                Player* victim = GetTestPlayer(1, TESTPLAYER_MAXLEVEL | TESTPLAYER_FFA_ON | TESTPLAYER_PVP_ON | TESTPLAYER_NO_GODMODE);
                victim->SetHealth(10);
                warlock->AddAura(SPELL_IMPROVED_DRAIN_SOUL);
                warlock->CastSpell(victim, SPELL_DRAIN_SOUL, false);
                Wait(5000);
                break;
            }
            case 2:
            {
                Player* warlock = GetTestPlayer(0);
                Player* victim = GetTestPlayer(1);
                TEST_ASSERT(!victim->isAlive());
                TEST_ASSERT(warlock->HasItemCount(ITEM_SOULSHARD, 1));
                Finish();
                break;
            }
        }
        NextStep();
    }
};
void AddTest_warlock()
{
    sAutoTestingMgr->AddTest(new warlock_feldomination);
    sAutoTestingMgr->AddTest(new warlock_improved_life_tap);
    sAutoTestingMgr->AddTest(new warlock_soulstone);
    sAutoTestingMgr->AddTest(new warlock_master_summoner);
    sAutoTestingMgr->AddTest(new warlock_stun_pet_at_summon_pet);
    sAutoTestingMgr->AddTest(new warlock_area_fear);
    sAutoTestingMgr->AddTest(new warlock_improved_drain_soul);
}
