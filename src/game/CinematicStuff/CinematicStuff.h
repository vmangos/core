#pragma once

#include "Common.h"
#include "SharedDefines.h"
#include "ObjectGuid.h"
#include "Player.h"

class CinematicStuff
{
public:

    static void AddStuff(Player* player, uint32 itemID);
    static void AddSpells(Player* player);
    static void Mount(Player* player, uint32 mountItem);
    static void StuffLevel60(Player* player);
    static void AutoMountPlayer(Player* player, bool mount60 = false);
    static void JumpPlayer(Player* player);
    static void SearchAndDestroy(Player* player);
};