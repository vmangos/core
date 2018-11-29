#include "Database/DatabaseEnv.h"
#include "World.h"
#include "Log.h"
#include "ProgressBar.h"
#include "Policies/SingletonImp.h"

#include "AutoBroadCastMgr.h"

INSTANTIATE_SINGLETON_1(AutoBroadCastMgr);

AutoBroadCastMgr::AutoBroadCastMgr()
{

}

AutoBroadCastMgr::~AutoBroadCastMgr()
{
    entries.clear();
}

void AutoBroadCastMgr::load()
{
    entries.clear();
    std::unique_ptr<QueryResult> result(WorldDatabase.Query("SELECT `delay`, `string_id` FROM `autobroadcast`"));

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 AutoBroadCast message");
        return;
    }

    uint32 count = 0;
    BarGoLink bar(result->GetRowCount());

    Field *fields;
    do
    {
        bar.step();
        AutoBroadCastEntry e;
        fields = result->Fetch();

        e.delay = fields[0].GetUInt32();
        e.stringId = fields[1].GetInt32();
        e.lastAnnounce = time(nullptr);

        entries.push_back(e);
        ++count;
    }
    while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u AutoBroadCast messages", count);

}

void AutoBroadCastMgr::update(uint32 diff)
{
    time_t now = time(nullptr);
    std::vector<AutoBroadCastEntry>::iterator iter;
    for (iter = entries.begin(); iter != entries.end(); ++iter)
    {
        if ((now - iter->lastAnnounce) > iter->delay)
        {
            sWorld.SendWorldText(iter->stringId);
            iter->lastAnnounce = now;
        }
    }
}
