#include "DropQuestAction.h"

#include <algorithm>
#include <random>

#include "ChatHelper.h"
#include "Event.h"
#include "ObjectMgr.h"
#include "Playerbots.h"

bool DropQuestAction::Execute(Event event)
{
    std::string const link = event.getParam();

    Player* master = GetMaster();
    if (!master)
        return false;

    PlayerbotChatHandler handler(master);
    uint32 entry = handler.extractQuestId(link);

    for (uint8 slot = 0; slot < MAX_QUEST_LOG_SIZE; ++slot)
    {
        uint32 logQuest = bot->GetQuestSlotQuestId(slot);
        Quest const* quest = sObjectMgr.GetQuestTemplate(logQuest);
        if (!quest)
            continue;

        if (logQuest != entry && link.find(quest->GetTitle()) == std::string::npos)
            continue;

        WorldPacket packet(CMSG_QUESTLOG_REMOVE_QUEST);
        packet << slot;
        bot->GetSession()->HandleQuestLogRemoveQuest(packet);
        bot->RemoveRewardedQuest(logQuest);
        entry = logQuest;
        break;
    }

    if (!entry)
        return false;

    if (botAI->HasStrategy("debug quest", BotState::BOT_STATE_NON_COMBAT) ||
        botAI->HasStrategy("debug rpg", BotState::BOT_STATE_COMBAT))
    {
        Quest const* quest = sObjectMgr.GetQuestTemplate(entry);
        if (quest)
        {
            std::string const textQuest = ChatHelper::FormatQuest(quest);
            LOG_INFO("playerbots", "%s => Quest [ %s ] removed", bot->GetName(), quest->GetTitle().c_str());
            bot->Say(("Quest [ " + textQuest + " ] removed").c_str(), LANG_UNIVERSAL);
        }
    }

    botAI->TellMaster("Quest removed");
    return true;
}

bool CleanQuestLogAction::Execute(Event event)
{
    Player* requester = event.getOwner() ? event.getOwner() : GetMaster();
    if (!requester || !sPlayerbotAIConfig.dropObsoleteQuests)
        return false;

    if (botAI->HasStrategy("debug rpg", BotState::BOT_STATE_COMBAT))
        botAI->TellMaster("Clean Quest Log command received, removing grey/trivial quests...");

    uint8 botLevel = bot->GetLevel();
    uint8 numQuest = 0;
    for (uint8 slot = 0; slot < MAX_QUEST_LOG_SIZE; ++slot)
    {
        if (bot->GetQuestSlotQuestId(slot))
            ++numQuest;
    }

    for (uint8 slot = 0; slot < MAX_QUEST_LOG_SIZE; ++slot)
    {
        uint32 questId = bot->GetQuestSlotQuestId(slot);
        if (!questId)
            continue;

        Quest const* quest = sObjectMgr.GetQuestTemplate(questId);
        if (!quest)
            continue;

        int32 questLevel = quest->GetQuestLevel();
        if (questLevel == -1)
            questLevel = botLevel;

        int32 trivialLevel = 5;
        if (botLevel >= 40)
            trivialLevel = 8;
        else if (botLevel >= 30)
            trivialLevel = 7;
        else if (botLevel >= 20)
            trivialLevel = 6;

        if ((botLevel - questLevel) <= trivialLevel)
            continue;

        if (botAI->HasStrategy("debug rpg", BotState::BOT_STATE_COMBAT))
            botAI->TellMaster("Quest [ " + quest->GetTitle() + " ] will be removed because it is trivial (grey).");

        WorldPacket packet(CMSG_QUESTLOG_REMOVE_QUEST);
        packet << slot;
        bot->GetSession()->HandleQuestLogRemoveQuest(packet);
        bot->RemoveRewardedQuest(questId);
        ++botAI->rpgStatistic.questDropped;
        --numQuest;

        if (botAI->HasStrategy("debug rpg", BotState::BOT_STATE_COMBAT))
        {
            std::string const textQuest = ChatHelper::FormatQuest(quest);
            LOG_INFO("playerbots", "%s => Quest [ %s ] removed", bot->GetName(), quest->GetTitle().c_str());
            bot->Say(("Quest [ " + textQuest + " ] removed").c_str(), LANG_UNIVERSAL);
            botAI->TellMaster("Quest [ " + quest->GetTitle() + " ] has been removed.");
        }
    }

    return true;
}

void CleanQuestLogAction::DropQuestType(uint8& numQuest, uint8 wantNum, bool isGreen, bool hasProgress, bool isComplete)
{
    std::vector<uint8> slots;
    for (uint8 slot = 0; slot < MAX_QUEST_LOG_SIZE; ++slot)
        slots.push_back(slot);

    if (wantNum < 100)
        std::shuffle(slots.begin(), slots.end(), std::mt19937(std::random_device{}()));

    for (uint8 slot : slots)
    {
        uint32 questId = bot->GetQuestSlotQuestId(slot);
        if (!questId)
            continue;

        Quest const* quest = sObjectMgr.GetQuestTemplate(questId);
        if (!quest || quest->GetRequiredClasses())
            continue;

        if (wantNum == 100)
            ++numQuest;

        int32 lowLevelDiff = sWorld.getConfig(CONFIG_INT32_QUEST_LOW_LEVEL_HIDE_DIFF);
        uint32 questLevel = bot->GetQuestLevelForPlayer(quest);
        bool isQuestGreen = lowLevelDiff < 0 || bot->GetLevel() <= questLevel + uint32(lowLevelDiff);
        if (isQuestGreen)
        {
            if (bot->GetLevel() + 5 > questLevel && !isGreen)
                continue;
        }
        else if (isGreen)
            continue;

        if (HasProgress(bot, quest) && !hasProgress && bot->GetQuestStatus(questId) != QUEST_STATUS_FAILED)
            continue;

        if (bot->GetQuestStatus(questId) == QUEST_STATUS_COMPLETE && !isComplete)
            continue;

        if (numQuest <= wantNum && bot->GetQuestStatus(questId) != QUEST_STATUS_FAILED)
            continue;

        WorldPacket packet(CMSG_QUESTLOG_REMOVE_QUEST);
        packet << slot;
        bot->GetSession()->HandleQuestLogRemoveQuest(packet);
        bot->RemoveRewardedQuest(questId);
        --numQuest;

        if (botAI->HasStrategy("debug quest", BotState::BOT_STATE_NON_COMBAT) ||
            botAI->HasStrategy("debug rpg", BotState::BOT_STATE_COMBAT))
        {
            std::string const textQuest = ChatHelper::FormatQuest(quest);
            LOG_INFO("playerbots", "%s => Quest [ %s ] removed", bot->GetName(), quest->GetTitle().c_str());
            bot->Say(("Quest [ " + textQuest + " ] removed").c_str(), LANG_UNIVERSAL);
        }

        botAI->TellMaster("Quest removed" + chat->FormatQuest(quest));
    }
}

bool CleanQuestLogAction::HasProgress(Player* bot, Quest const* quest)
{
    uint32 questId = quest->GetQuestId();
    if (bot->GetQuestStatus(questId) == QUEST_STATUS_COMPLETE)
        return true;

    QuestStatusData questStatus = bot->getQuestStatusMap()[questId];
    for (uint32 i = 0; i < QUEST_OBJECTIVES_COUNT; ++i)
    {
        if (!quest->ObjectiveText[i].empty())
            return true;

        if (quest->RequiredItemId[i])
        {
            int required = quest->RequiredItemCount[i];
            int available = questStatus.ItemCount[i];
            if (available > 0 && required > 0)
                return true;
        }

        if (quest->RequiredNpcOrGo[i])
        {
            int required = quest->RequiredNpcOrGoCount[i];
            int available = questStatus.CreatureOrGOCount[i];
            if (available > 0 && required > 0)
                return true;
        }
    }

    return false;
}
