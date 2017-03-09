#include "TestPCH.h"

enum
{
    NPC_TEST_TARGET         = 5623,
    SHADOW_BOLT_R1          = 686,
    SHEEP_R4                = 12826,
    FEAR_R1                 = 5782,
    SPELL_SHADOWBOLT_R7     = 11659,
    SPELL_FEIGN_DEATH       = 5384,
};

class controls_and_movementTest : public SingleTest
{
public:
    uint32 spellId;
    uint32 movementType;
    controls_and_movementTest(uint32 _spell, uint32 _movement, const char* scriptName) : SingleTest(scriptName), spellId(_spell), movementType(_movement)
    {
    }
    void Test() override
    {
        Player* warlock = GetTestStep() ? GetTestPlayer(0, TESTPLAYER_MAXLEVEL) : NULL;
        Creature* necromancer = GetTestStep() > 1 ? GetTestCreature(1) : NULL;
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_HUMAN, 0, 1);
                WaitPlayerSummon();
                break;
            case 1:
                SpawnCreature(1, NPC_TEST_TARGET, 0, -17);
                DoPlayerCast(0, 1, SHADOW_BOLT_R1);
                Wait(5000);
                break;
            case 2:
                TEST_ASSERT(necromancer->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE);
                DoPlayerCast(0, 1, spellId);
                Wait(5000);
                break;
            case 3:
                TEST_ASSERT(necromancer->HasAura(spellId));
                TEST_ASSERT(necromancer->GetMotionMaster()->GetCurrentMovementGeneratorType() == movementType);
                necromancer->RemoveAllAuras();
                Wait(1000);
                break;
            case 4:
                TEST_ASSERT(necromancer->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE);
                Finish();
                break;
        }
        NextStep();
    }
};

class controls_leave_combatTest : public SingleTest
{
public:
    uint32 spellId;
    uint32 movementType;
    controls_leave_combatTest(uint32 _spell, uint32 _movement, const char* scriptName) : SingleTest(scriptName), spellId(_spell), movementType(_movement)
    {
    }
    void Test() override
    {
        Player* warlock = GetTestStep() ? GetTestPlayer(0, TESTPLAYER_MAXLEVEL) : NULL;
        Player* hunt = GetTestStep() ? GetTestPlayer(1, TESTPLAYER_MAXLEVEL) : NULL;
        Creature* necromancer = GetTestStep() > 1 ? GetTestCreature(2) : NULL;
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_HUMAN, 0, 1);
                SpawnPlayer(1, CLASS_HUNTER, RACE_DWARF, 1, 0);
                WaitPlayerSummon();
                break;
            case 1:
                necromancer = SpawnCreature(2, NPC_TEST_TARGET, 0, -20);
                DoPlayerCast(0, 2, SHADOW_BOLT_R1);
                DoPlayerCast(1, 2, SPELL_SHADOWBOLT_R7);
                Wait(5000);
                break;
            case 2:
                TEST_ASSERT(necromancer->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE);
                TEST_ASSERT(necromancer->getVictim() == hunt);
                DoPlayerCast(0, 2, spellId);
                Wait(4000);
                break;
            case 3:
                TEST_ASSERT(necromancer->HasAura(spellId) && necromancer->GetMotionMaster()->GetCurrentMovementGeneratorType() == movementType);
                DoPlayerCast(1, 1, SPELL_FEIGN_DEATH);
                Wait(200);
                break;
            case 4:
                TEST_ASSERT(necromancer->HasAura(spellId) && necromancer->GetMotionMaster()->GetCurrentMovementGeneratorType() == movementType);
                hunt->RemoveAurasDueToSpell(SPELL_FEIGN_DEATH);
                Wait(1000);
                break;
            case 5:
                necromancer->RemoveAllAuras();
                Wait(1000);
                break;
            case 6:
                TEST_ASSERT(necromancer->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE);
                Finish();
                break;
        }
        NextStep();
    }
};

class controls_sheep_fear_stack : public SingleTest
{
public:
    controls_sheep_fear_stack() : SingleTest("controls_sheep_fear_stack", MAP_SPECIAL_GURUBASHI)
    {

    }
    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_WARLOCK, RACE_HUMAN, 0, 1);
                SpawnPlayer(1, CLASS_MAGE, RACE_HUMAN, 0, 0);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* warlock = GetTestPlayer(0, TESTPLAYER_MAXLEVEL);
                Player* mage = GetTestPlayer(1, TESTPLAYER_MAXLEVEL);
                SpawnCreature(2, NPC_TEST_TARGET, 0, -17);
                Wait(1000);
                break;
            }
            case 2:
            {
                Player* warlock = GetTestPlayer(0);
                Player* mage = GetTestPlayer(1);
                Creature* necromancer = GetTestCreature(2);
                mage->CastSpell(necromancer, SHEEP_R4, true);
                warlock->CastSpell(necromancer, FEAR_R1, true);
                Wait(2000);
                break;
            }
            case 3:
            {
                Player* warlock = GetTestPlayer(0);
                Player* mage = GetTestPlayer(1);
                Creature* necromancer = GetTestCreature(2);
                TEST_ASSERT(mage->isInCombat() && warlock->isInCombat() && necromancer->isInCombat());
                TEST_ASSERT(necromancer->HasAura(SHEEP_R4));
                TEST_ASSERT(necromancer->HasAura(FEAR_R1));
                necromancer->RemoveAllAuras();
                Wait(3000);
                break;
            }
            case 4:
            {
                Player* warlock = GetTestPlayer(0);
                Player* mage = GetTestPlayer(1);
                Creature* necromancer = GetTestCreature(2);
                TEST_ASSERT(necromancer->GetMotionMaster()->GetCurrentMovementGeneratorType() != CONFUSED_MOTION_TYPE);
                TEST_ASSERT(necromancer->GetMotionMaster()->GetCurrentMovementGeneratorType() != FLEEING_MOTION_TYPE);
                Finish();
                break;
            }
        }
        NextStep();
    }
};

void AddTest_controls()
{
    sAutoTestingMgr->AddTest(new controls_and_movementTest(SHEEP_R4, CONFUSED_MOTION_TYPE, "controls_sheep_movement"));
    sAutoTestingMgr->AddTest(new controls_and_movementTest(FEAR_R1, FLEEING_MOTION_TYPE, "controls_fear_movement"));
    sAutoTestingMgr->AddTest(new controls_leave_combatTest(SHEEP_R4, CONFUSED_MOTION_TYPE, "controls_sheep_feign_death_movement"));
    sAutoTestingMgr->AddTest(new controls_leave_combatTest(FEAR_R1, FLEEING_MOTION_TYPE, "controls_fear_feign_death_movement"));
    sAutoTestingMgr->AddTest(new controls_sheep_fear_stack);
}
