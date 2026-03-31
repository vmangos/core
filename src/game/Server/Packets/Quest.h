#ifndef MANGOS_PACKETS_QUEST_H
#define MANGOS_PACKETS_QUEST_H

#include "Packet.h"
#include "ObjectGuid.h"
#include "SharedDefines.h"

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
}} // namespace WorldPackets::Quest

#endif // MANGOS_PACKETS_QUEST_H
