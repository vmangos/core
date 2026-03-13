/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license, you may redistribute it
 * and/or modify it under version 3 of the License, or (at your option), any later version.
 */

#ifndef _PLAYERBOT_TALKTOQUESTGIVERACTION_H
#define _PLAYERBOT_TALKTOQUESTGIVERACTION_H

#include "QuestAction.h"

class Quest;
class Player;
class PlayerbotAI;
class WorldObject;

class TalkToQuestGiverAction : public QuestAction
{
public:
    TalkToQuestGiverAction(PlayerbotAI* botAI, std::string name = "talk to quest giver") : QuestAction(botAI, name) { }

protected:
    bool ProcessQuest(Quest const* quest, Object* questGiver) override;
    bool TurnInQuest(Quest const* quest, Object* questGiver, std::ostringstream& out, Player const* viewer = nullptr);

private:
    void RewardNoItem(Quest const* quest, Object* questGiver, std::ostringstream& out, Player const* viewer);
    void RewardSingleItem(Quest const* quest, Object* questGiver, std::ostringstream& out, Player const* viewer);
    std::set<uint32> BestRewards(Quest const* quest);
    void RewardMultipleItem(Quest const* quest, Object* questGiver, std::ostringstream& out, Player const* viewer);
    void AskToSelectReward(Quest const* quest, std::ostringstream& out, bool forEquip, Player const* viewer);
};

class TurnInQueryQuestAction : public TalkToQuestGiverAction
{
public:
    TurnInQueryQuestAction(PlayerbotAI* botAI) : TalkToQuestGiverAction(botAI, "turn in query quest") {}
    bool Execute(Event event) override;
};
#endif
