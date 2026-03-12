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

bool UseMeetingStoneAction::Execute(Event event)
{
    Player* master = GetMaster();
    if (!master)
        return false;

    WorldPacket p(event.getPacket());
    p.rpos(0);
    ObjectGuid guid;
    p >> guid;

    if (master->GetTarget() && master->GetTarget() != bot->GetGUID())
        return false;

    if (!master->GetTarget() && master->GetGroup() != bot->GetGroup())
        return false;

    if (master->IsBeingTeleported())
        return false;

    if (bot->IsInCombat())
    {
        botAI->TellError("I am in combat");
        return false;
    }

    Map* map = master->GetMap();
    if (!map)
        return false;

    GameObject* gameObject = map->GetGameObject(guid);
    if (!gameObject)
        return false;

    GameObjectTemplate const* goInfo = gameObject->GetGOInfo();
    if (!goInfo || goInfo->entry != 179944)
        return false;

    return Teleport(master, bot, false);
}

bool SummonAction::Execute(Event event)
{
    Player* master = event.getOwner() ? event.getOwner() : GetMaster();
    if (!master)
        return false;

    if (bot->GetPet())
        botAI->PetFollow();

    AI_VALUE(std::list<FleeInfo>&, "recently flee info").clear();
    return Teleport(master, bot, true);
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
            return Teleport(summoner, player, preserveAuras);
    }

    botAI->TellError(summoner == bot ? "There is no meeting stone nearby" : "There is no meeting stone near you");
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
                botAI->TellError(player == bot ? "I have no hearthstone" : "You have no hearthstone");
                return false;
            }

            if (player->HasSpellCooldown(8690))
            {
                botAI->TellError(player == bot ? "My hearthstone is not ready" : "Your hearthstone is not ready");
                return false;
            }

            // Trigger cooldown
            SpellInfo const* spellInfo = sSpellMgr.GetSpellEntry(8690);
            if (!spellInfo)
                return false;

            Spell spell(player, spellInfo, TRIGGERED_NONE);
            spell.SendSpellCooldown();

            return Teleport(summoner, player, preserveAuras);
        }
    }

    botAI->TellError(summoner == bot ? "There are no innkeepers nearby" : "There are no innkeepers near you");
    return false;
}

bool SummonAction::Teleport(Player* summoner, Player* player, bool preserveAuras)
{
    if (!summoner || summoner == player)
        return false;

    if (player->GetVehicle())
    {
        botAI->TellError("You cannot summon me while I'm on a vehicle");
        return false;
    }

    if (summoner->IsBeingTeleported() || player->IsBeingTeleported())
        return false;

    if (summoner->IsInCombat() && !sPlayerbotAIConfig.allowSummonInCombat)
    {
        botAI->TellError("You cannot summon me while you're in combat");
        return false;
    }

    if (!summoner->IsAlive() && !sPlayerbotAIConfig.allowSummonWhenMasterIsDead)
    {
        botAI->TellError("You cannot summon me while you're dead");
        return false;
    }

    if (bot->isDead() && !bot->HasPlayerFlag(PLAYER_FLAGS_GHOST) && !sPlayerbotAIConfig.allowSummonWhenBotIsDead)
    {
        botAI->TellError("You cannot summon me while I'm dead, you need to release my spirit first");
        return false;
    }

    bool revive =
        sPlayerbotAIConfig.reviveBotWhenSummoned == 2 ||
        (sPlayerbotAIConfig.reviveBotWhenSummoned == 1 && !summoner->IsInCombat() && summoner->IsAlive());

    if (bot->isDead() && revive)
    {
        bot->ResurrectPlayer(1.0f, false);
        bot->SpawnCorpseBones();
        botAI->TellMasterNoFacing("I live, again!");
        botAI->GetAiObjectContext()->GetValue<GuidVector>("prioritized targets")->Reset();
    }

    float x = summoner->GetPositionX();
    float y = summoner->GetPositionY();
    float z = summoner->GetPositionZ();
    float angle = summoner->GetOrientation() + GetFollowAngle();
    summoner->GetNearPoint(player, x, y, z, 0.0f, sPlayerbotAIConfig.followDistance, angle);

    if (sPlayerbotAIConfig.botRepairWhenSummon)  // .conf option to repair bot gear when summoned 0 = off, 1 = on
        bot->DurabilityRepairAll(false, 1.0f, false);

    if (!preserveAuras)
        player->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_TELEPORTED | AURA_INTERRUPT_FLAG_CHANGE_MAP);

    if (!player->TeleportTo(summoner->GetMapId(), x, y, z, summoner->GetOrientation()))
    {
        if (summoner != player)
            botAI->TellError("Not enough place to summon");
        return false;
    }

    player->GetMotionMaster()->Clear();
    AI_VALUE(LastMovement&, "last movement").clear();

    if (player->GetPet())
        player->GetPet()->NearTeleportTo(x, y, z, summoner->GetOrientation());
    if (player->GetGuardianPet())
        player->GetGuardianPet()->NearTeleportTo(x, y, z, summoner->GetOrientation());
    if (botAI->HasStrategy("stay", botAI->GetState()))
    {
        PositionMap& posMap = AI_VALUE(PositionMap&, "position");
        PositionInfo stayPosition = posMap["stay"];

        stayPosition.Set(x, y, z, summoner->GetMapId());
        posMap["stay"] = stayPosition;
    }

    return true;
}
