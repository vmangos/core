#ifndef _PLAYERBOT_RAIDAQ40TRIGGERS_H
#define _PLAYERBOT_RAIDAQ40TRIGGERS_H

#include "PlayerbotAI.h"
#include "Playerbots.h"
#include "Trigger.h"

class Aq40SkeramSplitTrigger : public Trigger
{
public:
    Aq40SkeramSplitTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 skeram split") {}
    bool IsActive() override;
};

class Aq40SkeramMindControlTrigger : public Trigger
{
public:
    Aq40SkeramMindControlTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 skeram mind control") {}
    bool IsActive() override;
};

class Aq40SkeramBlinkTrigger : public Trigger
{
public:
    Aq40SkeramBlinkTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 skeram blink") {}
    bool IsActive() override;
};

class Aq40SkeramArcaneExplosionTrigger : public Trigger
{
public:
    Aq40SkeramArcaneExplosionTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 skeram arcane explosion") {}
    bool IsActive() override;
};

class Aq40SkeramTooManyMeleeTrigger : public Trigger
{
public:
    Aq40SkeramTooManyMeleeTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 skeram too many melee") {}
    bool IsActive() override;
};

class Aq40BugTrioKillOrderTrigger : public Trigger
{
public:
    Aq40BugTrioKillOrderTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 bug trio kill order") {}
    bool IsActive() override;
};

class Aq40BugTrioYaujHealTrigger : public Trigger
{
public:
    Aq40BugTrioYaujHealTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 bug trio yauj heal") {}
    bool IsActive() override;
};

class Aq40BugTrioYaujFearTrigger : public Trigger
{
public:
    Aq40BugTrioYaujFearTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 bug trio yauj fear") {}
    bool IsActive() override;
};

class Aq40BugTrioKriCloudTrigger : public Trigger
{
public:
    Aq40BugTrioKriCloudTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 bug trio kri cloud") {}
    bool IsActive() override;
};

class Aq40BugTrioYaujSpawnBugsTrigger : public Trigger
{
public:
    Aq40BugTrioYaujSpawnBugsTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 bug trio yauj spawn bugs") {}
    bool IsActive() override;
};

class Aq40SarturaWhirlwindTrigger : public Trigger
{
public:
    Aq40SarturaWhirlwindTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 sartura whirlwind") {}
    bool IsActive() override;
};

class Aq40SarturaBeingChasedTrigger : public Trigger
{
public:
    Aq40SarturaBeingChasedTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 sartura being chased") {}
    bool IsActive() override;
};

class Aq40SarturaGuardAliveTrigger : public Trigger
{
public:
    Aq40SarturaGuardAliveTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 sartura guard alive") {}
    bool IsActive() override;
};

class Aq40SarturaNearTunnelTrigger : public Trigger
{
public:
    Aq40SarturaNearTunnelTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 sartura near tunnel") {}
    bool IsActive() override;
};

class Aq40FankrissWormSpawnTrigger : public Trigger
{
public:
    Aq40FankrissWormSpawnTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 fankriss worm spawn") {}
    bool IsActive() override;
};

class Aq40FankrissHatchlingOverloadTrigger : public Trigger
{
public:
    Aq40FankrissHatchlingOverloadTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 fankriss hatchling overload") {}
    bool IsActive() override;
};

class Aq40FankrissMortalWoundSwapTrigger : public Trigger
{
public:
    Aq40FankrissMortalWoundSwapTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 fankriss mortal wound swap") {}
    bool IsActive() override;
};

class Aq40FankrissTeleportedPlayerTrigger : public Trigger
{
public:
    Aq40FankrissTeleportedPlayerTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 fankriss teleported player") {}
    bool IsActive() override;
};

class Aq40ViscidusPoisonVolleyTrigger : public Trigger
{
public:
    Aq40ViscidusPoisonVolleyTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 viscidus poison volley") {}
    bool IsActive() override;
};

class Aq40ViscidusToxinCloudTrigger : public Trigger
{
public:
    Aq40ViscidusToxinCloudTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 viscidus toxin cloud") {}
    bool IsActive() override;
};

class Aq40ViscidusFreezePhaseTrigger : public Trigger
{
public:
    Aq40ViscidusFreezePhaseTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 viscidus freeze phase") {}
    bool IsActive() override;
};

class Aq40ViscidusShatterPhaseTrigger : public Trigger
{
public:
    Aq40ViscidusShatterPhaseTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 viscidus shatter phase") {}
    bool IsActive() override;
};

class Aq40ViscidusGlobPhaseTrigger : public Trigger
{
public:
    Aq40ViscidusGlobPhaseTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 viscidus glob phase") {}
    bool IsActive() override;
};

class Aq40HuhuranFrenzyTrigger : public Trigger
{
public:
    Aq40HuhuranFrenzyTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 huhuran frenzy") {}
    bool IsActive() override;
};

class Aq40HuhuranBerserkSoonTrigger : public Trigger
{
public:
    Aq40HuhuranBerserkSoonTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 huhuran berserk soon") {}
    bool IsActive() override;
};

class Aq40HuhuranBerserkTrigger : public Trigger
{
public:
    Aq40HuhuranBerserkTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 huhuran berserk") {}
    bool IsActive() override;
};

class Aq40HuhuranWyvernStingOnTankTrigger : public Trigger
{
public:
    Aq40HuhuranWyvernStingOnTankTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 huhuran wyvern sting on tank") {}
    bool IsActive() override;
};

class Aq40HuhuranInnerRingMissingTrigger : public Trigger
{
public:
    Aq40HuhuranInnerRingMissingTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 huhuran inner ring missing") {}
    bool IsActive() override;
};

class Aq40TwinsVeklorMeleeDangerTrigger : public Trigger
{
public:
    Aq40TwinsVeklorMeleeDangerTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 twins veklor melee danger") {}
    bool IsActive() override;
};

class Aq40TwinsTeleportTrigger : public Trigger
{
public:
    Aq40TwinsTeleportTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 twins teleport") {}
    bool IsActive() override;
};

class Aq40TwinsBugMutateTrigger : public Trigger
{
public:
    Aq40TwinsBugMutateTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 twins bug mutate") {}
    bool IsActive() override;
};

class Aq40TwinsBugExplodeTrigger : public Trigger
{
public:
    Aq40TwinsBugExplodeTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 twins bug explode") {}
    bool IsActive() override;
};

class Aq40TwinsWrongEmperorTargetTrigger : public Trigger
{
public:
    Aq40TwinsWrongEmperorTargetTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 twins wrong emperor target") {}
    bool IsActive() override;
};

class Aq40OuroFrontalDangerTrigger : public Trigger
{
public:
    Aq40OuroFrontalDangerTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 ouro frontal danger") {}
    bool IsActive() override;
};

class Aq40OuroSubmergeTrigger : public Trigger
{
public:
    Aq40OuroSubmergeTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 ouro submerge") {}
    bool IsActive() override;
};

class Aq40OuroResurfacingTrigger : public Trigger
{
public:
    Aq40OuroResurfacingTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 ouro resurfacing") {}
    bool IsActive() override;
};

class Aq40OuroScarabSpawnTrigger : public Trigger
{
public:
    Aq40OuroScarabSpawnTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 ouro scarab spawn") {}
    bool IsActive() override;
};

class Aq40OuroEnrageTrigger : public Trigger
{
public:
    Aq40OuroEnrageTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 ouro enrage") {}
    bool IsActive() override;
};

class Aq40CthunEyeBeamDangerTrigger : public Trigger
{
public:
    Aq40CthunEyeBeamDangerTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 cthun eye beam danger") {}
    bool IsActive() override;
};

class Aq40CthunDarkGlareTrigger : public Trigger
{
public:
    Aq40CthunDarkGlareTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 cthun dark glare") {}
    bool IsActive() override;
};

class Aq40CthunEyeTentacleTrigger : public Trigger
{
public:
    Aq40CthunEyeTentacleTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 cthun eye tentacle") {}
    bool IsActive() override;
};

class Aq40CthunClawTentacleTrigger : public Trigger
{
public:
    Aq40CthunClawTentacleTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 cthun claw tentacle") {}
    bool IsActive() override;
};

class Aq40CthunGiantEyeTentacleTrigger : public Trigger
{
public:
    Aq40CthunGiantEyeTentacleTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 cthun giant eye tentacle") {}
    bool IsActive() override;
};

class Aq40CthunGiantClawTentacleTrigger : public Trigger
{
public:
    Aq40CthunGiantClawTentacleTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 cthun giant claw tentacle") {}
    bool IsActive() override;
};

class Aq40CthunSwallowedTrigger : public Trigger
{
public:
    Aq40CthunSwallowedTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 cthun swallowed") {}
    bool IsActive() override;
};

class Aq40CthunFleshTentacleTrigger : public Trigger
{
public:
    Aq40CthunFleshTentacleTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 cthun flesh tentacle") {}
    bool IsActive() override;
};

class Aq40CthunVulnerabilityTrigger : public Trigger
{
public:
    Aq40CthunVulnerabilityTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 cthun vulnerability") {}
    bool IsActive() override;
};

class Aq40TrashSentinelPackTrigger : public Trigger
{
public:
    Aq40TrashSentinelPackTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 trash sentinel pack") {}
    bool IsActive() override;
};

class Aq40TrashNullifyDangerTrigger : public Trigger
{
public:
    Aq40TrashNullifyDangerTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 trash nullify danger") {}
    bool IsActive() override;
};

class Aq40TrashFireNovaDangerTrigger : public Trigger
{
public:
    Aq40TrashFireNovaDangerTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 trash fire nova danger") {}
    bool IsActive() override;
};

class Aq40TrashMindslayerMindControlTrigger : public Trigger
{
public:
    Aq40TrashMindslayerMindControlTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 trash mindslayer mind control") {}
    bool IsActive() override;
};

class Aq40TrashSlayerWhirlwindTrigger : public Trigger
{
public:
    Aq40TrashSlayerWhirlwindTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 trash slayer whirlwind") {}
    bool IsActive() override;
};

class Aq40TrashPlagueTrigger : public Trigger
{
public:
    Aq40TrashPlagueTrigger(PlayerbotAI* botAI) : Trigger(botAI, "aq40 trash plague") {}
    bool IsActive() override;
};

#endif
