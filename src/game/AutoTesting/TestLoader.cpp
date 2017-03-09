/*
 * TestLoader.cpp
 *
 *  Created on: 22 janv. 2015
 *      Author: Daemon
 */

void AddTest_testsystem();
void AddTest_warlock();
void AddTest_mage();
void AddTest_shaman();

void AddTest_generic();
void AddTest_cinematics();
void AddTest_controls();
void AddTest_channeling();
void AddTest_auras_stack();
void AddTest_packet_broadcaster();

void LoadTests()
{
    AddTest_testsystem();
    AddTest_warlock();
    AddTest_mage();
    AddTest_shaman();

    AddTest_generic();
    AddTest_controls();
    AddTest_channeling();
    AddTest_auras_stack();
    AddTest_cinematics();
    AddTest_packet_broadcaster();
}
