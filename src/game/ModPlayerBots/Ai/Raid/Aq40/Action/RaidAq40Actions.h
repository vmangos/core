#ifndef _PLAYERBOT_RAIDAQ40ACTIONS_H
#define _PLAYERBOT_RAIDAQ40ACTIONS_H

#include "Action.h"
#include "AttackAction.h"
#include "MovementActions.h"
#include "PlayerbotAI.h"
#include "Playerbots.h"

class Aq40SkeramMoveFromArcaneExplosionAction : public MovementAction
{
public:
    Aq40SkeramMoveFromArcaneExplosionAction(PlayerbotAI* botAI,
                                           std::string const name = "aq40 skeram move from arcane explosion")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40SkeramAttackSplitTargetAction : public AttackAction
{
public:
    Aq40SkeramAttackSplitTargetAction(PlayerbotAI* botAI,
                                     std::string const name = "aq40 skeram attack split target")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40SkeramCcMindControlAction : public AttackAction
{
public:
    Aq40SkeramCcMindControlAction(PlayerbotAI* botAI, std::string const name = "aq40 skeram cc mind control")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40SkeramMoveToAssignedPlatformAction : public MovementAction
{
public:
    Aq40SkeramMoveToAssignedPlatformAction(PlayerbotAI* botAI,
                                          std::string const name = "aq40 skeram move to assigned platform")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40SkeramInterruptArcaneExplosionAction : public AttackAction
{
public:
    Aq40SkeramInterruptArcaneExplosionAction(PlayerbotAI* botAI,
                                            std::string const name = "aq40 skeram interrupt arcane explosion")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40SkeramMoveFromMeleeClumpAction : public MovementAction
{
public:
    Aq40SkeramMoveFromMeleeClumpAction(PlayerbotAI* botAI,
                                      std::string const name = "aq40 skeram move from melee clump")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40BugTrioAttackKriAction : public AttackAction
{
public:
    Aq40BugTrioAttackKriAction(PlayerbotAI* botAI, std::string const name = "aq40 bug trio attack kri")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40BugTrioInterruptYaujAction : public AttackAction
{
public:
    Aq40BugTrioInterruptYaujAction(PlayerbotAI* botAI, std::string const name = "aq40 bug trio interrupt yauj")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40BugTrioMoveFromKriCloudAction : public MovementAction
{
public:
    Aq40BugTrioMoveFromKriCloudAction(PlayerbotAI* botAI, std::string const name = "aq40 bug trio move from kri cloud")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40BugTrioAoeSpawnBugsAction : public AttackAction
{
public:
    Aq40BugTrioAoeSpawnBugsAction(PlayerbotAI* botAI, std::string const name = "aq40 bug trio aoe spawn bugs")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40BugTrioSpreadFromFearAction : public MovementAction
{
public:
    Aq40BugTrioSpreadFromFearAction(PlayerbotAI* botAI, std::string const name = "aq40 bug trio spread from fear")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40SarturaKiteToPerimeterAction : public MovementAction
{
public:
    Aq40SarturaKiteToPerimeterAction(PlayerbotAI* botAI, std::string const name = "aq40 sartura kite to perimeter")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40SarturaAttackGuardAction : public AttackAction
{
public:
    Aq40SarturaAttackGuardAction(PlayerbotAI* botAI, std::string const name = "aq40 sartura attack guard")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40SarturaMoveFromTunnelAction : public MovementAction
{
public:
    Aq40SarturaMoveFromTunnelAction(PlayerbotAI* botAI, std::string const name = "aq40 sartura move from tunnel")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40FankrissAttackWormAction : public AttackAction
{
public:
    Aq40FankrissAttackWormAction(PlayerbotAI* botAI, std::string const name = "aq40 fankriss attack worm")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40FankrissGatherHatchlingsAction : public AttackAction
{
public:
    Aq40FankrissGatherHatchlingsAction(PlayerbotAI* botAI, std::string const name = "aq40 fankriss gather hatchlings")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40FankrissHelpTeleportedPlayerAction : public MovementAction
{
public:
    Aq40FankrissHelpTeleportedPlayerAction(PlayerbotAI* botAI, std::string const name = "aq40 fankriss help teleported player")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40FankrissSwapTanksAction : public AttackAction
{
public:
    Aq40FankrissSwapTanksAction(PlayerbotAI* botAI, std::string const name = "aq40 fankriss swap tanks")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40ViscidusCleansePoisonAction : public Action
{
public:
    Aq40ViscidusCleansePoisonAction(PlayerbotAI* botAI, std::string const name = "aq40 viscidus cleanse poison")
        : Action(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40ViscidusUseFrostAttacksAction : public AttackAction
{
public:
    Aq40ViscidusUseFrostAttacksAction(PlayerbotAI* botAI, std::string const name = "aq40 viscidus use frost attacks")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40ViscidusMeleeShatterAction : public AttackAction
{
public:
    Aq40ViscidusMeleeShatterAction(PlayerbotAI* botAI, std::string const name = "aq40 viscidus melee shatter")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40ViscidusAttackNearestGlobAction : public AttackAction
{
public:
    Aq40ViscidusAttackNearestGlobAction(PlayerbotAI* botAI, std::string const name = "aq40 viscidus attack nearest glob")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40HuhuranTranqShotAction : public AttackAction
{
public:
    Aq40HuhuranTranqShotAction(PlayerbotAI* botAI, std::string const name = "aq40 huhuran tranq shot")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40HuhuranMoveToSoakerRingAction : public MovementAction
{
public:
    Aq40HuhuranMoveToSoakerRingAction(PlayerbotAI* botAI, std::string const name = "aq40 huhuran move to soaker ring")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40HuhuranSpreadOuterRingAction : public MovementAction
{
public:
    Aq40HuhuranSpreadOuterRingAction(PlayerbotAI* botAI, std::string const name = "aq40 huhuran spread outer ring")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40HuhuranSelectiveWyvernDispelAction : public Action
{
public:
    Aq40HuhuranSelectiveWyvernDispelAction(PlayerbotAI* botAI,
                                          std::string const name = "aq40 huhuran selective wyvern dispel")
        : Action(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TwinsMoveFromVeklorMeleeAction : public MovementAction
{
public:
    Aq40TwinsMoveFromVeklorMeleeAction(PlayerbotAI* botAI, std::string const name = "aq40 twins move from veklor melee")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TwinsPickUpEmperorAfterTeleportAction : public AttackAction
{
public:
    Aq40TwinsPickUpEmperorAfterTeleportAction(PlayerbotAI* botAI,
                                             std::string const name = "aq40 twins pick up emperor after teleport")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TwinsControlMutateBugAction : public AttackAction
{
public:
    Aq40TwinsControlMutateBugAction(PlayerbotAI* botAI, std::string const name = "aq40 twins control mutate bug")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TwinsKillExplodeBugAction : public AttackAction
{
public:
    Aq40TwinsKillExplodeBugAction(PlayerbotAI* botAI, std::string const name = "aq40 twins kill explode bug")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TwinsAttackAssignedEmperorAction : public AttackAction
{
public:
    Aq40TwinsAttackAssignedEmperorAction(PlayerbotAI* botAI,
                                         std::string const name = "aq40 twins attack assigned emperor")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40OuroMoveFromFrontalAction : public MovementAction
{
public:
    Aq40OuroMoveFromFrontalAction(PlayerbotAI* botAI, std::string const name = "aq40 ouro move from frontal")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40OuroRegroupCenterAction : public MovementAction
{
public:
    Aq40OuroRegroupCenterAction(PlayerbotAI* botAI, std::string const name = "aq40 ouro regroup center")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40OuroSpreadForResurfacingAction : public MovementAction
{
public:
    Aq40OuroSpreadForResurfacingAction(PlayerbotAI* botAI, std::string const name = "aq40 ouro spread for resurfacing")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40OuroKillScarabsAction : public AttackAction
{
public:
    Aq40OuroKillScarabsAction(PlayerbotAI* botAI, std::string const name = "aq40 ouro kill scarabs")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40OuroBurnAction : public AttackAction
{
public:
    Aq40OuroBurnAction(PlayerbotAI* botAI, std::string const name = "aq40 ouro burn") : AttackAction(botAI, name) {}

    bool Execute(Event event) override;
};

class Aq40CthunSpreadRingAction : public MovementAction
{
public:
    Aq40CthunSpreadRingAction(PlayerbotAI* botAI, std::string const name = "aq40 cthun spread ring")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40CthunRotateDarkGlareAction : public MovementAction
{
public:
    Aq40CthunRotateDarkGlareAction(PlayerbotAI* botAI, std::string const name = "aq40 cthun rotate dark glare")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40CthunAttackEyeTentacleAction : public AttackAction
{
public:
    Aq40CthunAttackEyeTentacleAction(PlayerbotAI* botAI, std::string const name = "aq40 cthun attack eye tentacle")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40CthunAttackGiantEyeAction : public AttackAction
{
public:
    Aq40CthunAttackGiantEyeAction(PlayerbotAI* botAI, std::string const name = "aq40 cthun attack giant eye")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40CthunAttackGiantClawAction : public AttackAction
{
public:
    Aq40CthunAttackGiantClawAction(PlayerbotAI* botAI, std::string const name = "aq40 cthun attack giant claw")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40CthunStomachAttackFleshAction : public AttackAction
{
public:
    Aq40CthunStomachAttackFleshAction(PlayerbotAI* botAI, std::string const name = "aq40 cthun stomach attack flesh")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40CthunBurnBodyAction : public AttackAction
{
public:
    Aq40CthunBurnBodyAction(PlayerbotAI* botAI, std::string const name = "aq40 cthun burn body")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TrashMarkKillOrderAction : public AttackAction
{
public:
    Aq40TrashMarkKillOrderAction(PlayerbotAI* botAI, std::string const name = "aq40 trash mark kill order")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TrashBackpullAction : public MovementAction
{
public:
    Aq40TrashBackpullAction(PlayerbotAI* botAI, std::string const name = "aq40 trash backpull")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TrashSpreadAction : public MovementAction
{
public:
    Aq40TrashSpreadAction(PlayerbotAI* botAI, std::string const name = "aq40 trash spread")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TrashStackForMeteorAction : public MovementAction
{
public:
    Aq40TrashStackForMeteorAction(PlayerbotAI* botAI, std::string const name = "aq40 trash stack for meteor")
        : MovementAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

class Aq40TrashFocusMindslayerAction : public AttackAction
{
public:
    Aq40TrashFocusMindslayerAction(PlayerbotAI* botAI, std::string const name = "aq40 trash focus mindslayer")
        : AttackAction(botAI, name)
    {
    }

    bool Execute(Event event) override;
};

#endif
