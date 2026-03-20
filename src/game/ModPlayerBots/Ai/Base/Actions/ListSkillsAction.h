#ifndef _PLAYERBOT_LISTSKILLSACTION_H
#define _PLAYERBOT_LISTSKILLSACTION_H

#include "Action.h"

class PlayerbotAI;

class ListSkillsAction : public Action
{
public:
    ListSkillsAction(PlayerbotAI* botAI, std::string const name = "skills") : Action(botAI, name) {}

    bool Execute(Event event) override;
};

#endif
