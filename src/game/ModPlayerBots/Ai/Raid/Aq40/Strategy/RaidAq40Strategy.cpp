#include "RaidAq40Strategy.h"

#include "RaidAq40Multipliers.h"
#include "Strategy.h"

void RaidAq40Strategy::InitTriggers(std::vector<TriggerNode*>& triggers)
{
    triggers.push_back(
        new TriggerNode("aq40 skeram mind control", {NextAction("aq40 skeram cc mind control", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 skeram blink", {NextAction("aq40 skeram move to assigned platform", ACTION_RAID + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 skeram split", {NextAction("aq40 skeram attack split target", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 skeram arcane explosion", {NextAction("aq40 skeram interrupt arcane explosion", ACTION_INTERRUPT + 1),
                                                          NextAction("aq40 skeram move from arcane explosion", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 skeram too many melee", {NextAction("aq40 skeram move from melee clump", ACTION_RAID)}));

    triggers.push_back(
        new TriggerNode("aq40 bug trio kill order", {NextAction("aq40 bug trio attack kri", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 bug trio yauj heal", {NextAction("aq40 bug trio interrupt yauj", ACTION_INTERRUPT)}));
    triggers.push_back(
        new TriggerNode("aq40 bug trio yauj fear", {NextAction("aq40 bug trio spread from fear", ACTION_RAID)}));
    triggers.push_back(
        new TriggerNode("aq40 bug trio kri cloud", {NextAction("aq40 bug trio move from kri cloud", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 bug trio yauj spawn bugs", {NextAction("aq40 bug trio aoe spawn bugs", ACTION_RAID + 1)}));

    triggers.push_back(
        new TriggerNode("aq40 sartura whirlwind", {NextAction("aq40 sartura kite to perimeter", ACTION_EMERGENCY + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 sartura being chased", {NextAction("aq40 sartura kite to perimeter", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 sartura guard alive", {NextAction("aq40 sartura attack guard", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 sartura near tunnel", {NextAction("aq40 sartura move from tunnel", ACTION_RAID)}));

    triggers.push_back(
        new TriggerNode("aq40 fankriss worm spawn", {NextAction("aq40 fankriss attack worm", ACTION_RAID + 3)}));
    triggers.push_back(
        new TriggerNode("aq40 fankriss hatchling overload", {NextAction("aq40 fankriss gather hatchlings", ACTION_RAID + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 fankriss mortal wound swap", {NextAction("aq40 fankriss swap tanks", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 fankriss teleported player", {NextAction("aq40 fankriss help teleported player", ACTION_RAID)}));

    triggers.push_back(
        new TriggerNode("viscidus frost resistance trigger", {NextAction("viscidus frost resistance action", ACTION_RAID)}));
    triggers.push_back(
        new TriggerNode("aq40 viscidus poison volley", {NextAction("aq40 viscidus cleanse poison", ACTION_DISPEL + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 viscidus toxin cloud", {NextAction("move out of enemy contact", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 viscidus freeze phase", {NextAction("aq40 viscidus use frost attacks", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 viscidus shatter phase", {NextAction("aq40 viscidus melee shatter", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 viscidus glob phase", {NextAction("aq40 viscidus attack nearest glob", ACTION_RAID + 3)}));

    triggers.push_back(
        new TriggerNode("princess huhuran nature resistance trigger", {NextAction("princess huhuran nature resistance action", ACTION_RAID)}));
    triggers.push_back(
        new TriggerNode("aq40 huhuran frenzy", {NextAction("aq40 huhuran tranq shot", ACTION_INTERRUPT + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 huhuran berserk soon", {NextAction("aq40 huhuran move to soaker ring", ACTION_RAID + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 huhuran berserk", {NextAction("aq40 huhuran spread outer ring", ACTION_RAID)}));
    triggers.push_back(
        new TriggerNode("aq40 huhuran wyvern sting on tank", {NextAction("aq40 huhuran selective wyvern dispel", ACTION_DISPEL + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 huhuran inner ring missing", {NextAction("aq40 huhuran move to soaker ring", ACTION_RAID + 1)}));

    triggers.push_back(
        new TriggerNode("aq40 twins veklor melee danger", {NextAction("aq40 twins move from veklor melee", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 twins teleport", {NextAction("aq40 twins pick up emperor after teleport", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 twins bug mutate", {NextAction("aq40 twins control mutate bug", ACTION_RAID + 3)}));
    triggers.push_back(
        new TriggerNode("aq40 twins bug explode", {NextAction("aq40 twins kill explode bug", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 twins wrong emperor target", {NextAction("aq40 twins attack assigned emperor", ACTION_RAID + 1)}));

    triggers.push_back(
        new TriggerNode("aq40 ouro frontal danger", {NextAction("aq40 ouro move from frontal", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 ouro submerge", {NextAction("aq40 ouro regroup center", ACTION_RAID)}));
    triggers.push_back(
        new TriggerNode("aq40 ouro resurfacing", {NextAction("aq40 ouro spread for resurfacing", ACTION_RAID + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 ouro scarab spawn", {NextAction("aq40 ouro kill scarabs", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 ouro enrage", {NextAction("aq40 ouro burn", ACTION_RAID + 2)}));

    triggers.push_back(
        new TriggerNode("aq40 cthun eye beam danger", {NextAction("aq40 cthun spread ring", ACTION_RAID)}));
    triggers.push_back(
        new TriggerNode("aq40 cthun dark glare", {NextAction("aq40 cthun rotate dark glare", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 cthun giant eye tentacle", {NextAction("aq40 cthun attack giant eye", ACTION_RAID + 4)}));
    triggers.push_back(
        new TriggerNode("aq40 cthun giant claw tentacle", {NextAction("aq40 cthun attack giant claw", ACTION_RAID + 4)}));
    triggers.push_back(
        new TriggerNode("aq40 cthun eye tentacle", {NextAction("aq40 cthun attack eye tentacle", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 cthun claw tentacle", {NextAction("aq40 cthun attack eye tentacle", ACTION_RAID + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 cthun swallowed", {NextAction("aq40 cthun stomach attack flesh", ACTION_RAID + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 cthun flesh tentacle", {NextAction("aq40 cthun stomach attack flesh", ACTION_RAID + 3)}));
    triggers.push_back(
        new TriggerNode("aq40 cthun vulnerability", {NextAction("aq40 cthun burn body", ACTION_RAID + 5)}));

    triggers.push_back(
        new TriggerNode("aq40 trash sentinel pack", {NextAction("aq40 trash mark kill order", ACTION_RAID + 1)}));
    triggers.push_back(
        new TriggerNode("aq40 trash nullify danger", {NextAction("aq40 trash focus mindslayer", ACTION_RAID + 2)}));
    triggers.push_back(
        new TriggerNode("aq40 trash fire nova danger", {NextAction("aq40 trash spread", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 trash mindslayer mind control", {NextAction("aq40 trash focus mindslayer", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 trash slayer whirlwind", {NextAction("aq40 trash backpull", ACTION_EMERGENCY)}));
    triggers.push_back(
        new TriggerNode("aq40 trash plague", {NextAction("aq40 trash spread", ACTION_RAID)}));
}

void RaidAq40Strategy::InitMultipliers(std::vector<Multiplier*>& multipliers)
{
    multipliers.push_back(new Aq40BugTrioAoeMultiplier(botAI));
    multipliers.push_back(new Aq40ViscidusPriorityMultiplier(botAI));
    multipliers.push_back(new Aq40TwinEmperorsTargetMultiplier(botAI));
    multipliers.push_back(new Aq40CthunPriorityMultiplier(botAI));
}
