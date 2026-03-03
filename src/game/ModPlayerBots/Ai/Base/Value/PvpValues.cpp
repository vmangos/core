/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "PvpValues.h"

#include "BattlegroundEY.h"
#include "BattlegroundMgr.h"
#include "BattlegroundWS.h"
#include "Playerbots.h"
#include "ServerFacade.h"

Unit* FlagCarrierValue::Calculate()
{
#if !PB_DISABLE_BG_BOT_LOGIC
    Unit* carrier = nullptr;

    if (botAI->GetBot()->InBattleground())
    {
        if (botAI->GetBot()->GetBattlegroundTypeId() == BattlegroundTypeId::BATTLEGROUND_WS)
        {
            BattlegroundWS* bg = (BattlegroundWS*)botAI->GetBot()->GetBattleground();

            if (!bg)
                return nullptr;

            if ((!sameTeam && bot->GetTeamId() == TEAM_HORDE || (sameTeam && bot->GetTeamId() == TEAM_ALLIANCE)) &&
                !bg->GetFlagPickerGUID(TEAM_HORDE).IsEmpty())
                carrier = ObjectAccessor::GetPlayer(bg->GetBgMap(), bg->GetFlagPickerGUID(TEAM_HORDE));

            if ((!sameTeam && bot->GetTeamId() == TEAM_ALLIANCE || (sameTeam && bot->GetTeamId() == TEAM_HORDE)) &&
                !bg->GetFlagPickerGUID(TEAM_ALLIANCE).IsEmpty())
                carrier = ObjectAccessor::GetPlayer(bg->GetBgMap(), bg->GetFlagPickerGUID(TEAM_ALLIANCE));

            if (carrier)
            {
                if (ignoreRange || bot->IsWithinDistInMap(carrier, sPlayerbotAIConfig.sightDistance))
                {
                    return carrier;
                }
                else
                    return nullptr;
            }
        }

        if (botAI->GetBot()->GetBattlegroundTypeId() == BATTLEGROUND_EY)
        {
            BattlegroundEY* bg = (BattlegroundEY*)botAI->GetBot()->GetBattleground();

            if (!bg)
                return nullptr;

            if (bg->GetFlagPickerGUID().IsEmpty())
                return nullptr;

            Player* fc = ObjectAccessor::GetPlayer(bg->GetBgMap(), bg->GetFlagPickerGUID());
            if (!fc)
                return nullptr;

            if (!sameTeam && (fc->GetTeamId() != bot->GetTeamId()))
                carrier = fc;

            if (sameTeam && (fc->GetTeamId() == bot->GetTeamId()))
                carrier = fc;

            if (carrier)
            {
                if (ignoreRange || bot->IsWithinDistInMap(carrier, sPlayerbotAIConfig.sightDistance))
                {
                    return carrier;
                }
                else
                    return nullptr;
            }
        }
    }

    return carrier;
#else
    return nullptr;
#endif
}

std::vector<CreatureData const*> BgMastersValue::Calculate()
{
#if !PB_DISABLE_BG_BOT_LOGIC
    BattlegroundTypeId bgTypeId = (BattlegroundTypeId)stoi(qualifier);

    std::vector<uint32> entries;
    std::map<TeamId, std::map<BattlegroundTypeId, std::vector<uint32>>> battleMastersCache =
        sRandomPlayerbotMgr.getBattleMastersCache();
    entries.insert(entries.end(), battleMastersCache[TEAM_NEUTRAL][bgTypeId].begin(),
                   battleMastersCache[TEAM_NEUTRAL][bgTypeId].end());
    entries.insert(entries.end(), battleMastersCache[TEAM_ALLIANCE][bgTypeId].begin(),
                   battleMastersCache[TEAM_ALLIANCE][bgTypeId].end());
    entries.insert(entries.end(), battleMastersCache[TEAM_HORDE][bgTypeId].begin(),
                   battleMastersCache[TEAM_HORDE][bgTypeId].end());

    std::vector<CreatureData const*> bmGuids;

    for (auto entry : entries)
    {
        for (auto creaturePair : WorldPosition().getCreaturesNear(0, entry))
        {
            bmGuids.push_back(creaturePair);
        }
    }

    return bmGuids;
#else
    return {};
#endif
}

CreatureData const* BgMasterValue::Calculate()
{
#if !PB_DISABLE_BG_BOT_LOGIC
    CreatureData const* bmPair = NearestBm(false);
    if (!bmPair)
        bmPair = NearestBm(true);

    return bmPair;
#else
    return nullptr;
#endif
}

CreatureData const* BgMasterValue::NearestBm(bool allowDead)
{
#if !PB_DISABLE_BG_BOT_LOGIC
    WorldPosition botPos(bot);

    std::vector<CreatureData const*> bmPairs = AI_VALUE2(std::vector<CreatureData const*>, "bg masters", qualifier);

    float rDist = 0.0f;
    CreatureData const* rbmPair = nullptr;

    for (auto& bmPair : bmPairs)
    {
        if (!bmPair)
            continue;

        WorldPosition bmPos(bmPair->position.mapId, bmPair->position.x, bmPair->position.y, bmPair->position.z, bmPair->position.o);

        float dist = botPos.distance(bmPos);

        if (rbmPair && rDist <= dist)
            continue;

        CreatureTemplate const* bmTemplate = sObjectMgr.GetCreatureTemplate(bmPair->creature_id[0]);
        if (!bmTemplate)
            continue;

        FactionTemplateEntry const* bmFactionEntry = sObjectMgr.GetFactionTemplateEntry(bmTemplate->faction);

        if (Unit::GetFactionReactionTo(bmFactionEntry, bot) < REP_NEUTRAL)
            continue;

        AreaTableEntry const* area = bmPos.getArea();

        if (!area)
            continue;

        if (!allowDead)
        {
            Unit* unit = botAI->GetUnit(bmPair);

            if (!unit)
                continue;

            if (unit->GetDeathState() == DEAD)
                continue;
        }

        rbmPair = bmPair;
        rDist = dist;
    }

    return rbmPair;
#else
    return nullptr;
#endif
}

BattlegroundTypeId RpgBgTypeValue::Calculate()
{
#if !PB_DISABLE_BG_BOT_LOGIC
    GuidPosition guidPosition = AI_VALUE(GuidPosition, "rpg target");

    if (guidPosition)
        for (uint32 i = 1; i < MAX_BATTLEGROUND_QUEUE_TYPES; i++)
        {
            BattlegroundQueueTypeId queueTypeId = (BattlegroundQueueTypeId)i;

            BattlegroundTypeId bgTypeId = sBattlegroundMgr.BGTemplateId(queueTypeId);

            Battleground* bg = sBattlegroundMgr.GetBattlegroundTemplate(bgTypeId);
            if (!bg)
                continue;

            if (bot->GetLevel() < bg->GetMinLevel())
                continue;

            // check if already in queue
            if (bot->InBattlegroundQueueForBattlegroundQueueType(queueTypeId))
                continue;

            std::map<TeamId, std::map<BattlegroundTypeId, std::vector<uint32>>> battleMastersCache =
                sRandomPlayerbotMgr.getBattleMastersCache();

            for (auto& entry : battleMastersCache[TEAM_NEUTRAL][bgTypeId])
                if (entry == guidPosition.GetEntry())
                    return bgTypeId;

            for (auto& entry : battleMastersCache[bot->GetTeamId()][bgTypeId])
                if (entry == guidPosition.GetEntry())
                    return bgTypeId;
        }

    return BATTLEGROUND_TYPE_NONE;
#else
    return BATTLEGROUND_TYPE_NONE;
#endif
}
