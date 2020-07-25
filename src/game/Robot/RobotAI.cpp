#include "RobotAI.h"
#include "Strategy_Solo.h"
#include "Group.h"
#include "Strategy_Group_Azuregos.h"
#include "Strategy_Group_BlackrockSpire.h"
#include "Strategy_Group_DoctorWeavil.h"
#include "Strategy_Group_Emeriss.h"
#include "Strategy_Group_Lethon.h"
#include "Strategy_Group_MoltenCore.h"
#include "Strategy_Group_Taerar.h"
#include "Strategy_Group_Test.h"
#include "Strategy_Group_Ysondre.h"

RobotAI::RobotAI(Player* pmMe)
{
    me = pmMe;
    checkDelay = 0;
    robotType = 0;

    strategyMap.clear();

    Strategy_Solo* rss = new Strategy_Solo(me);
    strategyMap[Strategy_Index::Strategy_Index_Solo] = rss;

    Strategy_Group* rsg = new Strategy_Group(me);
    strategyMap[Strategy_Index::Strategy_Index_Group] = rsg;

    Strategy_Group_BlackrockSpire* rsBlackrockSpire = new Strategy_Group_BlackrockSpire(me);
    strategyMap[Strategy_Index::Strategy_Index_Group_BlackrockSpire] = rsBlackrockSpire;

    Strategy_Group_DoctorWeavil* rsDoctorWeavil = new Strategy_Group_DoctorWeavil(me);
    strategyMap[Strategy_Index::Strategy_Index_Group_DoctorWeavil] = rsDoctorWeavil;

    Strategy_Group_Emeriss* rsEmeriss = new Strategy_Group_Emeriss(me);
    strategyMap[Strategy_Index::Strategy_Index_Group_Emeriss] = rsEmeriss;

    Strategy_Group_Lethon* rsLethon = new Strategy_Group_Lethon(me);
    strategyMap[Strategy_Index::Strategy_Index_Group_Lethon] = rsLethon;

    Strategy_Group_Taerar* rsTaerar = new Strategy_Group_Taerar(me);
    strategyMap[Strategy_Index::Strategy_Index_Group_Taerar] = rsTaerar;

    Strategy_Group_Ysondre* rsYsondre = new Strategy_Group_Ysondre(me);
    strategyMap[Strategy_Index::Strategy_Index_Group_Ysondre] = rsYsondre;

    Strategy_Group_Azuregos* rsAzuregos = new Strategy_Group_Azuregos(me);
    strategyMap[Strategy_Index::Strategy_Index_Group_Azuregos] = rsAzuregos;

    Strategy_Group_MoltenCore* rsMoltenCore = new Strategy_Group_MoltenCore(me);
    strategyMap[Strategy_Index::Strategy_Index_Group_MoltenCore] = rsMoltenCore;

    Strategy_Group_Test* rsTest = new Strategy_Group_Test(me);
    strategyMap[Strategy_Index::Strategy_Index_Group_Test] = rsTest;
}

void RobotAI::ResetStrategies()
{
    for (std::unordered_map<uint32, Strategy_Base*>::iterator stIT = strategyMap.begin(); stIT != strategyMap.end(); stIT++)
    {
        if (Strategy_Base* eachST = stIT->second)
        {
            if (eachST->sb)
            {
                eachST->sb->IdentifyCharacterSpells();
                eachST->sb->Reset();
            }
        }
    }
}

void RobotAI::Update(uint32 pmDiff)
{
    checkDelay += pmDiff;
    if (checkDelay > AI_CHECK_DELAY)
    {
        if (Group* myGroup = me->GetGroup())
        {
            strategyMap[myGroup->groupStrategyIndex]->Update(checkDelay);
        }
        else
        {
            strategyMap[Strategy_Index::Strategy_Index_Solo]->Update(checkDelay);
        }
        checkDelay = 0;
    }
}
