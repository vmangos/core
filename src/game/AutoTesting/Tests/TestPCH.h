/*
 * TestPCH.h
 *
 *  Created on: 22 janv. 2015
 *      Author: Daemon
 */

#ifndef GAME_AUTOTESTING_TESTS_TESTPCH_H_
#define GAME_AUTOTESTING_TESTS_TESTPCH_H_

#include "AutoTesting/AutoTestingMgr.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "MoveMap.h"
#include "Object.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "Unit.h"
#include "VMapFactory.h"
#include "World.h"

#define TEST_ASSERT(cond) { if (!(cond)) Fail(#cond " line %5u %s", __LINE__, __FILE__); }
#define TEST_FIRST \
            { \
                uint32 step = GetTestStep(); \
                uint32 now = 0; \
                NextStep(); \
                if (step == (now++)) \
                {\

#define TEST_DELAY(WAIT_DELAY) \
                    if (step == (now-1))\
                        Wait(WAIT_DELAY);\
                    return; \
                } \
                else if (step == (now++)) \
                {

#define TEST_THEN \
                    return; \
                } \
                else if (step == (now++)) \
                {

#define TEST_MULTIPLE_STEPS(NSTEPS, DELAY_BETWEEN_STEPS) \
                    return; \
                }\
                now += NSTEPS;\
                if (step < now && step >= (now - NSTEPS)) \
                { \
                    Wait(DELAY_BETWEEN_STEPS);

#define TEST_END    Finish();\
                    return; \
                }\
            }

#endif /* GAME_AUTOTESTING_TESTS_TESTPCH_H_ */
