#ifndef _PLAYERBOT_RAIDSTRATEGYCONTEXT_H_
#define _PLAYERBOT_RAIDSTRATEGYCONTEXT_H_

#include "Strategy.h"
#include "RaidAq20Strategy.h"
#include "RaidAq40Strategy.h"
#include "RaidMcStrategy.h"
#include "RaidBwlStrategy.h"
#if !PB_DISABLE_BG_BOT_LOGIC
#include "RaidKarazhanStrategy.h"
#include "RaidMagtheridonStrategy.h"
#include "RaidGruulsLairStrategy.h"
#include "RaidSSCStrategy.h"
#include "RaidOsStrategy.h"
#include "RaidEoEStrategy.h"
#include "RaidVoAStrategy.h"
#include "RaidUlduarStrategy.h"
#include "RaidIccStrategy.h"
#endif
#include "RaidOnyxiaStrategy.h"

class RaidStrategyContext : public NamedObjectContext<Strategy>
{
public:
    RaidStrategyContext() : NamedObjectContext<Strategy>(false, true)
    {
        creators["aq20"] = &RaidStrategyContext::aq20;
        creators["aq40"] = &RaidStrategyContext::aq40;
        creators["moltencore"] = &RaidStrategyContext::moltencore;
        creators["bwl"] = &RaidStrategyContext::bwl;
#if !PB_DISABLE_BG_BOT_LOGIC
        creators["karazhan"] = &RaidStrategyContext::karazhan;
        creators["magtheridon"] = &RaidStrategyContext::magtheridon;
        creators["gruulslair"] = &RaidStrategyContext::gruulslair;
        creators["ssc"] = &RaidStrategyContext::ssc;
        creators["wotlk-os"] = &RaidStrategyContext::wotlk_os;
        creators["wotlk-eoe"] = &RaidStrategyContext::wotlk_eoe;
        creators["voa"] = &RaidStrategyContext::voa;
        creators["ulduar"] = &RaidStrategyContext::ulduar;
        creators["icc"] = &RaidStrategyContext::icc;
#endif
        creators["onyxia"] = &RaidStrategyContext::onyxia;
    }

private:
    static Strategy* aq20(PlayerbotAI* botAI) { return new RaidAq20Strategy(botAI); }
    static Strategy* aq40(PlayerbotAI* botAI) { return new RaidAq40Strategy(botAI); }
    static Strategy* moltencore(PlayerbotAI* botAI) { return new RaidMcStrategy(botAI); }
    static Strategy* bwl(PlayerbotAI* botAI) { return new RaidBwlStrategy(botAI); }
#if !PB_DISABLE_BG_BOT_LOGIC
    static Strategy* karazhan(PlayerbotAI* botAI) { return new RaidKarazhanStrategy(botAI); }
    static Strategy* magtheridon(PlayerbotAI* botAI) { return new RaidMagtheridonStrategy(botAI); }
    static Strategy* gruulslair(PlayerbotAI* botAI) { return new RaidGruulsLairStrategy(botAI); }
    static Strategy* ssc(PlayerbotAI* botAI) { return new RaidSSCStrategy(botAI); }
    static Strategy* wotlk_os(PlayerbotAI* botAI) { return new RaidOsStrategy(botAI); }
    static Strategy* wotlk_eoe(PlayerbotAI* botAI) { return new RaidEoEStrategy(botAI); }
    static Strategy* voa(PlayerbotAI* botAI) { return new RaidVoAStrategy(botAI); }
    static Strategy* ulduar(PlayerbotAI* botAI) { return new RaidUlduarStrategy(botAI); }
    static Strategy* icc(PlayerbotAI* botAI) { return new RaidIccStrategy(botAI); }
#endif
    static Strategy* onyxia(PlayerbotAI* botAI) { return new RaidOnyxiaStrategy(botAI); }
};

#endif
