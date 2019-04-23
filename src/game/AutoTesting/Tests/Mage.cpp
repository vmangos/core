/*
 * Mage.cpp
 */

#include "TestPCH.h"

enum
{
    SPELL_FROST_NOVA        = 122, // R1
    SPELL_ARCANE_MISSILE    = 5145, // R3
};

class mage_frostnova : public SingleTest
{
public:
    mage_frostnova() : SingleTest("mage_frostnova")
    {
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_UNDEAD, 0, 1);
                SpawnPlayer(1, CLASS_MAGE, RACE_GNOME, 0, 0);
                SpawnPlayer(2, CLASS_MAGE, RACE_GNOME, 0, -1); // Friend
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* warlock = GetTestPlayer(0, TESTPLAYER_PVP_ON);
                Player* mage = GetTestPlayer(1, TESTPLAYER_PVP_ON | TESTPLAYER_MAXLEVEL);
                Player* friendplayer = GetTestPlayer(2, TESTPLAYER_PVP_ON);
                mage->CastSpell(mage, SPELL_FROST_NOVA, false);
                TEST_ASSERT(!warlock->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_TAXI_FLIGHT | UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_UNK_16));
                TEST_ASSERT(warlock->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED));
                TEST_ASSERT(warlock->IsHostileTo(mage));
                TEST_ASSERT(friendplayer->IsFriendlyTo(mage));
                TEST_ASSERT(!mage->IsValidAttackTarget(friendplayer));
                TEST_ASSERT(mage->IsValidAttackTarget(warlock));
                Wait(2000);
                break;
            }
            case 2:
            {
                Player* warlock = GetTestPlayer(0);
                Player* friendplayer = GetTestPlayer(2);
                TEST_ASSERT(warlock->HasAura(SPELL_FROST_NOVA));
                TEST_ASSERT(!friendplayer->HasAura(SPELL_FROST_NOVA));
                Finish();
                break;
            }
        }
        NextStep();
    }
};

// Bug: Two mages can't cast arcane missile on the same target
class mage_arcane_missile : public SingleTest
{
public:
    mage_arcane_missile() : SingleTest("mage_arcane_missile", MAP_SPECIAL_GURUBASHI)
    {
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_UNDEAD, 10.0f);
                SpawnPlayer(1, CLASS_MAGE, RACE_GNOME, 0, 1);
                SpawnPlayer(2, CLASS_MAGE, RACE_GNOME, 0, -1);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* warlock = GetTestPlayer(0, TESTPLAYER_PVP_ON);
                Player* mage1 = GetTestPlayer(1, TESTPLAYER_PVP_ON | TESTPLAYER_MAXLEVEL);
                Player* mage2 = GetTestPlayer(2, TESTPLAYER_PVP_ON | TESTPLAYER_MAXLEVEL);
                mage1->SetSelectionGuid(warlock->GetObjectGuid());
                mage2->SetSelectionGuid(warlock->GetObjectGuid());
                mage1->SetFacingToObject(warlock);
                mage2->SetFacingToObject(warlock);
                mage1->CastSpell(warlock, SPELL_ARCANE_MISSILE, false);
                TEST_ASSERT(mage1->IsNonMeleeSpellCasted(false) && "First cast");
                mage2->CastSpell(warlock, SPELL_ARCANE_MISSILE, false);
                TEST_ASSERT(mage1->IsNonMeleeSpellCasted(false));
                TEST_ASSERT(mage2->IsNonMeleeSpellCasted(false));
                Wait(3000);
                break;
            }
            case 2:
            {
                Player* mage1 = GetTestPlayer(1);
                Player* mage2 = GetTestPlayer(2);
                TEST_ASSERT(mage1->IsNonMeleeSpellCasted(false));
                TEST_ASSERT(mage2->IsNonMeleeSpellCasted(false));
                Finish(true);
                break;
            }
        }
        NextStep();
    }
};

class mage_aoe_pvpmode : public SingleTest
{
public:
    mage_aoe_pvpmode() : SingleTest("mage_aoe_pvpmode", MAP_SPECIAL_ORGRIMMAR)
    {
    }

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_UNDEAD, 0, 1);
                SpawnPlayer(1, CLASS_MAGE, RACE_GNOME, 0, 0);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* warlock = GetTestPlayer(0);
                Player* mage = GetTestPlayer(1, TESTPLAYER_MAXLEVEL);
                warlock->SetPvP(false);
                mage->SetPvP(true);
                mage->CastSpell(mage, SPELL_FROST_NOVA, false);
                TEST_ASSERT(!mage->IsValidAttackTarget(warlock));
                TEST_ASSERT(mage->IsPvP());
                Wait(2000);
                break;
            }
            case 2:
            {
                Player* warlock = GetTestPlayer(0, TESTPLAYER_MAXLEVEL);
                Player* mage = GetTestPlayer(1);
                warlock->SetPvP(true);
                warlock->CastSpell(warlock, SPELL_FROST_NOVA, false);
                TEST_ASSERT(mage->IsPvP());
                TEST_ASSERT(warlock->IsPvP());
                TEST_ASSERT(!warlock->HasAura(SPELL_FROST_NOVA));
                TEST_ASSERT(mage->IsValidAttackTarget(warlock));
                TEST_ASSERT(warlock->IsValidAttackTarget(mage));
                Wait(2000);
                break;
            }
            case 3:
            {
                Player* mage = GetTestPlayer(1);
                TEST_ASSERT(mage->HasAura(SPELL_FROST_NOVA));
                Finish();
                break;
            }
        }
        NextStep();
    }
};

void AddTest_mage()
{
    sAutoTestingMgr->AddTest(new mage_frostnova);
    sAutoTestingMgr->AddTest(new mage_arcane_missile);
    sAutoTestingMgr->AddTest(new mage_aoe_pvpmode);
}
