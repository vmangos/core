#include "NewRpgBaseAction.h"

#include <algorithm>
#include <cmath>

#include "BroadcastHelper.h"
#include "ChatHelper.h"
#include "Creature.h"
#include "FlightMasterCache.h"
#include "G3D/Vector2.h"
#include "GameObject.h"
#include "GossipDef.h"
#include "GridTerrainData.h"
#include "IVMapMgr.h"
#include "NewRpgInfo.h"
#include "NewRpgStrategy.h"
#include "Object.h"
#include "ObjectAccessor.h"
#include "ObjectDefines.h"
#include "ObjectGuid.h"
#include "ObjectMgr.h"
#include "PathGenerator.h"
#include "Player.h"
#include "PlayerbotAI.h"
#include "PlayerbotAIConfig.h"
#include "Playerbots.h"
#include "Position.h"
#include "QuestDef.h"
#include "Random.h"
#include "RandomPlayerbotMgr.h"
#include "SharedDefines.h"
#include "StatsWeightCalculator.h"
#include "Timer.h"
#include "TravelMgr.h"

bool NewRpgBaseAction::MoveFarTo(WorldPosition dest)
{
    if (dest == WorldPosition())
        return false;

    if (dest != botAI->rpgInfo.moveFarPos)
    {
        // clear stuck information if it's a new dest
        botAI->rpgInfo.SetMoveFarTo(dest);
    }

    // performance optimization
    if (IsWaitingForLastMove(MovementPriority::MOVEMENT_NORMAL))
    {
        return false;
    }

    // stuck check
    float disToDest = bot->GetDistance(dest);
    if (disToDest + 1.0f < botAI->rpgInfo.nearestMoveFarDis)
    {
        botAI->rpgInfo.nearestMoveFarDis = disToDest;
        botAI->rpgInfo.stuckTs = getMSTime();
        botAI->rpgInfo.stuckAttempts = 0;
    }
    else if (++botAI->rpgInfo.stuckAttempts >= 10 && GetMSTimeDiffToNow(botAI->rpgInfo.stuckTs) >= stuckTime)
    {
        // Unfortunately we've been stuck here for over 5 mins, fallback to teleporting directly to the destination
        botAI->rpgInfo.stuckTs = getMSTime();
        botAI->rpgInfo.stuckAttempts = 0;
        const AreaTableEntry* entry = sAreaTableStore.LookupEntry(bot->GetZoneId());
        std::string zone_name = PlayerbotAI::GetLocalizedAreaName(entry);
        LOG_DEBUG(
            "playerbots",
            "[New RPG] Teleport {} from ({},{},{},{}) to ({},{},{},{}) as it stuck when moving far - Zone: {} ({})",
            bot->GetName(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ(), bot->GetMapId(),
            dest.GetPositionX(), dest.GetPositionY(), dest.GetPositionZ(), dest.getMapId(), bot->GetZoneId(),
            zone_name.c_str());
        bot->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_TELEPORTED | AURA_INTERRUPT_FLAG_CHANGE_MAP);
        return bot->TeleportTo(dest);
    }

    float dis = bot->GetExactDist(dest);
    if (dis < pathFinderDis)
    {
        return MoveTo(dest.getMapId(), dest.GetPositionX(), dest.GetPositionY(), dest.GetPositionZ(), false, false,
                      false, true);
    }

    float minDelta = M_PI;
    const float x = bot->GetPositionX();
    const float y = bot->GetPositionY();
    const float z = bot->GetPositionZ();
    float rx, ry, rz;
    bool found = false;
    int attempt = 3;
    while (attempt--)
    {
        float angle = bot->GetAngle(dest.GetPositionX(), dest.GetPositionY());
        float delta = urand(1, 100) <= 75 ? (rand_norm() - 0.5) * M_PI * 0.5 : (rand_norm() - 0.5) * M_PI * 2;
        angle += delta;
        float dis = rand_norm() * pathFinderDis;
        float dx = x + cos(angle) * dis;
        float dy = y + sin(angle) * dis;
        float dz = z + 0.5f;
        PathGenerator path(bot);
        path.CalculatePath(dx, dy, dz);
        PathType type = path.GetPathType();
        uint32 typeOk = PATHFIND_NORMAL | PATHFIND_INCOMPLETE | PATHFIND_FARFROMPOLY;
        bool canReach = !(type & (~typeOk));

        if (canReach && fabs(delta) <= minDelta)
        {
            found = true;
            const G3D::Vector3& endPos = path.GetActualEndPosition();
            rx = endPos.x;
            ry = endPos.y;
            rz = endPos.z;
            minDelta = fabs(delta);
        }
    }
    if (found)
    {
        return MoveTo(bot->GetMapId(), rx, ry, rz, false, false, false, true);
    }
    return false;
}

bool NewRpgBaseAction::MoveWorldObjectTo(ObjectGuid guid, float distance)
{
    if (IsWaitingForLastMove(MovementPriority::MOVEMENT_NORMAL))
    {
        return false;
    }

    WorldObject* object = botAI->GetWorldObject(guid);
    if (!object)
        return false;
    float x = object->GetPositionX();
    float y = object->GetPositionY();
    float z = object->GetPositionZ();
    float mapId = object->GetMapId();
    float angle = 0.f;

    if (!object->ToUnit() || !object->ToUnit()->isMoving())
        angle = object->GetAngle(bot) + (M_PI * irand(-25, 25) / 100.0);  // Closest 45 degrees towards the target
    else
        angle = object->GetOrientation() +
                (M_PI * irand(-25, 25) / 100.0);  // 45 degrees infront of target (leading it's movement)

    float rnd = rand_norm();
    x += cos(angle) * distance * rnd;
    y += sin(angle) * distance * rnd;
    if (!object->GetMap()->CheckCollisionAndGetValidCoords(object, object->GetPositionX(), object->GetPositionY(),
                                                           object->GetPositionZ(), x, y, z))
    {
        x = object->GetPositionX();
        y = object->GetPositionY();
        z = object->GetPositionZ();
    }
    return MoveTo(mapId, x, y, z, false, false, false, true);
}

bool NewRpgBaseAction::MoveRandomNear(float moveStep, MovementPriority priority)
{
    if (IsWaitingForLastMove(priority))
    {
        return false;
    }

    float distance = rand_norm() * moveStep;
    Map* map = bot->GetMap();
    const float x = bot->GetPositionX();
    const float y = bot->GetPositionY();
    const float z = bot->GetPositionZ();
    int attempts = 1;
    while (attempts--)
    {
        float angle = (float)rand_norm() * 2 * static_cast<float>(M_PI);
        float dx = x + distance * cos(angle);
        float dy = y + distance * sin(angle);
        float dz = z;

        PathGenerator path(bot);
        path.CalculatePath(dx, dy, dz);
        PathType type = path.GetPathType();
        uint32 typeOk = PATHFIND_NORMAL | PATHFIND_INCOMPLETE | PATHFIND_FARFROMPOLY;
        bool canReach = !(type & (~typeOk));

        if (!canReach)
            continue;

        if (!map->CheckCollisionAndGetValidCoords(bot, dx, dy, dz))
            continue;

        if (map->IsInWater(PHASEMASK_NORMAL, dx, dy, dz, bot->GetCollisionHeight()))
            continue;

        bool moved = MoveTo(bot->GetMapId(), dx, dy, dz, false, false, false, true, priority);
        if (moved)
            return true;
    }

    return false;
}

bool NewRpgBaseAction::ForceToWait(uint32 duration, MovementPriority priority)
{
    AI_VALUE(LastMovement&, "last movement")
        .Set(bot->GetMapId(), bot->GetPositionX(), bot->GetPositionY(), bot->GetPositionZ(), bot->GetOrientation(),
             duration, priority);
    return true;
}

/// @TODO: Fix redundant code
/// Quest related method refer to TalkToQuestGiverAction.h
bool NewRpgBaseAction::InteractWithNpcOrGameObjectForQuest(ObjectGuid guid)
{
    Player* viewer = botAI->GetActiveMaster() ? botAI->GetActiveMaster() : botAI->GetMaster();
    WorldObject* object = bot->GetMap()->GetWorldObject(guid);
    if (!object || !bot->CanInteractWithQuestGiver(object))
        return false;

    // Creature* creature = bot->GetNPCIfCanInteractWith(guid, UNIT_NPC_FLAG_NONE);
    // if (creature)
    // {
    //     WorldPacket packet(CMSG_GOSSIP_HELLO);
    //     packet << guid;
    //     bot->GetSession()->HandleGossipHelloOpcode(packet);
    // }

    bot->PrepareQuestMenu(guid);
    QuestMenu& menu = bot->PlayerTalkClass->GetQuestMenu();
    if (menu.Empty())
        return true;

    for (uint8 idx = 0; idx < menu.GetMenuItemCount(); idx++)
    {
        const QuestMenuItem& item = menu.GetItem(idx);
        const Quest* quest = sObjectMgr.GetQuestTemplate(item.QuestId);
        if (!quest)
            continue;

        const QuestStatus& status = bot->GetQuestStatus(item.QuestId);
        if (status == QUEST_STATUS_NONE && bot->CanTakeQuest(quest, false) && bot->CanAddQuest(quest, false) &&
            IsQuestWorthDoing(quest) && IsQuestCapableDoing(quest) && QuestFitsPopulationPlan(quest) &&
            botAI->lowPriorityQuest.find(item.QuestId) == botAI->lowPriorityQuest.end())
        {
            AcceptQuest(quest, guid);
            if (botAI->GetMaster())
                botAI->TellMasterNoFacing("Quest accepted " + ChatHelper::FormatQuest(quest, viewer));
            BroadcastHelper::BroadcastQuestAccepted(botAI, bot, quest);
            botAI->rpgStatistic.questAccepted++;
            LOG_DEBUG("playerbots", "[New RPG] %s accept quest %u", bot->GetName(), quest->GetQuestId());
        }
        if (status == QUEST_STATUS_COMPLETE && bot->CanRewardQuest(quest, 0, false))
        {
            TurnInQuest(quest, guid);
            if (botAI->GetMaster())
                botAI->TellMasterNoFacing("Quest rewarded " + ChatHelper::FormatQuest(quest, viewer));
            BroadcastHelper::BroadcastQuestTurnedIn(botAI, bot, quest);
            botAI->rpgStatistic.questRewarded++;
            LOG_DEBUG("playerbots", "[New RPG] %s turned in quest %u", bot->GetName(), quest->GetQuestId());
        }
    }
    return true;
}

bool NewRpgBaseAction::CanInteractWithQuestGiver(Object* questGiver)
{
    // This is a variant of Player::CanInteractWithQuestGiver
    // that removes the distance check and keeps all other checks
    switch (questGiver->GetTypeId())
    {
        case TYPEID_UNIT:
        {
            ObjectGuid guid = questGiver->GetGUID();
            uint32 npcflagmask = UNIT_NPC_FLAG_QUESTGIVER;
            // unit checks
            if (!guid)
                return false;

            if (!bot->IsInWorld() || bot->IsDuringRemoveFromWorld())
                return false;

            if (bot->IsInFlight())
                return false;

            // exist (we need look pets also for some interaction (quest/etc)
            Creature* creature = bot->GetMap()->GetAnyTypeCreature(guid);
            if (!creature)
                return false;

            // Deathstate checks
            if (!bot->IsAlive() &&
                !(creature->GetCreatureInfo()->GetTypeFlags() & CREATURE_TYPEFLAGS_VISIBLE_TO_GHOSTS))
                return false;

            // alive or spirit healer
            if (!creature->IsAlive() &&
                !(creature->GetCreatureInfo()->GetTypeFlags() & CREATURE_TYPE_FLAG_INTERACT_WHILE_DEAD))
                return false;

            // appropriate npc type
            if (npcflagmask && !creature->HasFlag(UNIT_NPC_FLAGS, NPCFlags(npcflagmask)))
                return false;

            // not allow interaction under control, but allow with own pets
            if (creature->GetCharmerGUID())
                return false;

            // xinef: perform better check
            if (creature->GetReactionTo(bot) <= REP_UNFRIENDLY)
                return false;

            // vMaNGOS trainer check
            if (npcflagmask & UNIT_NPC_FLAG_TRAINER)
            {
                // vMaNGOS doesn't have Trainer class - check trainer type via CreatureInfo
                if (creature->GetCreatureInfo()->trainer_type == TRAINER_TYPE_CLASS &&
                    creature->GetCreatureInfo()->trainer_class != bot->GetClass())
                    return false;
            }

            return true;
        }
        case TYPEID_GAMEOBJECT:
        {
            ObjectGuid guid = questGiver->GetGUID();
            GameobjectTypes type = GAMEOBJECT_TYPE_QUESTGIVER;
            if (GameObject* go = bot->GetMap()->GetGameObject(guid))
            {
                if (go->GetGoType() == type)
                {
                    // Players cannot interact with gameobjects that use the "Point" icon
                    if (go->GetGOInfo()->icon == "Point")
                    {
                        return false;
                    }

                    return true;
                }
            }
            return false;
        }
        // unused for now
        // case TYPEID_PLAYER:
        //     return bot->IsAlive() && questGiver->ToPlayer()->IsAlive();
        // case TYPEID_ITEM:
        //     return bot->IsAlive();
        default:
            break;
    }
    return false;
}

bool NewRpgBaseAction::IsWithinInteractionDist(Object* questGiver)
{
    // This is a variant of Player::CanInteractWithQuestGiver
    // that only keep the distance check
    switch (questGiver->GetTypeId())
    {
        case TYPEID_UNIT:
        {
            ObjectGuid guid = questGiver->GetGUID();
            // unit checks
            if (!guid)
                return false;

            // exist (we need look pets also for some interaction (quest/etc)
            Creature* creature = bot->GetMap()->GetAnyTypeCreature(guid);
            if (!creature)
                return false;

            if (!creature->IsWithinDistInMap(bot, INTERACTION_DISTANCE))
                return false;

            return true;
        }
        case TYPEID_GAMEOBJECT:
        {
            ObjectGuid guid = questGiver->GetGUID();
            GameobjectTypes type = GAMEOBJECT_TYPE_QUESTGIVER;
            if (GameObject* go = bot->GetMap()->GetGameObject(guid))
            {
                if (go->IsWithinDistInMap(bot, INTERACTION_DISTANCE))
                {
                    return true;
                }
            }
            return false;
        }
        // case TYPEID_PLAYER:
        //     return bot->IsAlive() && questGiver->ToPlayer()->IsAlive();
        // case TYPEID_ITEM:
        //     return bot->IsAlive();
        default:
            break;
    }
    return false;
}

bool NewRpgBaseAction::AcceptQuest(Quest const* quest, ObjectGuid guid)
{
    WorldPacket p(CMSG_QUESTGIVER_ACCEPT_QUEST);
    uint32 unk1 = 0;
    p << guid << quest->GetQuestId() << unk1;
    p.rpos(0);
    bot->GetSession()->HandleQuestgiverAcceptQuestOpcode(p);

    return true;
}

bool NewRpgBaseAction::TurnInQuest(Quest const* quest, ObjectGuid guid)
{
    uint32 questID = quest->GetQuestId();

    if (bot->GetQuestRewardStatus(questID))
    {
        return false;
    }

    if (!bot->CanRewardQuest(quest, false))
    {
        return false;
    }

    bot->PlayDistanceSound(621);

    WorldPacket p(CMSG_QUESTGIVER_CHOOSE_REWARD);
    p << guid << quest->GetQuestId();
    if (quest->GetRewChoiceItemsCount() <= 1)
    {
        p << 0;
        bot->GetSession()->HandleQuestgiverChooseRewardOpcode(p);
    }
    else
    {
        uint32 bestId = BestRewardIndex(quest);
        p << bestId;
        bot->GetSession()->HandleQuestgiverChooseRewardOpcode(p);
    }

    return true;
}

bool NewRpgBaseAction::QuestFitsPopulationPlan(Quest const* quest)
{
    return sRandomPlayerbotMgr.IsQuestInPopulationPlan(bot, quest);
}

bool NewRpgBaseAction::DropQuestFromLog(uint16 slot, Quest const* quest, Player* viewer)
{
    if (!quest)
        return false;

    LOG_DEBUG("playerbots", "[New RPG] %s drop quest %u", bot->GetName(), quest->GetQuestId());
    WorldPacket packet(CMSG_QUESTLOG_REMOVE_QUEST);
    packet << static_cast<uint8>(slot);
    bot->GetSession()->HandleQuestLogRemoveQuest(packet);
    if (botAI->GetMaster())
        botAI->TellMasterNoFacing("Quest dropped " + ChatHelper::FormatQuest(quest, viewer));
    botAI->rpgStatistic.questDropped++;
    return true;
}

uint32 NewRpgBaseAction::BestRewardIndex(Quest const* quest)
{
    ItemIds returnIds;
    ItemUsage bestUsage = ITEM_USAGE_NONE;
    if (quest->GetRewChoiceItemsCount() <= 1)
        return 0;
    else
    {
        for (uint8 i = 0; i < quest->GetRewChoiceItemsCount(); ++i)
        {
            ItemUsage usage = AI_VALUE2(ItemUsage, "item usage", quest->RewardChoiceItemId[i]);
            if (usage == ITEM_USAGE_EQUIP || usage == ITEM_USAGE_REPLACE)
                bestUsage = ITEM_USAGE_EQUIP;
            else if (usage == ITEM_USAGE_BAD_EQUIP && bestUsage != ITEM_USAGE_EQUIP)
                bestUsage = usage;
            else if (usage != ITEM_USAGE_NONE && bestUsage == ITEM_USAGE_NONE)
                bestUsage = usage;
        }
        StatsWeightCalculator calc(bot);
        uint32 best = 0;
        float bestScore = 0;
        for (uint8 i = 0; i < quest->GetRewChoiceItemsCount(); ++i)
        {
            ItemUsage usage = AI_VALUE2(ItemUsage, "item usage", quest->RewardChoiceItemId[i]);
            if (usage == bestUsage || usage == ITEM_USAGE_REPLACE)
            {
                float score = calc.CalculateItem(quest->RewardChoiceItemId[i]);
                if (score > bestScore)
                {
                    bestScore = score;
                    best = i;
                }
            }
        }
        return best;
    }
}

bool NewRpgBaseAction::IsQuestWorthDoing(Quest const* quest)
{
    bool isLowLevelQuest =
        bot->GetLevel() > (quest->GetQuestLevel() + sWorld.getConfig(CONFIG_INT32_QUEST_LOW_LEVEL_HIDE_DIFF));

    if (isLowLevelQuest)
        return false;

    if (quest->IsRepeatable())
        return false;

    return true;
}

bool NewRpgBaseAction::IsQuestCapableDoing(Quest const* quest)
{
    bool highLevelQuest = bot->GetLevel() + 3 < quest->GetQuestLevel();
    if (highLevelQuest)
        return false;

    // Elite quest and dungeon quest etc
    if (quest->GetType() != 0)
        return false;

    // now we only capable of doing solo quests
    if (quest->GetSuggestedPlayers() >= 2)
        return false;

    return true;
}

bool NewRpgBaseAction::OrganizeQuestLog()
{
    Player* viewer = botAI->GetActiveMaster() ? botAI->GetActiveMaster() : botAI->GetMaster();
    int32 freeSlotNum = 0;

    for (uint16 i = 0; i < MAX_QUEST_LOG_SIZE; ++i)
    {
        uint32 questId = bot->GetQuestSlotQuestId(i);
        if (!questId)
            freeSlotNum++;
    }

    int32 dropped = 0;
    // Always prune quests that no longer fit the assigned population plan.
    for (uint16 i = 0; i < MAX_QUEST_LOG_SIZE; ++i)
    {
        uint32 questId = bot->GetQuestSlotQuestId(i);
        if (!questId)
            continue;

        const Quest* quest = sObjectMgr.GetQuestTemplate(questId);
        if (!quest || !QuestFitsPopulationPlan(quest) || !IsQuestWorthDoing(quest) || !IsQuestCapableDoing(quest) ||
            bot->GetQuestStatus(questId) == QUEST_STATUS_FAILED)
        {
            dropped += DropQuestFromLog(i, quest, viewer) ? 1 : 0;
        }
    }

    if (freeSlotNum >= 2)
        return dropped > 0;

    // drop more than 8 quests at once to avoid repeated accept and drop
    if (dropped >= 8)
        return true;

    // remove quest categories that are poor fits for autonomous world questing.
    for (uint16 i = 0; i < MAX_QUEST_LOG_SIZE; ++i)
    {
        uint32 questId = bot->GetQuestSlotQuestId(i);
        if (!questId)
            continue;

        const Quest* quest = sObjectMgr.GetQuestTemplate(questId);
        if (quest->GetZoneOrSort() < 0)
        {
            dropped += DropQuestFromLog(i, quest, viewer) ? 1 : 0;
        }
    }

    if (dropped >= 8)
        return true;

    return dropped > 0;
}

bool NewRpgBaseAction::SearchQuestGiverAndAcceptOrReward()
{
    OrganizeQuestLog();
    if (ObjectGuid npcOrGo = ChooseNpcOrGameObjectToInteract(true, 80.0f))
    {
        if (sPlayerbotAIConfig.debugRandomBotQuesting)
            LOG_DEBUG("playerbots", "[New RPG] %s nearby quest target %u", bot->GetName(), npcOrGo.GetCounter());

        WorldObject* object = bot->GetMap()->GetWorldObject(npcOrGo);
        if (bot->CanInteractWithQuestGiver(object))
        {
            InteractWithNpcOrGameObjectForQuest(npcOrGo);
            ForceToWait(5000);
            return true;
        }
        return MoveWorldObjectTo(npcOrGo);
    }
    return false;
}

namespace
{
float GetQuestLevelFitScore(Player* bot, Quest const* quest)
{
    if (!bot || !quest)
        return -1000.0f;

    int32 questLevel = quest->GetQuestLevel();
    if (questLevel <= 0)
        questLevel = bot->GetLevel();

    return std::max(0.0f, 20.0f - std::fabs(float(bot->GetLevel()) - float(questLevel)));
}

float GetQuestObjectScore(Player* bot, WorldObject* object)
{
    if (!bot || !object)
        return -1.0f;

    bot->PrepareQuestMenu(object->GetGUID());
    QuestMenu& menu = bot->PlayerTalkClass->GetQuestMenu();
    if (menu.Empty())
        return -1.0f;

    float bestScore = -1.0f;
    uint32 zoneId = bot->GetZoneId();

    for (uint8 idx = 0; idx < menu.GetMenuItemCount(); ++idx)
    {
        QuestMenuItem const& item = menu.GetItem(idx);
        Quest const* quest = sObjectMgr.GetQuestTemplate(item.QuestId);
        if (!quest)
            continue;

        float score = -1.0f;
        QuestStatus status = bot->GetQuestStatus(item.QuestId);
        if (status == QUEST_STATUS_COMPLETE && bot->CanRewardQuest(quest, 0, false))
            score = 100.0f + GetQuestLevelFitScore(bot, quest);
        else if (status == QUEST_STATUS_NONE && bot->CanTakeQuest(quest, false) && bot->CanAddQuest(quest, false))
        {
            score = 40.0f + GetQuestLevelFitScore(bot, quest);
            if (sRandomPlayerbotMgr.IsQuestInPopulationPlan(bot, quest))
                score += 18.0f;
            else
                score -= 25.0f;

            if (quest->GetZoneOrSort() > 0 && uint32(quest->GetZoneOrSort()) == zoneId)
                score += 10.0f;
            else if (quest->GetZoneOrSort() > 0)
                score -= 3.0f;

            score += float((bot->GetGUIDLow() + item.QuestId) % 7) * 0.15f;
        }

        if (score < 0.0f)
            continue;

        score -= std::min(30.0f, bot->GetExactDist(object) / 10.0f);
        bestScore = std::max(bestScore, score);
    }

    return bestScore;
}
}

ObjectGuid NewRpgBaseAction::ChooseNpcOrGameObjectToInteract(bool questgiverOnly, float distanceLimit)
{
    GuidVector possibleTargets = AI_VALUE(GuidVector, "possible new rpg targets");
    GuidVector possibleGameObjects = AI_VALUE(GuidVector, "possible new rpg game objects");

    if (possibleTargets.empty() && possibleGameObjects.empty())
        return ObjectGuid();

    WorldObject* nearestObject = nullptr;
    float bestQuestScore = -1.0f;
    for (ObjectGuid& guid : possibleTargets)
    {
        WorldObject* object = bot->GetMap()->GetWorldObject(guid);

        if (!object || !object->IsInWorld())
            continue;

        if (distanceLimit && bot->GetDistance(object) > distanceLimit)
            continue;

        if (CanInteractWithQuestGiver(object) && HasQuestToAcceptOrReward(object))
        {
            float score = GetQuestObjectScore(bot, object);
            if (score > bestQuestScore)
            {
                bestQuestScore = score;
                nearestObject = object;
            }
        }
    }

    for (ObjectGuid& guid : possibleGameObjects)
    {
        WorldObject* object = bot->GetMap()->GetWorldObject(guid);

        if (!object || !object->IsInWorld())
            continue;

        if (distanceLimit && bot->GetDistance(object) > distanceLimit)
            continue;

        if (CanInteractWithQuestGiver(object) && HasQuestToAcceptOrReward(object))
        {
            float score = GetQuestObjectScore(bot, object);
            if (score > bestQuestScore)
            {
                bestQuestScore = score;
                nearestObject = object;
            }
        }
    }

    if (nearestObject)
    {
        if (sPlayerbotAIConfig.debugRandomBotQuesting)
            LOG_DEBUG("playerbots", "[New RPG] %s selected quest object %u score %.2f", bot->GetName(), nearestObject->GetObjectGuid().GetCounter(), bestQuestScore);
        return nearestObject->GetObjectGuid();
    }

    // No questgiver to accept or reward
    if (questgiverOnly)
        return ObjectGuid();

    std::string role = sRandomPlayerbotMgr.GetData(bot->GetGUIDLow(), "population_role");
    uint32 lastNpcStamp = sRandomPlayerbotMgr.GetValue(bot->GetGUIDLow(), "last_rpg_npc");
    uint32 lastNpcCounter = static_cast<uint32>(std::strtoul(sRandomPlayerbotMgr.GetData(bot->GetGUIDLow(), "last_rpg_npc").c_str(), nullptr, 10));
    ObjectGuid bestGuid;
    float bestScore = -1.0f;
    uint32 now = getMSTime() / IN_MILLISECONDS;

    auto scoreObject = [&](WorldObject* object) -> float
    {
        if (!object || !object->IsInWorld())
            return -1.0f;

        float score = 0.10f;
        if (Creature* creature = object->ToCreature())
        {
            uint32 flags = creature->GetUInt32Value(UNIT_NPC_FLAGS);
            bool cityRole = role == "reserve_city";
            bool starterRole = role == "reserve_starter";

            if (flags & UNIT_NPC_FLAG_QUESTGIVER)
                score = 1.00f;
            else if (flags & (UNIT_NPC_FLAG_TRAINER | UNIT_NPC_FLAG_TRAINER_CLASS | UNIT_NPC_FLAG_TRAINER_PROFESSION))
                score = 0.92f;
            else if (flags & UNIT_NPC_FLAG_FLIGHTMASTER)
                score = 0.88f;
            else if (flags & (UNIT_NPC_FLAG_VENDOR | UNIT_NPC_FLAG_REPAIR))
                score = 0.72f;
            else if (flags & UNIT_NPC_FLAG_AUCTIONEER)
                score = cityRole ? 0.85f : 0.40f;
            else if (flags & (UNIT_NPC_FLAG_BANKER | UNIT_NPC_FLAG_GUILD_BANKER))
                score = cityRole ? 0.75f : (starterRole ? 0.40f : 0.18f);
            else if (flags & UNIT_NPC_FLAG_INNKEEPER)
                score = cityRole ? 0.68f : (starterRole ? 0.35f : 0.15f);
            else if (flags & UNIT_NPC_FLAG_GOSSIP)
                score = 0.35f;
        }
        else if (object->ToGameObject())
        {
            score = 0.60f;
        }

        float distance = std::max(1.0f, bot->GetExactDist(object));
        score += std::max(0.0f, 0.25f - (distance / 600.0f));

        if (lastNpcCounter && object->GetObjectGuid().GetCounter() == lastNpcCounter && lastNpcStamp &&
            now < lastNpcStamp + 60)
        {
            score *= 0.20f;
        }

        return score;
    };

    for (ObjectGuid const& guid : possibleTargets)
    {
        WorldObject* object = bot->GetMap()->GetWorldObject(guid);
        if (!object || (distanceLimit && bot->GetDistance(object) > distanceLimit))
            continue;

        float score = scoreObject(object);
        if (score > bestScore)
        {
            bestScore = score;
            bestGuid = guid;
        }
    }

    for (ObjectGuid const& guid : possibleGameObjects)
    {
        WorldObject* object = bot->GetMap()->GetWorldObject(guid);
        if (!object || (distanceLimit && bot->GetDistance(object) > distanceLimit))
            continue;

        float score = scoreObject(object);
        if (score > bestScore)
        {
            bestScore = score;
            bestGuid = guid;
        }
    }

    return bestGuid;
}

bool NewRpgBaseAction::HasQuestToAcceptOrReward(WorldObject* object)
{
    ObjectGuid guid = object->GetGUID();
    bot->PrepareQuestMenu(guid);
    QuestMenu& menu = bot->PlayerTalkClass->GetQuestMenu();
    if (menu.Empty())
        return false;

    for (uint8 idx = 0; idx < menu.GetMenuItemCount(); idx++)
    {
        const QuestMenuItem& item = menu.GetItem(idx);
        const Quest* quest = sObjectMgr.GetQuestTemplate(item.QuestId);
        if (!quest)
            continue;
        const QuestStatus& status = bot->GetQuestStatus(item.QuestId);
        if (status == QUEST_STATUS_COMPLETE && bot->CanRewardQuest(quest, 0, false))
        {
            return true;
        }
    }
    for (uint8 idx = 0; idx < menu.GetMenuItemCount(); idx++)
    {
        const QuestMenuItem& item = menu.GetItem(idx);
        const Quest* quest = sObjectMgr.GetQuestTemplate(item.QuestId);
        if (!quest)
            continue;

        const QuestStatus& status = bot->GetQuestStatus(item.QuestId);
        if (status == QUEST_STATUS_NONE && bot->CanTakeQuest(quest, false) && bot->CanAddQuest(quest, false) &&
            IsQuestWorthDoing(quest) && IsQuestCapableDoing(quest) && QuestFitsPopulationPlan(quest) &&
            botAI->lowPriorityQuest.find(item.QuestId) == botAI->lowPriorityQuest.end())
        {
            return true;
        }
    }
    return false;
}

static std::vector<float> GenerateRandomWeights(int n)
{
    std::vector<float> weights(n);
    float sum = 0.0;

    for (int i = 0; i < n; ++i)
    {
        weights[i] = rand_norm();
        sum += weights[i];
    }
    for (int i = 0; i < n; ++i)
    {
        weights[i] /= sum;
    }
    return weights;
}

bool NewRpgBaseAction::GetQuestPOIPosAndObjectiveIdx(uint32 questId, std::vector<POIInfo>& poiInfo, bool toComplete)
{
    poiInfo.clear();

    auto itr = TravelMgr::instance().quests.find(questId);
    if (itr == TravelMgr::instance().quests.end() || !itr->second)
    {
        if (sPlayerbotAIConfig.debugRandomBotQuesting)
            LOG_DEBUG("playerbots", "[New RPG] %s no quest container for quest %u", bot->GetName(), questId);
        return false;
    }

    auto collect = [&](std::vector<QuestTravelDestination*> const& destinations)
    {
        for (QuestTravelDestination* destination : destinations)
        {
            if (!destination || !destination->isActive(bot))
                continue;

            if (!sRandomPlayerbotMgr.IsTravelDestinationInPopulationPlan(bot, destination))
                continue;

            int32 objectiveIdx = -1;
            if (QuestObjectiveTravelDestination* objectiveDestination = dynamic_cast<QuestObjectiveTravelDestination*>(destination))
                objectiveIdx = static_cast<int32>(objectiveDestination->GetObjective());

            for (WorldPosition* point : destination->getPoints(true))
            {
                if (!point)
                    continue;

                poiInfo.push_back({*point, objectiveIdx});
            }
        }
    };

    QuestContainer* container = itr->second;
    collect(toComplete ? container->questTakers : container->questObjectives);

    if (poiInfo.empty())
    {
        if (sPlayerbotAIConfig.debugRandomBotQuesting)
            LOG_DEBUG("playerbots", "[New RPG] %s no active POIs for quest %u (%s)", bot->GetName(), questId, toComplete ? "turn-in" : "objective");
        return false;
    }

    std::sort(poiInfo.begin(), poiInfo.end(), [this](POIInfo left, POIInfo right) {
        bool leftSameMap = left.pos.getMapId() == bot->GetMapId();
        bool rightSameMap = right.pos.getMapId() == bot->GetMapId();
        if (leftSameMap != rightSameMap)
            return leftSameMap;
        return left.pos.distance(bot) < right.pos.distance(bot);
    });

    if (sPlayerbotAIConfig.debugRandomBotQuesting)
        LOG_DEBUG("playerbots", "[New RPG] %s quest %u (%s) collected %zu POIs, best map=%u objective=%d distance=%.1f",
            bot->GetName(), questId, toComplete ? "turn-in" : "objective", poiInfo.size(), poiInfo.front().pos.getMapId(),
            poiInfo.front().objectiveIdx, poiInfo.front().pos.distance(bot));

    return true;
}

WorldPosition NewRpgBaseAction::SelectRandomGrindPos(Player* bot)
{
    const std::vector<WorldLocation>& locs = sRandomPlayerbotMgr.locsPerLevelCache[bot->GetLevel()];
    float hiRange = 500.0f;
    float loRange = 2500.0f;
    if (bot->GetLevel() < 5)
    {
        hiRange /= 3;
        loRange /= 3;
    }
    std::vector<WorldLocation> lo_prepared_locs, hi_prepared_locs;

    bool inCity = false;
    if (AreaTableEntry const* zone = sAreaTableStore.LookupEntry(bot->GetZoneId()))
    {
        if (zone->flags & AREA_FLAG_CAPITAL)
            inCity = true;
    }

    for (auto& loc : locs)
    {
        if (bot->GetMapId() != loc.GetMapId())
            continue;

        if (bot->GetExactDist(loc) > 2500.0f)
            continue;

        if (!inCity && sTerrainMgr.GetZoneId(bot->GetMapId(), loc.GetPositionX(), loc.GetPositionY(),
                                                loc.GetPositionZ()) != bot->GetZoneId())
            continue;

        if (bot->GetExactDist(loc) < hiRange)
        {
            hi_prepared_locs.push_back(loc);
        }

        if (bot->GetExactDist(loc) < loRange)
        {
            lo_prepared_locs.push_back(loc);
        }
    }
    WorldPosition dest{};
    if (urand(1, 100) <= 50 && !hi_prepared_locs.empty())
    {
        uint32 idx = urand(0, hi_prepared_locs.size() - 1);
        dest = hi_prepared_locs[idx];
    }
    else if (!lo_prepared_locs.empty())
    {
        uint32 idx = urand(0, lo_prepared_locs.size() - 1);
        dest = lo_prepared_locs[idx];
    }
    LOG_DEBUG("playerbots", "[New RPG] Bot %s select random grind pos Map:%u X:%f Y:%f Z:%f (%zu+%zu available in %zu)",
              bot->GetName(), dest.GetMapId(), dest.GetPositionX(), dest.GetPositionY(), dest.GetPositionZ(),
              hi_prepared_locs.size(), lo_prepared_locs.size() - hi_prepared_locs.size(), locs.size());
    return dest;
}

WorldPosition NewRpgBaseAction::SelectRandomCampPos(Player* bot)
{
    const std::vector<WorldLocation>& locs = IsAlliance(bot->GetRace())
                                                 ? sRandomPlayerbotMgr.allianceStarterPerLevelCache[bot->GetLevel()]
                                                 : sRandomPlayerbotMgr.hordeStarterPerLevelCache[bot->GetLevel()];

    bool inCity = false;

    if (AreaTableEntry const* zone = sAreaTableStore.LookupEntry(bot->GetZoneId()))
    {
        if (zone->flags & AREA_FLAG_CAPITAL)
            inCity = true;
    }

    std::vector<WorldLocation> prepared_locs;
    for (auto& loc : locs)
    {
        if (bot->GetMapId() != loc.GetMapId())
            continue;

        float range = bot->GetLevel() <= 5 ? 500.0f : 2500.0f;
        if (bot->GetExactDist(loc) > range)
            continue;

        if (bot->GetExactDist(loc) < 50.0f)
            continue;

        if (!inCity && sTerrainMgr.GetZoneId(bot->GetMapId(), loc.GetPositionX(), loc.GetPositionY(),
                                                loc.GetPositionZ()) != bot->GetZoneId())
            continue;

        prepared_locs.push_back(loc);
    }
    WorldPosition dest{};
    if (!prepared_locs.empty())
    {
        uint32 idx = urand(0, prepared_locs.size() - 1);
        dest = prepared_locs[idx];
    }
    LOG_DEBUG("playerbots", "[New RPG] Bot %s select random inn keeper pos Map:%u X:%f Y:%f Z:%f (%zu available in %zu)",
              bot->GetName(), dest.GetMapId(), dest.GetPositionX(), dest.GetPositionY(), dest.GetPositionZ(),
              prepared_locs.size(), locs.size());
    return dest;
}

bool NewRpgBaseAction::SelectRandomFlightTaxiNode(ObjectGuid& flightMaster, uint32& fromNode, uint32& toNode)
{
    Creature* nearestFlightMaster = FlightMasterCache::Instance().GetNearestFlightMaster(bot);
    if (!nearestFlightMaster || bot->GetDistance(nearestFlightMaster) > 500.0f)
        return false;

    fromNode = sObjectMgr.GetNearestTaxiNode(nearestFlightMaster->GetPositionX(), nearestFlightMaster->GetPositionY(),
                                              nearestFlightMaster->GetPositionZ(), nearestFlightMaster->GetMapId(),
                                              bot->GetTeam());

    if (!fromNode)
        return false;

    std::vector<uint32> availableToNodes;
    for (uint32 i = 1; i < sTaxiNodesStore.GetNumRows(); ++i)
    {
        if (fromNode == i)
            continue;

        TaxiNodesEntry const* node = sTaxiNodesStore.LookupEntry(i);

        // check map
        if (!node || node->map_id != bot->GetMapId() ||
            (!node->MountCreatureID[bot->GetTeam() == TEAM_ALLIANCE ? 1 : 0]))  // dk flight
            continue;

        // check taxi node known
        if (!bot->isTaxiCheater() && !bot->GetTaxi().IsTaximaskNodeKnown(i))
            continue;

        // check distance by level
        if (!botAI->CheckLocationDistanceByLevel(bot, WorldLocation(node->map_id, node->x, node->y, node->z), false))
            continue;

        // check path
        uint32 path, cost;
        sObjectMgr.GetTaxiPath(fromNode, i, path, cost);
        if (!path)
            continue;

        // check area level
        uint32 nodeZoneId = sTerrainMgr.GetZoneId(bot->GetMapId(), node->x, node->y, node->z);
        bool capital = false;
        if (AreaTableEntry const* zone = sAreaTableStore.LookupEntry(nodeZoneId))
        {
            capital = zone->flags & AREA_FLAG_CAPITAL;
        }

        auto itr = sRandomPlayerbotMgr.zone2LevelBracket.find(nodeZoneId);
        if (!capital && itr == sRandomPlayerbotMgr.zone2LevelBracket.end())
            continue;

        if (!capital && (bot->GetLevel() < itr->second.low || bot->GetLevel() > itr->second.high))
            continue;

        availableToNodes.push_back(i);
    }
    if (availableToNodes.empty())
        return false;

    flightMaster = nearestFlightMaster->GetGUID();
    toNode = availableToNodes[urand(0, availableToNodes.size() - 1)];
    LOG_DEBUG("playerbots", "[New RPG] Bot %s select random flight taxi node from:%u (node %u) to:%u (%zu available)",
              bot->GetName(), flightMaster.GetEntry(), fromNode, toNode, availableToNodes.size());
    return true;
}

bool NewRpgBaseAction::RandomChangeStatus(std::vector<NewRpgStatus> candidateStatus)
{
    std::vector<NewRpgStatus> availableStatus;
    uint32 probSum = 0;
    for (NewRpgStatus status : candidateStatus)
    {
        if (sPlayerbotAIConfig.RpgStatusProbWeight[status] == 0)
            continue;

        if (CheckRpgStatusAvailable(status))
        {
            availableStatus.push_back(status);
            probSum += sPlayerbotAIConfig.RpgStatusProbWeight[status];
        }
    }
    // Safety check. Default to "rest" if all RPG weights = 0
    if (availableStatus.empty() || probSum == 0)
    {
        botAI->rpgInfo.ChangeToRest();
        bot->SetStandState(UNIT_STAND_STATE_SIT);
        return true;
    }
    uint32 rand = urand(1, probSum);
    uint32 accumulate = 0;
    NewRpgStatus chosenStatus = RPG_STATUS_END;
    for (NewRpgStatus status : availableStatus)
    {
        accumulate += sPlayerbotAIConfig.RpgStatusProbWeight[status];
        if (accumulate >= rand)
        {
            chosenStatus = status;
            break;
        }
    }

    switch (chosenStatus)
    {
        case RPG_WANDER_RANDOM:
        {
            botAI->rpgInfo.ChangeToWanderRandom();
            return true;
        }
        case RPG_WANDER_NPC:
        {
            botAI->rpgInfo.ChangeToWanderNpc();
            return true;
        }
        case RPG_GO_GRIND:
        {
            WorldPosition pos = SelectRandomGrindPos(bot);
            if (pos != WorldPosition())
            {
                botAI->rpgInfo.ChangeToGoGrind(pos);
                return true;
            }
            return false;
        }
        case RPG_GO_CAMP:
        {
            WorldPosition pos = SelectRandomCampPos(bot);
            if (pos != WorldPosition())
            {
                botAI->rpgInfo.ChangeToGoCamp(pos);
                return true;
            }
            return false;
        }
        case RPG_DO_QUEST:
        {
            std::vector<uint32> availableQuests;
            for (uint8 slot = 0; slot < MAX_QUEST_LOG_SIZE; ++slot)
            {
                uint32 questId = bot->GetQuestSlotQuestId(slot);
                Quest const* quest = sObjectMgr.GetQuestTemplate(questId);
                if (!quest || !QuestFitsPopulationPlan(quest))
                    continue;

                if (botAI->lowPriorityQuest.find(questId) != botAI->lowPriorityQuest.end())
                    continue;

                std::vector<POIInfo> poiInfo;
                if (GetQuestPOIPosAndObjectiveIdx(questId, poiInfo, true))
                {
                    availableQuests.push_back(questId);
                }
            }
            if (availableQuests.size())
            {
                uint32 questId = availableQuests[urand(0, availableQuests.size() - 1)];
                const Quest* quest = sObjectMgr.GetQuestTemplate(questId);
                if (quest)
                {
                    botAI->rpgInfo.ChangeToDoQuest(questId, quest);
                    return true;
                }
            }
            return false;
        }
        case RPG_TRAVEL_FLIGHT:
        {
            ObjectGuid flightMaster;
            uint32 fromNode, toNode;
            if (SelectRandomFlightTaxiNode(flightMaster, fromNode, toNode))
            {
                botAI->rpgInfo.ChangeToTravelFlight(flightMaster, fromNode, toNode);
                return true;
            }
            return false;
        }
        case RPG_IDLE:
        {
            botAI->rpgInfo.ChangeToIdle();
            return true;
        }
        case RPG_REST:
        {
            botAI->rpgInfo.ChangeToRest();
            bot->SetStandState(UNIT_STAND_STATE_SIT);
            return true;
        }
        default:
        {
            botAI->rpgInfo.ChangeToRest();
            bot->SetStandState(UNIT_STAND_STATE_SIT);
            return true;
        }
    }
    return false;
}

bool NewRpgBaseAction::CheckRpgStatusAvailable(NewRpgStatus status)
{
    switch (status)
    {
        case RPG_IDLE:
        case RPG_REST:
            return true;
        case RPG_WANDER_RANDOM:
        {
            Unit* target = AI_VALUE(Unit*, "grind target");
            return target != nullptr;
        }
        case RPG_GO_GRIND:
        {
            WorldPosition pos = SelectRandomGrindPos(bot);
            return pos != WorldPosition();
        }
        case RPG_GO_CAMP:
        {
            WorldPosition pos = SelectRandomCampPos(bot);
            return pos != WorldPosition();
        }
        case RPG_WANDER_NPC:
        {
            GuidVector possibleTargets = AI_VALUE(GuidVector, "possible new rpg targets");
            return possibleTargets.size() >= 3;
        }
        case RPG_DO_QUEST:
        {
            std::vector<uint32> availableQuests;
            for (uint8 slot = 0; slot < MAX_QUEST_LOG_SIZE; ++slot)
            {
                uint32 questId = bot->GetQuestSlotQuestId(slot);
                Quest const* quest = sObjectMgr.GetQuestTemplate(questId);
                if (!quest || !QuestFitsPopulationPlan(quest))
                    continue;

                if (botAI->lowPriorityQuest.find(questId) != botAI->lowPriorityQuest.end())
                    continue;

                std::vector<POIInfo> poiInfo;
                if (GetQuestPOIPosAndObjectiveIdx(questId, poiInfo, true))
                {
                    return true;
                }
            }
            return false;
        }
        case RPG_TRAVEL_FLIGHT:
        {
            ObjectGuid flightMaster;
            uint32 fromNode, toNode;
            return SelectRandomFlightTaxiNode(flightMaster, fromNode, toNode);
        }
        default:
            return false;
    }
    return false;
}
