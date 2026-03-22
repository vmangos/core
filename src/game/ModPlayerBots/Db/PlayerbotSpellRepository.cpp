#include "Log.h"
#include "DBCStores.h"
#include "DatabaseEnv.h"
#include "Database/Field.h"
// Required due to poor implementation on AC side
#include "Database/QueryResult.h"
#include "ObjectMgr.h"

#include "PlayerbotSpellRepository.h"

//  caches the result set
void PlayerbotSpellRepository::Initialize()
{
    LOG_INFO("playerbots", "Playerbots: ListSpellsAction caches initialized");

    skillSpells.clear();
    vendorItems.clear();

    for (uint32 row = 0; row < sObjectMgr.GetMaxSkillLineAbilityId(); ++row)
    {
        SkillLineAbilityEntry const* skillLine = sObjectMgr.GetSkillLineAbility(row);
        if (!skillLine || !skillLine->spellId)
            continue;

        skillSpells[skillLine->spellId] = skillLine;
    }

    // Fill the vendorItems cache once from the world database.
    std::unique_ptr<QueryResult> results = WorldDatabase.Query("SELECT item FROM npc_vendor WHERE maxcount = 0");
    if (results)
    {
        do
        {
            Field* fields = results->Fetch();
            int32 entry = fields[0].GetInt32();
            if (entry <= 0)
                continue;

            vendorItems.insert(static_cast<uint32>(entry));
        }
        while (results->NextRow());
    }

    LOG_DEBUG("playerbots",
        "ListSpellsAction: initialized caches (skillSpells={}, vendorItems={}).",
        skillSpells.size(), vendorItems.size());
}

SkillLineAbilityEntry const* PlayerbotSpellRepository::GetSkillLine(uint32 spellId) const
{
    auto itr = skillSpells.find(spellId);
    if (itr != skillSpells.end())
        return itr->second;
    return nullptr;
}

bool PlayerbotSpellRepository::IsItemBuyable(uint32 itemId) const
{
    return vendorItems.find(itemId) != vendorItems.end();
}
