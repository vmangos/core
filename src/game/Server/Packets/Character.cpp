#include "Character.h"
#include "SharedDefines.h"

void WorldPackets::Character::CharCreate::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> name;

    recv_data >> race;
    recv_data >> class_;

    // extract other data required for player creating
    recv_data >> gender;
    recv_data >> skin;
    recv_data >> face;
    recv_data >> hairStyle;
    recv_data >> hairColor;
    recv_data >> facialHair;
    recv_data >> outfitId;
}

void WorldPackets::Character::CharDelete::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Character::PlayerLogin::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Character::CharRename::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> newname;
}

void WorldPackets::Character::CharCreateResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

void WorldPackets::Character::CharDeleteResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

void WorldPackets::Character::CharacterLoginFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << result;
}

void WorldPackets::Character::LoginVerifyWorld::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << location.mapId;
    buffer << location.x;
    buffer << location.y;
    buffer << location.z;
    buffer << location.o;
}


