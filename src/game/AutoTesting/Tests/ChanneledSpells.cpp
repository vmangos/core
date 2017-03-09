/*
* ChanneledSpells.cpp
*
*/
#include "TestPCH.h"

enum
{
    SHADOW_BOLT_R1                  = 686,
    SPELL_SHEEP_R4                  = 12826,
    SPELL_FEAR_R1                   = 5782,
    SPELL_SOUL_TAP                  = 16430,    //life&mana drain
    SPELL_HAMMER_OF_JUSTICE_R3      = 5589,     //paladin stun
    NPC_TEST_CASTER                 = 10400,
};


class interrupt_mob_channeling_mob : public SingleTest
{
public:
    interrupt_mob_channeling_mob(const char* name, uint32 spellId, uint32 castTime) : SingleTest(name, MAP_TESTING_ID, false), _spellId(spellId), _castTime(castTime)
    {

    }
    uint32 _spellId;
    uint32 _castTime;

    void Test() override
    {
        switch (GetTestStep())
        {
            case 0:
                SpawnPlayer(0, CLASS_PALADIN, RACE_HUMAN, 0, 0);
                WaitPlayerSummon();
                break;
            case 1:
            {
                Player* paladin = GetTestPlayer(0, TESTPLAYER_MAXLEVEL);
                SpawnCreature(1, NPC_TEST_CASTER, 0, -9);
                Wait(500);
                break;
            }
            case 2:
            {
                Player* paladin = GetTestPlayer(0);
                Creature* necromancer = GetTestCreature(1);
                necromancer->CastSpell(paladin, SPELL_SOUL_TAP, false);
                Wait(500);
                break;
            }
            case 3:
            {
                Player* paladin = GetTestPlayer(0);
                Creature* necromancer = GetTestCreature(1);
                TEST_ASSERT(paladin->HasAura(SPELL_SOUL_TAP));
                paladin->CastSpell(necromancer, _spellId, false);
                Wait(_castTime);
                break;
            }
            case 4:
            {
                Player* paladin = GetTestPlayer(0);
                Creature* necromancer = GetTestCreature(1);
                TEST_ASSERT(paladin->isInCombat() && necromancer->isInCombat());
                TEST_ASSERT(necromancer->HasAura(_spellId));
                TEST_ASSERT(!paladin->HasAura(SPELL_SOUL_TAP));
                Finish();
                break;
            }
        }
        NextStep();
    }
};

void AddTest_channeling()
{
    sAutoTestingMgr->AddTest(new interrupt_mob_channeling_mob("channeling_mob_interrupt_stun", SPELL_HAMMER_OF_JUSTICE_R3, 100));
    sAutoTestingMgr->AddTest(new interrupt_mob_channeling_mob("channeling_mob_interrupt_sheep", SPELL_SHEEP_R4, 2500));
    sAutoTestingMgr->AddTest(new interrupt_mob_channeling_mob("channeling_mob_interrupt_fear", SPELL_FEAR_R1, 2500));
}
