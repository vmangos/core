#include "Movement.h"
#include "World.h"

void WorldPackets::Movement::MovementPacket::ReadFromWorldPacket(WorldPacket& recv_data)
{
    opcode = recv_data.GetOpcode();
    recv_data >> movementInfo;
}

void WorldPackets::Movement::MoveTimeSkipped::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> lag;
}

void WorldPackets::Movement::MoveTeleportAck::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recv_data >> movementCounter;
#endif
    recv_data >> time;
}

void WorldPackets::Movement::MoveSpeedAck::ReadFromWorldPacket(WorldPacket& recv_data)
{
    opcode = recv_data.GetOpcode();
    recv_data >> guid;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recv_data >> movementCounter;
#endif
    recv_data >> movementInfo;
    recv_data >> speed;
}

void WorldPackets::Movement::MoveFlagChangeAck::ReadFromWorldPacket(WorldPacket& recv_data)
{
    opcode = recv_data.GetOpcode();
    recv_data >> guid;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recv_data >> movementCounter;
#endif
    recv_data >> movementInfo;
    uint32 applyInt;
    recv_data >> applyInt;
    apply = applyInt != 0u;
}

void WorldPackets::Movement::MoveRootAck::ReadFromWorldPacket(WorldPacket& recv_data)
{
    opcode = recv_data.GetOpcode();
    recv_data >> guid;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recv_data >> movementCounter;
#endif
    recv_data >> movementInfo;
}

void WorldPackets::Movement::MoveKnockBackAck::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recv_data >> movementCounter;
#endif
    recv_data >> movementInfo;
}

void WorldPackets::Movement::MoveSplineDone::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> movementInfo;
    recv_data >> splineId;
    recv_data.read_skip<float>();
}

void WorldPackets::Movement::MoveNotActiveMover::ReadFromWorldPacket(WorldPacket& recv_data)
{
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    recv_data >> oldMoverGuid;
#endif
    recv_data >> movementInfo;
}
