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
    mutable uint16 opcode {};
public:
    explicit Packet(uint16 opcode) : opcode(opcode) {}
    virtual ~Packet() {}

    void SetOpcode(uint16 op) const { opcode = op; }
    uint16 GetOpcode() const { return opcode; }
};

class ServerPacket : public Packet
{
public:
    explicit ServerPacket(uint16 opcode) : Packet(opcode) {}

    // Attempts to calculate how much buffer space will be needed.
    // This is only a hint for `reserve`, it does not need to be exact.
    virtual size_t EstimateFinalSize() const = 0;

    // It's important that this be called before opcode is set to the binary
    // packet because some packets (update object) can change opcode inside it.
    virtual void AppendBodyTo(ByteBuffer& buffer) const = 0;

    void WritePacket(WorldPacket& packet) const
    {
        packet.reserve(EstimateFinalSize());
        AppendBodyTo(packet);
        packet.SetOpcode(GetOpcode());
    }
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
