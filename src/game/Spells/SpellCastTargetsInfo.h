#ifndef MANGOS_SPELLCASTTARGETSINFO_H
#define MANGOS_SPELLCASTTARGETSINFO_H

#include "Platform/Define.h"
#include "ByteBuffer.h"
#include "ObjectGuid.h"

#include <string>

struct SpellCastTargetsInfo
{
    float m_srcX, m_srcY, m_srcZ;
    float m_destX, m_destY, m_destZ;
    std::string m_strTarget;
    uint16 m_targetMask;

    ObjectGuid m_unitTargetGUID;
    ObjectGuid m_GOTargetGUID;
    ObjectGuid m_CorpseTargetGUID;
    ObjectGuid m_itemTargetGUID;
    uint32 m_itemTargetEntry;

    explicit SpellCastTargetsInfo();

    void ReadFromBuffer(ByteBuffer& recv_data);
};

inline ByteBuffer& operator>> (ByteBuffer& buf, SpellCastTargetsInfo& targetsInfo)
{
    targetsInfo.ReadFromBuffer(buf);
    return buf;
}

#endif // MANGOS_SPELLCASTTARGETSINFO_H
