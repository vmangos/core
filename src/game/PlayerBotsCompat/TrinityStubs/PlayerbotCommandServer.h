#pragma once

#include <string>
#include "Common.h"

class PlayerbotCommandServer
{
public:
    PlayerbotCommandServer() = default;
    ~PlayerbotCommandServer() = default;

    void Start() {}
    void Stop() {}
    void Update(uint32 diff) {}

    bool IsRunning() const { return false; }

    void Send(std::string const& msg) {}
};
