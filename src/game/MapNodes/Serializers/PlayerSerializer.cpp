#include "Player.h"
#include "MapManager.h"
#include "Formulas.h"

bool Player::PrepareWakeUp(ObjectGuid guid)
{
    GetMotionMaster()->Initialize();
    Object::_Create(guid.GetCounter(), 0, HIGHGUID_PLAYER);

    for (int i = UNIT_FIELD_AURA; i <= UNIT_FIELD_AURASTATE; ++i)
        SetUInt32Value(i, 0);

    for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_END; ++slot)
    {
        SetGuidValue(PLAYER_FIELD_INV_SLOT_HEAD + (slot * 2), ObjectGuid());
        SetVisibleItemSlot(slot, NULL);
    }
    SetGuidValue(PLAYER_FARSIGHT, ObjectGuid());
    SetUInt32Value(PLAYER_TRACK_CREATURES, 0);
    SetUInt32Value(PLAYER_TRACK_RESOURCES, 0);
    SetGuidValue(PLAYER_DUEL_ARBITER, ObjectGuid());
    SetUInt32Value(PLAYER_DUEL_TEAM, 0);

    //InitTaxiNodes();
    InitPrimaryProfessions();
    SetCanModifyStats(false);
    return true;
}

bool Player::WakeUp()
{
    InitStatsForLevel();

    uint32 savedHealth = GetHealth();
    uint32 savedPowers[MAX_POWERS];
    for (int i = 0; i < MAX_POWERS; ++i)
        savedPowers[i] = GetPower(Powers(i));

    SetCanModifyStats(true);
    UpdateAllStats();

    SetHealth(savedHealth > GetMaxHealth() ? GetMaxHealth() : savedHealth);
    for (uint32 i = 0; i < MAX_POWERS; ++i)
        SetPower(Powers(i), savedPowers[i] > GetMaxPower(Powers(i)) ? GetMaxPower(Powers(i)) : savedPowers[i]);

    // Now add to map
    SetFallInformation(0, GetPositionZ());
    if (!IsBeingTeleportedFar())
    {
        SetSemaphoreTeleportFar(true);
        WorldLocation &loc = GetTeleportDest();
        GetPosition(loc);
        GetSession()->HandleMoveWorldportAckOpcode();
    }

    return true;
}
