#include "SpellCastTargetsInfo.h"

#include "DBCEnums.h"
#include "GridDefines.h"
#include "SpellDefines.h"

SpellCastTargetsInfo::SpellCastTargetsInfo()
    : m_srcX(0), m_srcY(0), m_srcZ(0), m_destX(0), m_destY(0), m_destZ(0), m_targetMask(0), m_itemTargetEntry(0)
{
}

void SpellCastTargetsInfo::ReadFromBuffer(ByteBuffer& data)
{
    data >> m_targetMask;

    if (m_targetMask == TARGET_FLAG_SELF)
        return; // Will be statefully filled when using FromSpellCastTargetsInfo

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
