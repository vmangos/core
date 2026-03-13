/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#include "UseMeetingStoneAction.h"

#include "CellImpl.h"
#include "Event.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "NearestGameObjects.h"
#include "PlayerbotAIConfig.h"
#include "Playerbots.h"
#include "PositionValue.h"

namespace
{
void NotifySummonPlayer(Player* bot, Player* notifyPlayer, std::string const& text)
{
    if (!bot || !notifyPlayer || !bot->IsInWorld() || !notifyPlayer->IsInWorld())
        return;

    bot->MonsterWhisper(text.c_str(), notifyPlayer);
}

Player* ResolveSummonNotifyPlayer(PlayerbotAI* botAI, Player* notifyPlayer)
{
    if (botAI && notifyPlayer == botAI->GetBot())
        return botAI->GetMaster();

    if (notifyPlayer)
        return notifyPlayer;

    return botAI ? botAI->GetMaster() : nullptr;
}

char const* GetSummonSourceTag(char const* source)
{
    return source ? source : "summon";
}

bool TeleportPlayerTo(Player* summoner, Player* player, float x, float y, float z, float orientation)
{
    return player && summoner && player->TeleportTo(summoner->GetMapId(), x, y, z, orientation);
}
}  // namespace

bool UseMeetingStoneAction::Execute(Event event)
{
    Player* master = GetMaster();
    if (!master)
        return false;

    WorldPacket p(event.getPacket());
    p.rpos(0);
    ObjectGuid guid;
    p >> guid;

    if (master->GetTarget() && master->GetTarget() != bot->GetObjectGuid())
        return false;

    if (!master->GetTarget() && master->GetGroup() != bot->GetGroup())
        return false;

    if (bot->IsInCombat())
    {
        NotifySummonPlayer(bot, ResolveSummonNotifyPlayer(botAI, master), "Summon failed: I am in combat.");
        return false;
    }

    Map* map = master->GetMap();
    if (!map)
        return false;

    GameObject* gameObject = map->GetGameObject(guid);
    if (!gameObject)
        return false;

    GameObjectTemplate const* goInfo = gameObject->GetGOInfo();
    if (!goInfo || goInfo->type != GAMEOBJECT_TYPE_MEETINGSTONE)
        return false;

    return Teleport(master, bot, false, master, "meeting stone");
}

bool SummonAction::Execute(Event event)
{
    Player* master = event.getOwner() ? event.getOwner() : GetMaster();
    if (!master)
        return false;

    if (bot->GetPet())
        botAI->PetFollow();

    AI_VALUE(std::list<FleeInfo>&, "recently flee info").clear();
    return Teleport(master, bot, true, master, "chat summon");
}

bool SummonAction::SummonUsingGos(Player* summoner, Player* player, bool preserveAuras)
{
    std::list<GameObject*> targets;
    AnyGameObjectInObjectRangeCheck u_check(summoner, sPlayerbotAIConfig.sightDistance);
    MaNGOS::GameObjectListSearcher<AnyGameObjectInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(summoner, searcher, sPlayerbotAIConfig.sightDistance);

    for (GameObject* go : targets)
    {
        if (go->isSpawned() && go->GetGoType() == GAMEOBJECT_TYPE_MEETINGSTONE)
            return Teleport(summoner, player, preserveAuras, summoner, "meeting stone");
    }

    NotifySummonPlayer(bot, ResolveSummonNotifyPlayer(botAI, summoner),
                       summoner == bot ? "There is no meeting stone nearby" : "There is no meeting stone near you");
    return false;
}

bool SummonAction::SummonUsingNpcs(Player* summoner, Player* player, bool preserveAuras)
{
    if (!sPlayerbotAIConfig.summonAtInnkeepersEnabled)
        return false;

    std::list<Unit*> targets;
    MaNGOS::AnyUnitInObjectRangeCheck u_check(summoner, sPlayerbotAIConfig.sightDistance);
    MaNGOS::UnitListSearcher<MaNGOS::AnyUnitInObjectRangeCheck> searcher(targets, u_check);
    Cell::VisitObjects(summoner, searcher, sPlayerbotAIConfig.sightDistance);

    for (Unit* unit : targets)
    {
        if (unit && unit->HasFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_INNKEEPER))
        {
            if (!player->HasItemCount(6948, 1, false))
            {
                NotifySummonPlayer(bot, ResolveSummonNotifyPlayer(botAI, summoner),
                                   player == bot ? "I have no hearthstone" : "You have no hearthstone");
                return false;
            }

            if (!player->IsSpellReady(8690))
            {
                NotifySummonPlayer(bot, ResolveSummonNotifyPlayer(botAI, summoner),
                                   player == bot ? "My hearthstone is not ready" : "Your hearthstone is not ready");
                return false;
            }

            // Trigger cooldown
            SpellInfo const* spellInfo = sSpellMgr.GetSpellEntry(8690);
            if (!spellInfo)
                return false;

            Spell spell(player, spellInfo, TRIGGERED_NONE);
            spell.SendSpellCooldown();

            return Teleport(summoner, player, preserveAuras, summoner, "innkeeper summon");
        }
    }

    NotifySummonPlayer(bot, ResolveSummonNotifyPlayer(botAI, summoner),
                       summoner == bot ? "There are no innkeepers nearby" : "There are no innkeepers near you");
    return false;
}

bool SummonAction::Teleport(Player* summoner, Player* player, bool preserveAuras, Player* notifyPlayer,
                            char const* source, bool notifyPlayerResult)
{
    if (!summoner || summoner == player)
        return false;

    notifyPlayer = ResolveSummonNotifyPlayer(botAI, notifyPlayer);
    char const* sourceTag = GetSummonSourceTag(source);

#if PB_HAS_VEHICLES
    if (player->GetVehicle())
    {
        if (notifyPlayerResult)
            NotifySummonPlayer(bot, notifyPlayer, "Summon failed: I am on a vehicle.");
        LOG_INFO("playerbots", "Summon failed (%s): summoner=%s (%u) bot=%s (%u) reason=bot_on_vehicle", sourceTag,
            summoner->GetName(), summoner->GetGUIDLow(), player->GetName(), player->GetGUIDLow());
        return false;
    }
#endif

    if (summoner->IsBeingTeleported() || player->IsBeingTeleported())
    {
        if (notifyPlayerResult)
            NotifySummonPlayer(bot, notifyPlayer, "Summon failed: one of us is already teleporting.");
        LOG_INFO("playerbots",
            "Summon failed (%s): summoner=%s (%u) bot=%s (%u) reason=already_teleporting summonerTeleporting=%u botTeleporting=%u",
            sourceTag, summoner->GetName(), summoner->GetGUIDLow(), player->GetName(), player->GetGUIDLow(),
            summoner->IsBeingTeleported(), player->IsBeingTeleported());
        return false;
    }

    if (summoner->IsInCombat() && !sPlayerbotAIConfig.allowSummonInCombat)
    {
        if (notifyPlayerResult)
            NotifySummonPlayer(bot, notifyPlayer, "Summon failed: you are in combat.");
        LOG_INFO("playerbots", "Summon failed (%s): summoner=%s (%u) bot=%s (%u) reason=summoner_in_combat", sourceTag,
            summoner->GetName(), summoner->GetGUIDLow(), player->GetName(), player->GetGUIDLow());
        return false;
    }

    if (!summoner->IsAlive() && !sPlayerbotAIConfig.allowSummonWhenMasterIsDead)
    {
        if (notifyPlayerResult)
            NotifySummonPlayer(bot, notifyPlayer, "Summon failed: you are dead.");
        LOG_INFO("playerbots", "Summon failed (%s): summoner=%s (%u) bot=%s (%u) reason=summoner_dead", sourceTag,
            summoner->GetName(), summoner->GetGUIDLow(), player->GetName(), player->GetGUIDLow());
        return false;
    }

    if (bot->isDead() && !bot->HasPlayerFlag(PLAYER_FLAGS_GHOST) && !sPlayerbotAIConfig.allowSummonWhenBotIsDead)
    {
        if (notifyPlayerResult)
            NotifySummonPlayer(bot, notifyPlayer, "Summon failed: I am dead and cannot be revived for summon.");
        LOG_INFO("playerbots", "Summon failed (%s): summoner=%s (%u) bot=%s (%u) reason=bot_dead", sourceTag,
            summoner->GetName(), summoner->GetGUIDLow(), player->GetName(), player->GetGUIDLow());
        return false;
    }

    bool revive =
        sPlayerbotAIConfig.reviveBotWhenSummoned == 2 ||
        (sPlayerbotAIConfig.reviveBotWhenSummoned == 1 && !summoner->IsInCombat() && summoner->IsAlive());

    if (bot->isDead() && revive)
    {
        bot->ResurrectPlayer(1.0f, false);
        bot->SpawnCorpseBones();
        if (notifyPlayerResult)
            NotifySummonPlayer(bot, notifyPlayer, "I live, again!");
        botAI->GetAiObjectContext()->GetValue<GuidVector>("prioritized targets")->Reset();
    }

    if (sPlayerbotAIConfig.botRepairWhenSummon)  // .conf option to repair bot gear when summoned 0 = off, 1 = on
        bot->DurabilityRepairAll(false, 1.0f);

    if (!preserveAuras)
        player->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_TELEPORTED | AURA_INTERRUPT_FLAG_CHANGE_MAP);

    float destX = summoner->GetPositionX();
    float destY = summoner->GetPositionY();
    float destZ = summoner->GetPositionZ();
    float destO = summoner->GetOrientation();
    bool usedFallback = false;

    if (!TeleportPlayerTo(summoner, player, destX, destY, destZ, destO))
    {
        float fallbackX = summoner->GetPositionX();
        float fallbackY = summoner->GetPositionY();
        float fallbackZ = summoner->GetPositionZ();
        float fallbackAngle = summoner->GetOrientation() + GetFollowAngle();
        summoner->GetNearPoint(player, fallbackX, fallbackY, fallbackZ, 0.0f, sPlayerbotAIConfig.followDistance,
                               fallbackAngle);

        if (!TeleportPlayerTo(summoner, player, fallbackX, fallbackY, fallbackZ, destO))
        {
            if (notifyPlayerResult)
                NotifySummonPlayer(bot, notifyPlayer, "Summon failed: no valid place to teleport.");
            LOG_INFO("playerbots",
                "Summon failed (%s): summoner=%s (%u) bot=%s (%u) reason=no_valid_placement map=%u exact=(%.2f, %.2f, %.2f) fallback=(%.2f, %.2f, %.2f)",
                sourceTag, summoner->GetName(), summoner->GetGUIDLow(), player->GetName(), player->GetGUIDLow(),
                summoner->GetMapId(), destX, destY, destZ, fallbackX, fallbackY, fallbackZ);
            return false;
        }

        destX = fallbackX;
        destY = fallbackY;
        destZ = fallbackZ;
        usedFallback = true;
    }

    player->GetMotionMaster()->Clear();
    AI_VALUE(LastMovement&, "last movement").clear();

    uint32 worldMask = summoner->GetWorldMask();
    player->SetWorldMask(worldMask);
    player->CallForAllControlledUnits([destX, destY, destZ, destO, worldMask](Unit* unit)
    {
        unit->SetWorldMask(worldMask);
        unit->NearTeleportTo(destX, destY, destZ, destO);
    }, CONTROLLED_PET | CONTROLLED_GUARDIANS | CONTROLLED_CHARM);
    if (botAI->HasStrategy("stay", botAI->GetState()))
    {
        PositionMap& posMap = AI_VALUE(PositionMap&, "position");
        PositionInfo stayPosition = posMap["stay"];

        stayPosition.Set(destX, destY, destZ, summoner->GetMapId());
        posMap["stay"] = stayPosition;
    }

    if (notifyPlayerResult)
        NotifySummonPlayer(bot, notifyPlayer, usedFallback ? "Summoned nearby." : "Summoned.");
    LOG_INFO("playerbots",
        "Summon succeeded (%s): summoner=%s (%u) bot=%s (%u) map=%u x=%.2f y=%.2f z=%.2f fallback=%u", sourceTag,
        summoner->GetName(), summoner->GetGUIDLow(), player->GetName(), player->GetGUIDLow(), summoner->GetMapId(),
        destX, destY, destZ, usedFallback);
    return true;
}
