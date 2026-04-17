#include "Quest.h"

#include "ObjectMgr.h"
#include "QuestDef.h"

void WorldPackets::Quest::QueryQuest::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> questEntry;
}

void WorldPackets::Quest::QuestgiverStatusQuery::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Quest::QuestgiverHello::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
}

void WorldPackets::Quest::QuestgiverAcceptQuest::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> quest;
}

void WorldPackets::Quest::QuestgiverQueryQuest::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> quest;
}

void WorldPackets::Quest::QuestgiverChooseReward::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> quest;
    recv_data >> reward;
}

void WorldPackets::Quest::QuestgiverRequestReward::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> quest;
}

void WorldPackets::Quest::QuestgiverCompleteQuest::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> quest;
}

void WorldPackets::Quest::QuestLogSwapQuest::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> slot1;
    recv_data >> slot2;
}

void WorldPackets::Quest::QuestLogRemoveQuest::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> slot;
}

void WorldPackets::Quest::QuestConfirmAccept::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> questId;
}

void WorldPackets::Quest::PushQuestToParty::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> questId;
}

void WorldPackets::Quest::QuestPushResult::ReadFromWorldPacket(WorldPacket& recv_data)
{
    recv_data >> guid;
    recv_data >> msg;
}

// --- Server Packets ---

void WorldPackets::Quest::QuestPushResultResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << senderGuid;
    buffer << msg;
}

void WorldPackets::Quest::QuestLogFull::AppendBodyTo(ByteBuffer& /*buffer*/) const
{
}

void WorldPackets::Quest::QuestUpdateComplete::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << questId;
}

void WorldPackets::Quest::QuestGiverQuestComplete::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << questId;
    buffer << unknown;
    buffer << xp;
    buffer << money;
    buffer << static_cast<uint32>(rewardItems.size());
    for (auto const& item : rewardItems)
    {
        buffer << item.itemId;
        buffer << item.itemCount;
    }
}

void WorldPackets::Quest::QuestGiverQuestFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << questId;
    buffer << reason;
}

void WorldPackets::Quest::QuestUpdateFailed::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << questId;
}

void WorldPackets::Quest::QuestUpdateFailedTimer::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << questId;
}

void WorldPackets::Quest::QuestGiverQuestInvalid::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << msg;
}

void WorldPackets::Quest::QuestConfirmAcceptResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << questId;
    buffer << questTitle;
    buffer << senderGuid;
}

void WorldPackets::Quest::QuestUpdateAddItem::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << itemId;
    buffer << count;
}

void WorldPackets::Quest::QuestUpdateAddKill::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << questId;
    buffer << entry;
    buffer << count;
    buffer << required;
    buffer << guid;
}

void WorldPackets::Quest::QuestGiverStatus::AppendBodyTo(ByteBuffer& buffer) const
{
    buffer << npcGuid;
    buffer << status;
}

void WorldPackets::Quest::QuestGiverQuestList::AppendBodyTo(ByteBuffer& buffer) const
{
    std::string greetingText;
    uint32 emoteDelay;
    uint32 emote;
    if (QuestGreetingLocale const* questGreeting = sObjectMgr.GetQuestGreetingLocale(npcGuid.GetEntry(), (npcGuid.IsAnyTypeCreature() ? 0 : 1)))
    {
        if (static_cast<int32>(questGreeting->Content.size()) > sessionDbLocaleIndex + 1 && !questGreeting->Content[sessionDbLocaleIndex + 1].empty())
            greetingText = questGreeting->Content[sessionDbLocaleIndex + 1];
        else
            greetingText = questGreeting->Content[0];
        emoteDelay = questGreeting->EmoteDelay;
        emote = questGreeting->Emote;
    }
    else
    {
        greetingText = fallbackTitle;
        emoteDelay = fallbackEmoteDelay;
        emote = fallbackEmote;
    }

    buffer << npcGuid;
    buffer << greetingText;
    buffer << emoteDelay;
    buffer << emote;
    buffer << static_cast<uint8>(quests.size());
    for (auto const& entry : quests)
    {
        ::Quest const* quest = entry.quest;

        std::string title = quest->GetTitle();
        if (sessionDbLocaleIndex >= 0)
        {
            if (QuestLocale const* ql = sObjectMgr.GetQuestLocale(quest->GetQuestId()))
            {
                if (ql->Title.size() > static_cast<size_t>(sessionDbLocaleIndex) && !ql->Title[sessionDbLocaleIndex].empty())
                    title = ql->Title[sessionDbLocaleIndex];
            }
        }
        buffer << quest->GetQuestId();
        buffer << entry.icon;
        buffer << quest->GetQuestLevel();
        buffer << title;
    }
}

void WorldPackets::Quest::QuestGiverQuestDetails::AppendBodyTo(ByteBuffer& buffer) const
{
    std::string title = quest->GetTitle();
    std::string details = quest->GetDetails();
    std::string objectives = quest->GetObjectives();

    int const loc_idx = sessionDbLocaleIndex;
    if (loc_idx >= 0)
    {
        if (QuestLocale const* ql = sObjectMgr.GetQuestLocale(quest->GetQuestId()))
        {
            if (ql->Title.size() > static_cast<size_t>(loc_idx) && !ql->Title[loc_idx].empty())
                title = ql->Title[loc_idx];
            if (ql->Details.size() > static_cast<size_t>(loc_idx) && !ql->Details[loc_idx].empty())
                details = ql->Details[loc_idx];
            if (ql->Objectives.size() > static_cast<size_t>(loc_idx) && !ql->Objectives[loc_idx].empty())
                objectives = ql->Objectives[loc_idx];
        }
    }

    buffer << npcGuid;
    buffer << quest->GetQuestId();
    buffer << title;
    buffer << details;
    buffer << objectives;
    buffer << static_cast<uint32>(autoFinish);

    bool const hiddenRewards = quest->HasQuestFlag(QUEST_FLAGS_HIDDEN_REWARDS);
    if (hiddenRewards)
    {
        buffer << static_cast<uint32>(0); // Rewarded chosen items hidden
        buffer << static_cast<uint32>(0); // Rewarded items hidden
        buffer << static_cast<uint32>(0); // Rewarded money hidden
    }
    else
    {
        buffer << quest->GetRewChoiceItemsCount();
        for (uint32 i = 0; i < quest->GetRewChoiceItemsCount(); ++i)
        {
            buffer << quest->RewChoiceItemId[i];
            buffer << quest->RewChoiceItemCount[i];
            if (ItemPrototype const* pItem = sObjectMgr.GetItemPrototype(quest->RewChoiceItemId[i]))
                buffer << pItem->DisplayInfoID;
            else
                buffer << static_cast<uint32>(0);
        }

        buffer << quest->GetRewItemsCount();
        for (uint32 i = 0; i < quest->GetRewItemsCount(); ++i)
        {
            buffer << quest->RewItemId[i];
            buffer << quest->RewItemCount[i];
            if (ItemPrototype const* pItem = sObjectMgr.GetItemPrototype(quest->RewItemId[i]))
                buffer << pItem->DisplayInfoID;
            else
                buffer << static_cast<uint32>(0);
        }

        buffer << quest->GetRewOrReqMoney();
    }

    buffer << quest->GetRewSpell();
    buffer << static_cast<uint32>(QUEST_EMOTE_COUNT);
    for (uint32 i = 0; i < QUEST_EMOTE_COUNT; ++i)
    {
        buffer << quest->DetailsEmote[i];
        buffer << quest->DetailsEmoteDelay[i];
    }
}

void WorldPackets::Quest::QuestGiverOfferReward::AppendBodyTo(ByteBuffer& buffer) const
{
    std::string title = quest->GetTitle();
    std::string offerRewardText = quest->GetOfferRewardText();

    int const loc_idx = sessionDbLocaleIndex;
    if (loc_idx >= 0)
    {
        if (QuestLocale const* ql = sObjectMgr.GetQuestLocale(quest->GetQuestId()))
        {
            if (ql->Title.size() > static_cast<size_t>(loc_idx) && !ql->Title[loc_idx].empty())
                title = ql->Title[loc_idx];
            if (ql->OfferRewardText.size() > static_cast<size_t>(loc_idx) && !ql->OfferRewardText[loc_idx].empty())
                offerRewardText = ql->OfferRewardText[loc_idx];
        }
    }

    buffer << npcGuid;
    buffer << quest->GetQuestId();
    buffer << title;
    buffer << offerRewardText;
    buffer << static_cast<uint32>(autoFinish);

    uint32 emoteCount = 0;
    for (uint32 emoteId : quest->OfferRewardEmote)
    {
        if (emoteId == 0)
            break;
        ++emoteCount;
    }
    buffer << emoteCount;
    for (uint32 i = 0; i < emoteCount; ++i)
    {
        buffer << quest->OfferRewardEmoteDelay[i];
        buffer << quest->OfferRewardEmote[i];
    }

    buffer << quest->GetRewChoiceItemsCount();
    for (uint32 i = 0; i < quest->GetRewChoiceItemsCount(); ++i)
    {
        buffer << quest->RewChoiceItemId[i];
        buffer << quest->RewChoiceItemCount[i];
        if (ItemPrototype const* pItem = sObjectMgr.GetItemPrototype(quest->RewChoiceItemId[i]))
            buffer << pItem->DisplayInfoID;
        else
            buffer << static_cast<uint32>(0);
    }

    buffer << quest->GetRewItemsCount();
    for (uint32 i = 0; i < quest->GetRewItemsCount(); ++i)
    {
        buffer << quest->RewItemId[i];
        buffer << quest->RewItemCount[i];
        if (ItemPrototype const* pItem = sObjectMgr.GetItemPrototype(quest->RewItemId[i]))
            buffer << pItem->DisplayInfoID;
        else
            buffer << static_cast<uint32>(0);
    }

    buffer << quest->GetRewOrReqMoney();
    buffer << quest->GetQuestFlags();
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_4_2
    buffer << quest->GetRewSpell();
#endif
}

void WorldPackets::Quest::QuestGiverRequestItems::AppendBodyTo(ByteBuffer& buffer) const
{
    std::string title = quest->GetTitle();
    std::string requestItemsText = quest->GetRequestItemsText();

    int const loc_idx = sessionDbLocaleIndex;
    if (loc_idx >= 0)
    {
        if (QuestLocale const* ql = sObjectMgr.GetQuestLocale(quest->GetQuestId()))
        {
            if (ql->Title.size() > static_cast<size_t>(loc_idx) && !ql->Title[loc_idx].empty())
                title = ql->Title[loc_idx];
            if (ql->RequestItemsText.size() > static_cast<size_t>(loc_idx) && !ql->RequestItemsText[loc_idx].empty())
                requestItemsText = ql->RequestItemsText[loc_idx];
        }
    }

    buffer << npcGuid;
    buffer << quest->GetQuestId();
    buffer << title;
    buffer << requestItemsText;
    buffer << static_cast<uint32>(0); // Emote Delay
    if (isComplete)
        buffer << quest->GetCompleteEmote();
    else
        buffer << quest->GetIncompleteEmote();
    buffer << static_cast<uint32>(closeOnCancel);
    buffer << static_cast<uint32>(quest->GetRewOrReqMoney() < 0 ? -quest->GetRewOrReqMoney() : 0);

    buffer << quest->GetReqItemsCount();
    for (int i = 0; i < QUEST_ITEM_OBJECTIVES_COUNT; i++)
    {
        if (!quest->ReqItemId[i])
            continue;

        buffer << quest->ReqItemId[i];
        buffer << quest->ReqItemCount[i];
        if (ItemPrototype const* pItem = sObjectMgr.GetItemPrototype(quest->ReqItemId[i]))
            buffer << pItem->DisplayInfoID;
        else
            buffer << static_cast<uint32>(0);
    }

    // Quest completion flags - all must be set for the client to enable the "Complete Quest" button.
    // These flags are used together combined with && operations in the client.
    // No flag is used independently. The actual values don't matter. They just need to be truish.
    buffer << static_cast<uint32>(0x02);
    buffer << static_cast<uint32>(isComplete ? 0x03 : 0x00);
    buffer << static_cast<uint32>(0x04);
    buffer << static_cast<uint32>(0x08);
}

void WorldPackets::Quest::QuestQueryResponse::AppendBodyTo(ByteBuffer& buffer) const
{
    char const* Title = quest->GetTitle().c_str();
    size_t titleLen = quest->GetTitle().length();
    char const* Details = quest->GetDetails().c_str();
    size_t detailsLen = quest->GetDetails().length();
    char const* Objectives = quest->GetObjectives().c_str();
    size_t objectivesLen = quest->GetObjectives().length();
    char const* EndText = quest->GetEndText().c_str();
    size_t endTextLen = quest->GetEndText().length();
    char const* ObjectiveText[QUEST_OBJECTIVES_COUNT];
    size_t objectiveTextLen[QUEST_OBJECTIVES_COUNT];

    for (int i = 0; i < QUEST_OBJECTIVES_COUNT; ++i)
    {
        ObjectiveText[i] = quest->ObjectiveText[i].c_str();
        objectiveTextLen[i] = quest->ObjectiveText[i].length();
    }

    int const loc_idx = sessionDbLocaleIndex;
    if (loc_idx >= 0)
    {
        if (QuestLocale const* ql = sObjectMgr.GetQuestLocale(quest->GetQuestId()))
        {
            if (ql->Title.size() >static_cast<size_t>(loc_idx) && !ql->Title[loc_idx].empty())
            {
                Title = ql->Title[loc_idx].c_str();
                titleLen = ql->Title[loc_idx].length();
            }
            if (ql->Details.size() > static_cast<size_t>(loc_idx) && !ql->Details[loc_idx].empty())
            {
                Details = ql->Details[loc_idx].c_str();
                detailsLen = ql->Details[loc_idx].length();
            }
            if (ql->Objectives.size() > static_cast<size_t>(loc_idx) && !ql->Objectives[loc_idx].empty())
            {
                Objectives = ql->Objectives[loc_idx].c_str();
                objectivesLen = ql->Objectives[loc_idx].length();
            }
            if (ql->EndText.size() > static_cast<size_t>(loc_idx) && !ql->EndText[loc_idx].empty())
            {
                EndText = ql->EndText[loc_idx].c_str();
                endTextLen = ql->EndText[loc_idx].length();
            }

            for (int i = 0; i < QUEST_OBJECTIVES_COUNT; ++i)
            {
                if (ql->ObjectiveText[i].size() >static_cast<size_t>(loc_idx) && !ql->ObjectiveText[i][loc_idx].empty())
                {
                    ObjectiveText[i] = ql->ObjectiveText[i][loc_idx].c_str();
                    objectiveTextLen[i] = ql->ObjectiveText[i][loc_idx].length();
                }
            }
        }
    }

    buffer << quest->GetQuestId();                   // quest id
    buffer << quest->GetQuestMethod();               // Accepted values: 0, 1 or 2. 0==IsAutoComplete() (skip objectives/details)
    buffer << quest->GetQuestLevel();                // may be 0, static data, in other cases must be used dynamic level: Player::GetQuestLevelForPlayer
    buffer << quest->GetZoneOrSort();                // zone or sort to display in quest log

    buffer << quest->GetType();

    buffer << quest->GetRepObjectiveFaction();       // shown in quest log as part of quest objective
    buffer << static_cast<uint32>(quest->GetRepObjectiveValue());         // shown in quest log as part of quest objective

    buffer << static_cast<uint32>(0);                // RequiredOpositeRepFaction
    buffer << static_cast<uint32>(0);                // RequiredOpositeRepValue, required faction value with another (oposite) faction (objective)

    buffer << quest->GetNextQuestInChain();          // client will request this quest from NPC, if not 0

    if (quest->HasQuestFlag(QUEST_FLAGS_HIDDEN_REWARDS))
        buffer << static_cast<uint32>(0);            // Hide money rewarded
    else
        buffer << static_cast<uint32>(quest->GetRewOrReqMoney());

#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
    buffer << quest->GetRewMoneyMaxLevel();          // used in XP calculation at client
#endif
    buffer << quest->GetRewSpell();                  // reward spell, this spell will display (icon) (casted if RewSpellCast==0)

    buffer << quest->GetSrcItemId();                 // source item id
    buffer << quest->GetQuestFlags();                // quest flags

    int iI;

    if (quest->HasQuestFlag(QUEST_FLAGS_HIDDEN_REWARDS))
    {
        for (iI = 0; iI < QUEST_REWARDS_COUNT; ++iI)
            buffer << static_cast<uint32>(0) << static_cast<uint32>(0);
        for (iI = 0; iI < QUEST_REWARD_CHOICES_COUNT; ++iI)
            buffer << static_cast<uint32>(0) << static_cast<uint32>(0);
    }
    else
    {
        for (iI = 0; iI < QUEST_REWARDS_COUNT; ++iI)
        {
            buffer << quest->RewItemId[iI];
            buffer << quest->RewItemCount[iI];
        }
        for (iI = 0; iI < QUEST_REWARD_CHOICES_COUNT; ++iI)
        {
            buffer << quest->RewChoiceItemId[iI];
            buffer << quest->RewChoiceItemCount[iI];
        }
    }

    buffer << quest->GetPointMapId();
    buffer << quest->GetPointX();
    buffer << quest->GetPointY();
    buffer << quest->GetPointOpt();

    buffer.append(Title, titleLen + 1);
    buffer.append(Objectives, objectivesLen + 1);
    buffer.append(Details, detailsLen + 1);
    buffer.append(EndText, endTextLen + 1);

    for (iI = 0; iI < QUEST_OBJECTIVES_COUNT; ++iI)
    {
        if (quest->ReqCreatureOrGOId[iI] < 0)
        {
            // client expected gameobject template id in form (id|0x80000000)
            buffer << static_cast<uint32>(quest->ReqCreatureOrGOId[iI] * -1 | 0x80000000);
        }
        else
        {
            buffer << static_cast<uint32>(quest->ReqCreatureOrGOId[iI]);
        }
        buffer << quest->ReqCreatureOrGOCount[iI];
        buffer << quest->ReqItemId[iI];
        buffer << quest->ReqItemCount[iI];
    }

    for (iI = 0; iI < QUEST_OBJECTIVES_COUNT; ++iI)
        buffer.append(ObjectiveText[iI], objectiveTextLen[iI] + 1);
}
