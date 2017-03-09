#include "Chat.h"
#include "MovementBroadcaster.h"
#include "PlayerBroadcaster.h"
#include "World.h"

bool ChatHandler::HandlePBCastStatsCommand(char*)
{
    MovementBroadcaster* bcaster = sWorld.GetBroadcaster();
    auto const& stats = bcaster->GetStats();
    PSendSysMessage("PacketBroadcast: %u threads.", stats.size());
    for (int i = 0; i < stats.size(); ++i)
        PSendSysMessage("Thread #%02u: Update %03ums | %u packets",
            i, stats[i].update_time, stats[i].num_packets);
    PSendSysMessage("Created %u broadcasters | Deleted %u",
        PlayerBroadcaster::num_bcaster_created, PlayerBroadcaster::num_bcaster_deleted);
    return true;
}

bool ChatHandler::HandlePBCastSetThreadsCommand(char* args)
{
    MovementBroadcaster* bcaster = sWorld.GetBroadcaster();
    std::size_t num_threads_before = bcaster->GetNumThreads();
    uint32 num_threads_after;
    if (!ExtractUInt32(&args, num_threads_after))
        return false;

    if (num_threads_after > 50)
    {
        PSendSysMessage("PacketBroadcast: Please decrease the thread count (< 50)");
        return false;
    }

    if (!num_threads_after)
        PSendSysMessage("PacketBroadcast: Disabling broadcaster...");
    else
        PSendSysMessage("PacketBroadcast: Changing num of threads from %u to %u...",
            num_threads_before, num_threads_after);

    bcaster->UpdateConfiguration(num_threads_after, bcaster->GetSleepTimer());
    SendSysMessage(".. done!");
    return true;
}
