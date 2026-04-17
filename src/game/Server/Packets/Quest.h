#ifndef MANGOS_PACKETS_QUEST_H
#define MANGOS_PACKETS_QUEST_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"
#include <string>
#include <vector>

class Quest;

namespace WorldPackets { namespace Quest
{
    class QueryQuest final : public ClientPacket
    {
    public:
        uint32 questEntry; // db entry id

        explicit QueryQuest() : ClientPacket(CMSG_QUEST_QUERY), questEntry(0) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestgiverStatusQuery final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit QuestgiverStatusQuery() : ClientPacket(CMSG_QUESTGIVER_STATUS_QUERY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestgiverHello final : public ClientPacket
    {
    public:
        ObjectGuid guid;

        explicit QuestgiverHello() : ClientPacket(CMSG_QUESTGIVER_HELLO) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestgiverAcceptQuest final : public ClientPacket
    {
    public:
        ObjectGuid guid;
        uint32 quest = 0;

        explicit QuestgiverAcceptQuest() : ClientPacket(CMSG_QUESTGIVER_ACCEPT_QUEST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestgiverQueryQuest final : public ClientPacket
    {
    public:
        ObjectGuid guid;
        uint32 quest = 0;

        explicit QuestgiverQueryQuest() : ClientPacket(CMSG_QUESTGIVER_QUERY_QUEST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestgiverChooseReward final : public ClientPacket
    {
    public:
        ObjectGuid guid;
        uint32 quest = 0;
        uint32 reward = 0;

        explicit QuestgiverChooseReward() : ClientPacket(CMSG_QUESTGIVER_CHOOSE_REWARD) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestgiverRequestReward final : public ClientPacket
    {
    public:
        ObjectGuid guid;
        uint32 quest = 0;

        explicit QuestgiverRequestReward() : ClientPacket(CMSG_QUESTGIVER_REQUEST_REWARD) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestgiverCompleteQuest final : public ClientPacket
    {
    public:
        ObjectGuid guid;
        uint32 quest = 0;

        explicit QuestgiverCompleteQuest() : ClientPacket(CMSG_QUESTGIVER_COMPLETE_QUEST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestLogSwapQuest final : public ClientPacket
    {
    public:
        uint8 slot1 = 0;
        uint8 slot2 = 0;

        explicit QuestLogSwapQuest() : ClientPacket(CMSG_QUESTLOG_SWAP_QUEST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestLogRemoveQuest final : public ClientPacket
    {
    public:
        uint8 slot = 0;

        explicit QuestLogRemoveQuest() : ClientPacket(CMSG_QUESTLOG_REMOVE_QUEST) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestConfirmAccept final : public ClientPacket
    {
    public:
        uint32 questId = 0;

        explicit QuestConfirmAccept() : ClientPacket(CMSG_QUEST_CONFIRM_ACCEPT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class PushQuestToParty final : public ClientPacket
    {
    public:
        uint32 questId = 0;

        explicit PushQuestToParty() : ClientPacket(CMSG_PUSHQUESTTOPARTY) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };

    class QuestPushResult final : public ClientPacket
    {
    public:
        ObjectGuid guid;
        uint8 msg = 0;

        explicit QuestPushResult() : ClientPacket(MSG_QUEST_PUSH_RESULT) {}
        void ReadFromWorldPacket(WorldPacket& recv_data) override;
    };
    // --- Server Packets ---

    class QuestPushResultResponse final : public ServerPacket
    {
    public:
        ObjectGuid senderGuid;  // guid of the player who sent the quest share
        uint8 msg = 0;          // enum QuestShareMessages

        explicit QuestPushResultResponse() : ServerPacket(MSG_QUEST_PUSH_RESULT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestLogFull final : public ServerPacket
    {
    public:
        explicit QuestLogFull() : ServerPacket(SMSG_QUESTLOG_FULL) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestUpdateComplete final : public ServerPacket
    {
    public:
        uint32 questId = 0;

        explicit QuestUpdateComplete() : ServerPacket(SMSG_QUESTUPDATE_COMPLETE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct QuestRewardItem
    {
        uint32 itemId = 0;
        uint32 itemCount = 0;
    };

    class QuestGiverQuestComplete final : public ServerPacket
    {
    public:
        uint32 questId = 0;
        uint32 unknown = 0;
        uint32 xp = 0;
        uint32 money = 0;
        std::vector<QuestRewardItem> rewardItems; // max is 5

        explicit QuestGiverQuestComplete() : ServerPacket(SMSG_QUESTGIVER_QUEST_COMPLETE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestGiverQuestFailed final : public ServerPacket
    {
    public:
        uint32 questId = 0;
        uint32 reason = 0;

        explicit QuestGiverQuestFailed() : ServerPacket(SMSG_QUESTGIVER_QUEST_FAILED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestUpdateFailed final : public ServerPacket
    {
    public:
        uint32 questId = 0;

        explicit QuestUpdateFailed() : ServerPacket(SMSG_QUESTUPDATE_FAILED) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestUpdateFailedTimer final : public ServerPacket
    {
    public:
        uint32 questId = 0;

        explicit QuestUpdateFailedTimer() : ServerPacket(SMSG_QUESTUPDATE_FAILEDTIMER) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestGiverQuestInvalid final : public ServerPacket
    {
    public:
        uint32 msg = 0;

        explicit QuestGiverQuestInvalid() : ServerPacket(SMSG_QUESTGIVER_QUEST_INVALID) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestConfirmAcceptResponse final : public ServerPacket
    {
    public:
        uint32 questId = 0;
        std::string questTitle;
        ObjectGuid senderGuid;

        explicit QuestConfirmAcceptResponse() : ServerPacket(SMSG_QUEST_CONFIRM_ACCEPT) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestUpdateAddItem final : public ServerPacket
    {
    public:
        uint32 itemId = 0;
        uint32 count = 0;

        explicit QuestUpdateAddItem() : ServerPacket(SMSG_QUESTUPDATE_ADD_ITEM) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestUpdateAddKill final : public ServerPacket
    {
    public:
        uint32 questId = 0;
        uint32 entry = 0;       // creature or gameobject entry
        uint32 count = 0;       // current count
        uint32 required = 0;    // required count
        ObjectGuid guid;

        explicit QuestUpdateAddKill() : ServerPacket(SMSG_QUESTUPDATE_ADD_KILL) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestGiverStatus final : public ServerPacket
    {
    public:
        ObjectGuid npcGuid;
        uint32 status = 0;

        explicit QuestGiverStatus() : ServerPacket(SMSG_QUESTGIVER_STATUS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct QuestListEntry
    {
        ::Quest const* quest = nullptr;
        uint32 icon = 0;
    };

    class QuestGiverQuestList final : public ServerPacket
    {
    public:
        int sessionDbLocaleIndex = 0;
        ObjectGuid npcGuid;
        std::string fallbackTitle;
        uint32 fallbackEmoteDelay = 0;
        uint32 fallbackEmote = 0;
        std::vector<QuestListEntry> quests;

        explicit QuestGiverQuestList() : ServerPacket(SMSG_QUESTGIVER_QUEST_LIST) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    struct QuestRewardItemWithDisplayInfo
    {
        uint32 itemId = 0;
        uint32 itemCount = 0;
        uint32 displayInfoId = 0;
    };

    class QuestGiverQuestDetails final : public ServerPacket
    {
    public:
        int sessionDbLocaleIndex = 0;
        ObjectGuid npcGuid;
        ::Quest const* quest = nullptr;
        bool autoFinish = false;

        explicit QuestGiverQuestDetails() : ServerPacket(SMSG_QUESTGIVER_QUEST_DETAILS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestGiverOfferReward final : public ServerPacket
    {
    public:
        int sessionDbLocaleIndex = 0;
        ObjectGuid npcGuid;
        ::Quest const* quest = nullptr;
        bool autoFinish = false;

        explicit QuestGiverOfferReward() : ServerPacket(SMSG_QUESTGIVER_OFFER_REWARD) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestGiverRequestItems final : public ServerPacket
    {
    public:
        int sessionDbLocaleIndex = 0;
        ObjectGuid npcGuid;
        ::Quest const* quest = nullptr;
        bool isComplete = false;
        bool closeOnCancel = false; // Is `false` when quest was opened by a submenu

        explicit QuestGiverRequestItems() : ServerPacket(SMSG_QUESTGIVER_REQUEST_ITEMS) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

    class QuestQueryResponse final : public ServerPacket
    {
    public:
        int sessionDbLocaleIndex = 0;
        ::Quest const* quest = nullptr;

        explicit QuestQueryResponse() : ServerPacket(SMSG_QUEST_QUERY_RESPONSE) {}
        void AppendBodyTo(ByteBuffer& buffer) const override;
    };

}} // namespace WorldPackets::Quest

#endif // MANGOS_PACKETS_QUEST_H
