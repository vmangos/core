/*
 * PlayerBots Command Server Stub - vMaNGOS Compatibility
 * 
 * PlayerbotCommandServer implements a TCP command server using boost::asio.
 * vMaNGOS doesn't bundle boost::asio, so we provide a no-op stub.
 */

#include "PlayerbotCommandServer.h"

void PlayerbotCommandServer::Start()
{
}

void PlayerbotCommandServer::Stop()
{
}

void PlayerbotCommandServer::Update(uint32 /*diff*/)
{
}
