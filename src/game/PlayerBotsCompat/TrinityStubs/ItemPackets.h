#pragma once

#include <utility>

#include "WorldPacket.h"

namespace WorldPackets
{
namespace Item
{
class AutoStoreBagItem
{
public:
    explicit AutoStoreBagItem(WorldPacket&& packet) : packet_(std::move(packet)) { }

    void Read() { }

    operator WorldPacket&() { return packet_; }

private:
    WorldPacket packet_;
};

class SellItem
{
public:
    explicit SellItem(WorldPacket&& packet) : packet_(std::move(packet)) { }

    void Read() { }

    operator WorldPacket&() { return packet_; }

private:
    WorldPacket packet_;
};

class SocketGems
{
public:
    explicit SocketGems(WorldPacket&& packet) : packet_(std::move(packet)) { }

    void Read() { }

    operator WorldPacket&() { return packet_; }

private:
    WorldPacket packet_;
};
} // namespace Item
} // namespace WorldPackets
