/*
* AurasStack.cpp
*
*/
#include "TestPCH.h"

class check_auras_stack : public SingleTest
{
public:
    check_auras_stack(const char* name, uint32 spellId1, uint32 spellId2) : SingleTest(name, MAP_TESTING_ID, false), _spellId1(spellId1), _spellId2(spellId2)
    {

    }

    uint32 _spellId1, _spellId2;

    void Test() override
    {
        Player* pl1;
        Player* pl2;
        Player* pl3;
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_PALADIN, RACE_HUMAN, 0, 0);
                SpawnPlayer(1, CLASS_PALADIN, RACE_HUMAN, 0, 0);
                SpawnPlayer(2, CLASS_WARRIOR, RACE_ORC, 0, 0);
                WaitPlayerSummon();
                break;
            case 1:
                pl1 = GetTestPlayer(0, TESTPLAYER_MAXLEVEL | TESTPLAYER_PVP_ON);
                pl2 = GetTestPlayer(1, TESTPLAYER_MAXLEVEL | TESTPLAYER_PVP_ON);
                pl3 = GetTestPlayer(2, TESTPLAYER_MAXLEVEL | TESTPLAYER_PVP_ON);
                pl1->CastSpell(pl3, _spellId1, false);
                pl2->CastSpell(pl3, _spellId2, false);
                Wait(3000);
                break;
            case 2:
                pl1 = GetTestPlayer(0);
                pl2 = GetTestPlayer(1);
                pl3 = GetTestPlayer(2);
                TEST_ASSERT(pl3->GetSpellAuraHolder(_spellId1, pl1->GetObjectGuid()));
                TEST_ASSERT(pl3->GetSpellAuraHolder(_spellId2, pl2->GetObjectGuid()));
                Wait(1000);
                break;
            case 3:
                Finish();
                break;
        }
        NextStep();
    }
};

enum
{
    SPELL_CONSECRATION_R1   = 26573,
    SPELL_CONSECRATION_R2   = 20116,
    SPELL_BLIZZARD_R1       = 10,
    SPELL_BLIZZARD_R2       = 6141,
};

void AddTest_auras_stack()
{
    sAutoTestingMgr->AddTest(new check_auras_stack("aura_stack_consecration_r1_r2", SPELL_CONSECRATION_R1, SPELL_CONSECRATION_R2));
    sAutoTestingMgr->AddTest(new check_auras_stack("aura_stack_consecration_r1_r1", SPELL_CONSECRATION_R1, SPELL_CONSECRATION_R1));
    sAutoTestingMgr->AddTest(new check_auras_stack("aura_stack_blizzard_r1_r2", SPELL_BLIZZARD_R1, SPELL_BLIZZARD_R2));
    sAutoTestingMgr->AddTest(new check_auras_stack("aura_stack_blizzard_r1_r1", SPELL_BLIZZARD_R1, SPELL_BLIZZARD_R1));
}

