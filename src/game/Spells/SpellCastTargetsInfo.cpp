#include "SpellCastTargetsInfo.h"

#include "DBCEnums.h"
#include "GridDefines.h"
#include "SpellDefines.h"
#include "Item.h"
#include "Player.h"
#include "Corpse.h"
#include "SpellCaster.h"
#include "GameObject.h"
#include "TradeData.h"
#include "Map.h"
#include "ObjectAccessor.h"

SpellCastTargets::SpellCastTargets()
{
    m_unitTarget = nullptr;
    m_itemTarget = nullptr;
    m_GOTarget   = nullptr;

    m_itemTargetEntry  = 0;

    m_srcX = m_srcY = m_srcZ = m_destX = m_destY = m_destZ = 0.0f;
    m_targetMask = 0;
}

void SpellCastTargets::PrepareForSpellSystem(Unit* caster)
{
    if (m_targetMask == TARGET_FLAG_SELF)
    {
        m_destX = caster->GetPositionX();
        m_destY = caster->GetPositionY();
        m_destZ = caster->GetPositionZ();
        m_unitTarget = caster;
        m_unitTargetGUID = caster->GetObjectGuid();
    }
    else
    {
        if (m_targetMask & (TARGET_FLAG_ITEM | TARGET_FLAG_TRADE_ITEM))
        {
            MANGOS_ASSERT(caster->IsPlayer()); // Must be a player if items are used
        }
    }

    // Resolve GUIDs to find real units/GOs
    Update(caster);
}

void SpellCastTargets::setUnitTarget(Unit* target)
{
    if (!target)
        return;

    m_destX = target->GetPositionX();
    m_destY = target->GetPositionY();
    m_destZ = target->GetPositionZ();
    m_unitTarget = target;
    m_unitTargetGUID = target->GetObjectGuid();
    m_targetMask |= TARGET_FLAG_UNIT;
}

void SpellCastTargets::setDestination(float x, float y, float z)
{
    m_destX = x;
    m_destY = y;
    m_destZ = z;
    m_targetMask |= TARGET_FLAG_DEST_LOCATION;
}

void SpellCastTargets::setSource(float x, float y, float z)
{
    m_srcX = x;
    m_srcY = y;
    m_srcZ = z;
    m_targetMask |= TARGET_FLAG_SOURCE_LOCATION;
}

void SpellCastTargets::setGOTarget(GameObject* target)
{
    m_GOTarget = target;
    m_GOTargetGUID = target->GetObjectGuid();
    //    m_targetMask |= TARGET_FLAG_GAMEOBJECT;
}

void SpellCastTargets::setItemTarget(Item* item)
{
    if (!item)
        return;

    m_itemTarget = item;
    m_itemTargetGUID = item->GetObjectGuid();
    m_itemTargetEntry = item->GetEntry();
    m_targetMask |= TARGET_FLAG_ITEM;
}

void SpellCastTargets::setTradeItemTarget(Player* caster)
{
    m_itemTargetGUID = ObjectGuid(uint64(TRADE_SLOT_NONTRADED));
    m_itemTargetEntry = 0;
    m_targetMask |= TARGET_FLAG_TRADE_ITEM;

    Update(caster);
}

void SpellCastTargets::updateTradeSlotItem()
{
    if (m_itemTarget && (m_targetMask & TARGET_FLAG_TRADE_ITEM))
    {
        m_itemTargetGUID = m_itemTarget->GetObjectGuid();
        m_itemTargetEntry = m_itemTarget->GetEntry();
    }
}

void SpellCastTargets::setCorpseTarget(Corpse* corpse)
{
    m_CorpseTargetGUID = corpse->GetObjectGuid();
}

void SpellCastTargets::Update(SpellCaster* pCaster)
{
    m_GOTarget   = m_GOTargetGUID ? pCaster->GetMap()->GetGameObject(m_GOTargetGUID) : nullptr;
    m_unitTarget = m_unitTargetGUID ?
                   (m_unitTargetGUID == pCaster->GetObjectGuid() ? pCaster->ToUnit() : ObjectAccessor::GetUnit(*pCaster, m_unitTargetGUID)) :
                   nullptr;

    m_itemTarget = nullptr;
    if (Player* pPlayer = pCaster->ToPlayer())
    {
        if (m_targetMask & TARGET_FLAG_ITEM)
            m_itemTarget = pPlayer->GetItemByGuid(m_itemTargetGUID);
        else if (m_targetMask & TARGET_FLAG_TRADE_ITEM)
        {
            if (TradeData* pTrade = pPlayer->GetTradeData())
                if (m_itemTargetGUID.GetRawValue() < TRADE_SLOT_COUNT)
                    m_itemTarget = pTrade->GetTraderData()->GetItem(TradeSlots(m_itemTargetGUID.GetRawValue()));
        }

        if (m_itemTarget)
            m_itemTargetEntry = m_itemTarget->GetEntry();
    }
}

void SpellCastTargets::read(ByteBuffer& data)
{
    data >> m_targetMask;

    if (m_targetMask == TARGET_FLAG_SELF)
        return; // Will be filled when calling PrepareForSpellSystem

    if (m_targetMask & TARGET_FLAG_UNIT)
        data >> m_unitTargetGUID.ReadAsPackedClientBuildAware();

    if (m_targetMask & (TARGET_FLAG_GAMEOBJECT))
        data >> m_GOTargetGUID.ReadAsPackedClientBuildAware();

    if (m_targetMask & (TARGET_FLAG_CORPSE_ALLY | TARGET_FLAG_CORPSE_ENEMY))
        data >> m_CorpseTargetGUID.ReadAsPackedClientBuildAware();

    if (m_targetMask & (TARGET_FLAG_ITEM | TARGET_FLAG_TRADE_ITEM))
        data >> m_itemTargetGUID.ReadAsPackedClientBuildAware();

    if (m_targetMask & TARGET_FLAG_SOURCE_LOCATION)
    {
        data >> m_srcX >> m_srcY >> m_srcZ;
        if (!MaNGOS::IsValidMapCoord(m_srcX, m_srcY, m_srcZ))
            throw ByteBufferException(false, data.rpos(), 0, data.size());
    }

    if (m_targetMask & TARGET_FLAG_DEST_LOCATION)
    {
        data >> m_destX >> m_destY >> m_destZ;
        if (!MaNGOS::IsValidMapCoord(m_destX, m_destY, m_destZ))
            throw ByteBufferException(false, data.rpos(), 0, data.size());
    }

    if (m_targetMask & TARGET_FLAG_STRING)
        data >> m_strTarget;
}

void SpellCastTargets::write(ByteBuffer& data) const
{
    data << uint16(m_targetMask);

    if (m_targetMask & (TARGET_FLAG_UNIT | TARGET_FLAG_CORPSE_ENEMY | TARGET_FLAG_GAMEOBJECT | TARGET_FLAG_CORPSE_ALLY))
    {
        if (m_targetMask & TARGET_FLAG_UNIT)
        {
            if (m_unitTarget)
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
                data << m_unitTarget->GetPackGUID();
#else
                data << m_unitTarget->GetGUID();
#endif
            else
                data << uint8(0);
        }
        else if (m_targetMask & (TARGET_FLAG_GAMEOBJECT))
        {
            if (m_GOTarget)
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
                data << m_GOTarget->GetPackGUID();
#else
                data << m_GOTarget->GetGUID();
#endif
            else
                data << uint8(0);
        }
        else if (m_targetMask & (TARGET_FLAG_CORPSE_ALLY | TARGET_FLAG_CORPSE_ENEMY))
            data << m_CorpseTargetGUID.WriteAsPacked();
        else
            data << uint8(0);
    }

    if (m_targetMask & (TARGET_FLAG_ITEM | TARGET_FLAG_TRADE_ITEM))
    {
        if (m_itemTarget)
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
            data << m_itemTarget->GetPackGUID();
#else
            data << m_itemTarget->GetGUID();
#endif
        else
            data << uint8(0);
    }

    if (m_targetMask & TARGET_FLAG_SOURCE_LOCATION)
        data << m_srcX << m_srcY << m_srcZ;

    if (m_targetMask & TARGET_FLAG_DEST_LOCATION)
        data << m_destX << m_destY << m_destZ;

    if (m_targetMask & TARGET_FLAG_STRING)
        data << m_strTarget;
}
