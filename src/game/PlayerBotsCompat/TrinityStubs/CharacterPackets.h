#pragma once

#include <utility>

#include "WorldPacket.h"

namespace WorldPackets
{
namespace Character
{
class LogoutCancel
{
public:
    explicit LogoutCancel(WorldPacket&& packet) : packet_(std::move(packet)) { }

    void Read() { }

    operator WorldPacket&() { return packet_; }

private:
    WorldPacket packet_;
};
} // namespace Character
} // namespace WorldPackets
