 #include "Player.h"



namespace MaNGOS {
namespace Serializer {

template <typename OP>
void Serialize(ByteBuffer& buf, Player& player)
{
    player.Serialize<OP>(buf);
}


template <typename OP>
void Serialize(ByteBuffer& buf, Position& pos)
{
    buf<float>(pos.x);
    buf<float>(pos.y);
    buf<float>(pos.z);
    buf<float>(pos.o);
}

} } // End namespace

inline ByteBuffer& operator<<(ByteBuffer& buf, Position const& p)
{
    buf << p.x << p.y << p.y << p.o;
    return buf;
}
inline ByteBuffer& operator>>(ByteBuffer& buf, Position& p)
{
    buf >> p.x >> p.y >> p.y >> p.o;
    return buf;
}

inline ByteBuffer& operator<<(ByteBuffer& buf, PlayerTaxi const& mask)
{
    std::stringstream oss;
    mask >> oss;
    buf << oss.str();
    return buf;
}
inline ByteBuffer& operator>>(ByteBuffer& buf, PlayerTaxi& mask)
{
    std::string s;
    buf >> s;
    mask.LoadTaxiMask(s.c_str());
    return buf;
}

template <typename OP>
void Player::Serialize(OP& buf)
{
    // Copy paste from Player::SaveToDB to be sure to forget nothing
    buf<string>(m_name);
#define SERIALIZE_VALUE(v) buf<uint32>(m_uint32Values(v));
    SERIALIZE_VALUE(UNIT_FIELD_BYTES_0);
    SERIALIZE_VALUE(UNIT_FIELD_LEVEL);
    SERIALIZE_VALUE(PLAYER_XP);
    SERIALIZE_VALUE(PLAYER_FIELD_COINAGE);
    SERIALIZE_VALUE(PLAYER_FIELD_BYTES);
    SERIALIZE_VALUE(PLAYER_BYTES);
    SERIALIZE_VALUE(PLAYER_BYTES_2);
    SERIALIZE_VALUE(PLAYER_BYTES_3);
    SERIALIZE_VALUE(PLAYER_FLAGS);
    SERIALIZE_VALUE(PLAYER_AMMO_ID);
    for (int i = UNIT_FIELD_HEALTH; i < PLAYER_FIELD_WATCHED_FACTION_INDEX; ++i)
        SERIALIZE_VALUE(i);
    for (uint32 i = 0; i < PLAYER_EXPLORED_ZONES_SIZE; ++i)
        SERIALIZE_VALUE(PLAYER_EXPLORED_ZONES_1 + i);
    SERIALIZE_VALUE(PLAYER_FIELD_WATCHED_FACTION_INDEX);

    Serialize<OP, Position>(m_position);
    Serialize<OP, TaxiMask>(m_taxi);
    buf<uint32>(m_cinematic);

    buf<uint32>(m_Played_time[PLAYED_TIME_TOTAL]);
    buf<uint32>(m_Played_time[PLAYED_TIME_LEVEL]);

    buf<float>(m_rest_bonus);
    //save, far from tavern/city
    //save, but in tavern/city
    buf<uint32>(m_resetTalentsCost);
    buf<uint64>(m_resetTalentsTime);

/*
    // Transports do not need to be handled for now
    buf<float>(m_movementInfo.GetTransportPos()->x);
    buf<float>(m_movementInfo.GetTransportPos()->y);
    buf<float>(m_movementInfo.GetTransportPos()->z);
    buf<float>(m_movementInfo.GetTransportPos()->o);
    if (m_transport)
        buf<uint32>(m_transport->GetGUIDLow());
    else
        buf<uint32>(0);
*/

    buf<uint32>(m_ExtraFlags);

    buf<uint32>(m_stableSlots);                    // to prevent save uint8 as char

    buf<uint32>(m_atLoginFlags);

    buf<uint32>(m_zoneUpdateId);

    buf<uint64>(m_deathExpireTime);

    buf<uint32>(m_highest_rank.rank);
    buf<uint32>(m_standing_pos);
    buf<float>(m_stored_honor);
    buf<uint32>(m_stored_dishonorableKills);
    buf<uint32>(m_stored_honorableKills);

    // Nostalrius
    buf<uint32>(worldMask);
    buf<uint32>(customFlags);
    buf<uint32>(m_lastweek_honorable_kills);
    buf<float>(m_lastweek_honor);
}
