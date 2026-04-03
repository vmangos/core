#ifndef MANGOS_PACKET_H
#define MANGOS_PACKET_H

#include "WorldPacket.h"
#include "Opcodes_active.h"

/**
 * Indicates a packet struct which can be used for multiple opcodes.
 * The actual opcode will be set by `ReadFromWorldPacket`.
 */
uint16 constexpr OPCODE_WILL_BE_SET_IN_READ_FUNCTION = 0xFFFF;

class Packet
{
protected:
    uint16 opcode {};
public:
    explicit Packet(uint16 opcode) : opcode(opcode) {}
    virtual ~Packet() = default;

    uint16 GetOpcode() const { return opcode; }
};

class ClientPacket : public Packet
{
public:
    explicit ClientPacket(uint16 opcode) : Packet(opcode) {}

    /** Updates the fields of this object instance by a given WorldPacket */
    virtual void ReadFromWorldPacket(WorldPacket& recv_data) = 0;
};

/** Indicate an empty packet from the client */
class NullClientPacket final : public ClientPacket
{
public:
    NullClientPacket() : ClientPacket(OPCODE_WILL_BE_SET_IN_READ_FUNCTION) {}
    explicit NullClientPacket(uint16 opcode) : ClientPacket(opcode) {}

    void ReadFromWorldPacket(WorldPacket& recv_data) override
    {
        opcode = recv_data.GetOpcode();
    }
};

#endif // MANGOS_PACKET_H
